function Get-Media
{
    <#
    .Synopsis
        Gets media file encoding information
    .Description
        Gets encoding information about a media file, using FFProbe.
    .Example
        Get-Media -InputPath $home\Music\ASong.mp3
    .Example
        Get-Media -InputPath $home\Video\AVideo.mp4
    .Link
        Set-Media
    #>
    [OutputType('RoughDraft.Media')]
    param(
    # The input path
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string[]]
    $InputPath,

    # The path to FFProbe.exe.  Download it from http://ffmpeg.org/
    [string]
    $FFProbePath,

    # A list of streams .  
    # For example, to show only audio streams, use 'a'
    [string[]]
    $Stream,

    # A list of entries.
    # By default, shows information about streams and formats.
    # For more information about sections, visit [FFMpeg.org](https://ffmpeg.org/ffprobe.html#Main-options)
    [string[]]
    $Entry = @('streams', 'format'),    

    # If set, will output packets
    [switch]
    $OutputPacket,

    # If set, will output data
    [switch]
    $OutputData,

    # If set, will output frames
    [switch]
    $OutputFrame,

    # If set, will run this in a background job
    [Switch]
    $AsJob 
    )

    begin {
        $allInputsFiles = [Collections.ArrayList]::new()        
    }

    process {
        if ($AsJob) { # If -AsJob was passed,            
            return & $StartRoughDraftJob # start a background job.
        }
        $allInputsFiles.AddRange($InputPath)
        $culture = Get-Culture
    }

    end {
        $ffProbe = & $findFFProbe -ffProbePath $FFProbePath

        if (-not $ffProbe) # If we still don't a FFProbe command, 
        { 
            Write-Error "ffprobe not found.  Must provide -ffprobePath at least once or include it in the path." # error
            return # out.
        }
        
        $count,$total, $progressId = 0, $allInputsFiles.Count, [Random]::new().Next()

        foreach ($in in $allInputsFiles) {
            #region Resolve the Input Path
            $ri = 
                if ([IO.File]::Exists($In)) {
                    ([IO.FileInfo]$in).FullName
                } else {
                    $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($In)  |
                        Get-Item -LiteralPath { $_ }| 
                        Select-Object -ExpandProperty Fullname
                }        
            if (-not $ri) { continue } 
            #endregion Resolve the Input Path

            if ($total -gt 1) {
                $count++
                Write-Progress 'Getting Media Info' "$ri" -PercentComplete ($count * 100 / $total) -Id $progressId
            }
        
            $outObject = [Ordered]@{}
            $outObject.InputPath = "$ri"
            $entryList = $Entry -join ':'

            $selectionAndOutputFormat = @(
                if ($stream) {
                    "-select-streams"
                    $stream
                }
                if ($ListSection) {
                    '-sections'
                }
                '-show_entries'
                $entryList
                if ($OutputPacket) {
                    '-show_packets'
                }
                if ($OutputData) {
                    '-show_data'
                }
                if ($OutputFrame) {
                    '-show_frames'
                }
                '-of'
                'json'
                
            )
            $tries = 3
            do {
                $metadataJson = & $ffprobe "$ri" @selectionAndOutputFormat 2>&1
                $jsonOutput = $metadataJson[$metadataJson.IndexOf("{")..$metadataJson.IndexOf("}")] -join [Environment]::NewLine
                if ($jsonOutput) {
                    $metadataJson | Write-Verbose
                    $jsonObject = 
                        try {
                            $jsonOutput | ConvertFrom-Json -ErrorAction Stop
                        } catch {
                            $tries--
                        }
                }
            } while (-not $jsonOutput -and $tries -ge 0)
            
            if ($jsonObject) {
                foreach ($prop in $jsonObject.psobject.properties) {
                    if ($prop.Value) {
                        $outObject[$prop.Name] = $prop.Value
                        if ($prop.value.tags -and $prop.name -eq 'format') {
                            foreach ($tagProp in $prop.value.tags.psobject.properties) {
                                if (-not $outObject[$tagProp.Name]) {
                                    $outObject[$tagProp.Name] = $tagProp.Value
                                } else {
                                    $outObject[$tagProp.Name] = @() + $outObject[$tagProp.Name] + $tagProp.Value
                                }                                
                            }
                        }
                    }
                }
            }
            $outObject.FileSize = ($ri -as [IO.FileInfo]).Length
            
            $durations = @(
                :gotDuration do {
                    $durations = 
                        foreach ($streamInfo in $outObject.streams) {
                            if ($streamInfo.duration) {
                                [Timespan]::FromSeconds($streamInfo.duration)
                            } elseif ($streamInfo.tags.duration) {
                                $streamInfo.tags.duration -replace '0{0,6}$' -as [Timespan]
                            } elseif ($streamInfo.tags."DURATION-$($culture.ThreeLetterISOLanguageName.ToLower())") {
                                $streamInfo.tags."DURATION-$($culture.ThreeLetterISOLanguageName.ToLower())" -replace '0{0,6}$' -as [Timespan]
                            } elseif ($streamInfo.tags."DURATION-eng") {
                                $streamInfo.tags.'DURATION-eng' -replace '0{0,6}$' -as [Timespan]
                            }
                        }
                    if ($durations) {
                        $durations
                        continue gotDuration
                    }
                    if ($outObject.format.duration) {
                        $outObject.format.duration -replace '0{0,6}$' -as [Timespan]
                    } elseif ($outObject.format."DURATION-$($culture.ThreeLetterISOLanguageName.ToLower())") {
                        $outObject.format."DURATION-$($culture.ThreeLetterISOLanguageName.ToLower())" -replace '0{0,6}$' -as [Timespan]
                    } elseif ($outObject.format."DURATION-eng") {
                        $outObject.format.'DURATION-eng' -replace '0{0,6}$' -as [Timespan]
                    }
                } while (0)
            )

            $codecTypes = 
                if($outObject.streams) {
                    $outObject.streams | Select-Object -ExpandProperty codec_type -Unique
                } else {$null }

            $codecs = 
                if($outObject.streams) {
                    $outObject.streams | Select-Object -ExpandProperty codec_name -Unique
                } else {$null } 

            if ($codecs) {
                $outObject.CodecTypes = $codecTypes
                $outObject.Codecs = $codecs
            }

            $resolutions = @(
                foreach ($streamInfo in $outObject.Streams) {
                    if ($streamInfo.Width -and $streamInfo.Height) {
                        $streamInfo.Width, $streamInfo.Height
                    }
                }
            )

            $duration = $durations | 
                Select-Object -ExpandProperty TotalMilliseconds | 
                Measure-Object -Maximum | 
                Select-Object -ExpandProperty Maximum
            if ($duration) {
                $outObject.Duration = [Timespan]::FromMilliseconds($duration)
            }

            if ($resolutions) {
                $outObject.Width  = $resolutions[0]
                $outObject.Height = $resolutions[1]
                $outObject.Resolution = "$($resolutions[0])x$($resolutions[1])"
            }
            
            <#
            & $ffprobe "$ri" *>&1 |
                & { 
                    process {
                    $lines = $_ -split "[$([Environment]::NewLine)]" -ne ''
                    foreach ($l in $lines) {
                        if ($l -like "*:*") {
                            $parts = @(foreach ($_ in "$l" -split ":" -ne '') { $_.Trim() })

                            if ($l -like "*Stream #*" -and $parts.Count -gt 1 -and $parts[0] -notlike "from*") {
                                $target = $outObject
                                if ($l -match 'Stream\s{0,}#\s{0,}(?<StreamId>\w+:\w+)') {
                                    if (-not $outObject.Streams) {
                                        $outObject['Streams'] = [ordered]@{}
                                    }
                                    if ($outObject.Streams -is [Collections.IDictionary]) {
                                        $outObject.Streams[$matches.StreamId] = @(
                                            foreach ($_ in $parts[2..($parts.Length - 1)] -join ':' -split ',') {
                                                $_.Trim()
                                            }
                                        )
                                    }
                                }

                            } elseif ($l -like "*:*") {
                                if ($parts.Count -gt 1 -and $parts[0] -notlike "configuration" -and $parts[0] -notlike "built on *") {
                                    if ($lastPart -and -not "$($parts[0].Trim())") {                                    
                                        #"$parts - $($parts.Count)"
                                        $joinedContent = $outObject.$lastPart + [Environment]::NewLine + "$($parts[1])".Trim()
                                        $outObject[$lastPart] = $joinedContent
                                    } else {
                                        $outObject[$parts[0]] = $parts[1..($parts.Length - 1)] -join ':'
                                        $lastPart = $parts[0]
                                    }                                
                                }
                            } elseif ($l -like "*,*") {
                                $lastPart = $null
                                $multipart = $l -split ','
                                foreach ($mp in $multipart) {
                                    $parts = @(foreach ($_ in "$mp" -split ":" -ne '') { $_.Trim() })
                                    if ($parts[0] -like "Stream #*") {
                                        if ($parts.Count -gt 1 -and $parts[0] -notlike "from*") {
                                            $outObject[($parts[0..1] -join ':')] =
                                                ($parts[2..($parts.Length - 1)] -join ':') 
                                            #"$parts - $($parts.Count)"
                                        }
                                    } else {
                                        if ($parts.Count -gt 1 -and $parts[0] -notlike "from*") {
                                            $outObject[$parts[0]] = ($parts[1..($parts.Length - 1)] -join ':') 
                                            #"$parts - $($parts.Count)"
                                        }
                                    }
                                
                                }
                            } 
                    
                        }
                        if ($VerbosePreference -ne 'SilentlyContinue') {
                            Write-Verbose "$l"
                        }
                    }
                
                } }
            #>                        
            $outObject.PSTypeName = 'RoughDraft.Media'
            [PSCustomObject]$outObject
        }
        if ($total -gt 1) {
            Write-Progress 'Getting Media Info' " " -Completed -Id $progressId
        } 
    }
} 
