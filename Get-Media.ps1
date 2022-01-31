function Get-Media
{
    <#
    .Synopsis
        Gets media metadata
    .Description
        Gets metadata about a media file, using FFProbe.
    .Example
        Get-Media -InputPath $home\Music\ASong.mp3
    .Example
        Get-Media -InputPath $home\Video\AVideo.mp4
    .Link
        Set-Media
    .Link
        Get-RoughDraftExtension
    #>
    [OutputType('RoughDraft.Media', [Management.Automation.Job], [PSObject])]
    [CmdletBinding(DefaultParameterSetName='Probe')]
    param(
    # One or more input paths.
    # If none are provided, all files in the current directory will be passed to Get-Media.
    [Parameter(Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string[]]
    $InputPath,

    # The path to FFProbe.exe.  Download it from http://ffmpeg.org/
    [string]
    $FFProbePath,

    # The path to FFMpeg.exe.  Download it from http://ffmpeg.org/
    [string]
    $FFMpegPath,

    # A list of streams .
    # For example, to show only audio streams, use 'a'
    [Parameter(ParameterSetName='Probe')]
    [string[]]
    $Stream,

    # A list of entries.
    # By default, shows information about streams and formats.
    # For more information about sections, visit [FFMpeg.org](https://ffmpeg.org/ffprobe.html#Main-options)
    [Parameter(ParameterSetName='Probe')]
    [string[]]
    $Entry = @('streams', 'format'),

    # If set, will output packets
    [Parameter(ParameterSetName='Probe')]
    [switch]
    $OutputPacket,

    # If set, will output data
    [Parameter(ParameterSetName='Probe')]
    [switch]
    $OutputData,

    # If set, will output frames
    [Parameter(ParameterSetName='Probe')]
    [switch]
    $OutputFrame,

    # The number of times to retry reading the file.
    [Parameter(ParameterSetName='Probe')]
    [int]
    $ProbeTryCount = 5,

    # If set, will run this in a background job
    [Switch]
    $AsJob
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    begin {
        $allInputsFiles = [Collections.ArrayList]::new()
        $culture = Get-Culture
    }

    process {
        if ($AsJob) { # If -AsJob was passed,
            return & $StartRoughDraftJob # start a background job.
        }
        if ($InputPath) { # If we have one or more -InputPaths
            $allInputsFiles.AddRange($InputPath) # add them to the list.
        } else { 
            # If we have no input add the files in the current directory.
            $allInputsFiles.AddRange((Get-ChildItem -File | Select-Object -ExpandProperty Fullname))
        }
    }

    end {
        $ffProbe = Get-FFProbe -ffProbePath $FFProbePath

        if (-not $ffProbe) # If we still don't a FFProbe command,
        {
            Write-Error "ffprobe not found.  Must provide -ffprobePath at least once or include it in the path." # error
            return # out.
        }

        $ffMpeg = Get-FFMpeg -ffmpegpath $FFMpegPath

        if (-not $ffMpeg) # If we still don't a FFProbe command,
        {
            Write-Error "ffmpeg not found.  Must provide -ffMpegPath at least once or include it in the path." # error
            return # out.
        }

        $count,$total, $progressId = 0, $allInputsFiles.Count, [Random]::new().Next()
        if (-not $allInputsFiles) {
            $allInputsFiles.AddRange(@(0))
            $total = 1
        }
        :nextFile foreach ($in in $allInputsFiles) {
            #region Resolve the Input Path
            $ri =
                if ([IO.File]::Exists($In)) {
                    ([IO.FileInfo]$in).FullName
                } elseif ($in) {
                    $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($In)  |
                        Get-Item -LiteralPath { $_ }|
                        Select-Object -ExpandProperty Fullname
                }

            #endregion Resolve the Input Path

            $paramSetShortName =
                ($PSCmdlet.ParameterSetName -split "\$([IO.Path]::DirectorySeparatorChar)")[-1] -replace
                '\.(rd|RoughDraft)\.(ext|extension)\.ps1$' -replace 'probe'

            $count++
            Write-Progress 'Getting Media Info' "$ri $( if ($paramSetShortName) { "- $paramSetShortName"})" -PercentComplete ($count * 100 / $total) -Id $progressId


            #region Handle Extensions
            $PSBoundParameters['InputPath'] = "$in"
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter (@{} + $PSBoundParameters) |
                Get-RoughDraftExtension -Run -Stream |
                . {
                    begin { $hasOutput = $false
                        
                    }
                    process {
                        $extOut = $_
                        if ($extOut) {
                            $extOut
                            $hasOutput = $true
                        }
                    }
                    end {
                        if ($hasOutput) {
                            continue nextFile
                        }
                    }
                }
            #endregion Handle Extensions
            if (-not $ri) { continue }

            $outObject = [Ordered]@{}
            $outObject.InputPath = "$ri"
            $entryList = $Entry -join ':'

            $selectionAndOutputFormat = @(
                '-hide_banner'
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
            $tries = $ProbeTryCount
            do {
                $metadataJson  = @(& $ffprobe "$ri" @selectionAndOutputFormat 2>&1)
                $jsonLineStart = $metadataJson.IndexOf("{")
                $jsonLineEnd   = $metadataJson.IndexOf("}")

                $jsonOutput = @(
                    $inInfoSection = $false
                    for ($jLine = $jsonLineStart; $jLine -le $jsonLineEnd; $jLine++) {
                        if ($metadataJson[$jLine] -match '^\[') {                            
                            continue
                        }
                        if ($metadataJson[$jLine] -match '^\s{0,}[\{\}\[\]"]') {
                            $metadataJson[$jLine]
                        }                        
                    }
                ) -join [Environment]::NewLine
                if ($jsonOutput) {
                    $metadataJson | Write-Verbose
                    $jsonObject =
                        try {
                            $jsonOutput | ConvertFrom-Json -ErrorAction Stop
                        } catch {
                            Start-Sleep -Milliseconds 50
                            $tries--
                        }
                }
            } while ((-not $jsonObject) -and ($tries -ge 0))

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
                    $streamInfo.pstypenames.clear()
                    $streamInfo.pstypenames.add('RoughDraft.Media.Stream')
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

            $outObject.PSTypeName = 'RoughDraft.Media'
            [PSCustomObject]$outObject
        }

        Write-Progress 'Getting Media Info' " " -Completed -Id $progressId

    }
}
