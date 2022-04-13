function Edit-Media
{
    <#
    .Synopsis
        Edits media files
    .Description
        Modifies media files to apply advanced filters
    .Notes
        Edit-Media will return the output file, which can in turn be piped into the next Edit-Media.
        Each parameter set of Edit-Media will perform one and only one action.
        Using Edit-Media in a fluent pipeline will allow you to easily control the order in which actions are applied.
    .Example
        Get-Item a.mp4 |
            Edit-Media -FadeIn |
            Edit-Media -Rotate 90
    .Link
        Convert-Media
    .Link
        Get-Media
    .Link
        Get-RoughDraftExtension
    #>
    [CmdletBinding(DefaultParameterSetName='None',SupportsShouldProcess)]
    [OutputType([IO.FileInfo])]
    param(
    # The input path
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string[]]
    $InputPath,

    # The output path.  If not provided, the output path will be named for the current edit action, i.e. 1_FadeIn.mp4
    [Parameter(Position=1,ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath,

    # The output map.  This can be provided to map multiple outputs from a single input.
    [Collections.IDictionary]
    $OutputMap,

    # The coded used for the conversion
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Codec,

    # The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FFMpegPath,

    # If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Pix_Fmt')]
    [string]
    $PixelFormat = 'yuv420p',

    # If provided, will use an ffmpeg preset to encode.
    # This maps to the --preset parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Preset,

    # If provided, will use a set of encoder settings to "tune" the video encoder.
    # Not supported by all codecs.  This maps to the --tune parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Tune,

    # The metadata to put in the converted file
    [Collections.IDictionary]
    $MetaData,

    # The start time within the media. 
    # This maps to the ffmpeg parameter -ss.
    [Parameter(Position=2, ValueFromPipelineByPropertyName)]
    [Alias('StartTime')]
    [Timespan]
    $Start,

    # The end time within the media. 
    # This maps to the ffmpeg parameter -to.
    [Parameter(Position=3, ValueFromPipelineByPropertyName)]
    [Alias('EndTime')]
    [Timespan]
    $End,

    # The duration of the media.
    # This maps to the ffmpeg parameter -t.
    [Parameter(Position=4, ValueFromPipelineByPropertyName)]
    [Timespan]
    $Duration,

    # A series of video filters.  
    # The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $VideoFilter,

    # A series of audio filters.  
    # The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $AudioFilter,

    # A series of complex filters.  The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.
    [Collections.IDictionary[]]
    $ComplexFilter,

    # Any additional arguments to FFMpeg
    [Parameter(ValueFromRemainingArguments)]
    [string[]]
    $FFMpegArgument,

    # If set, will ignore any previously generated content.
    [switch]
    $Force
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter -NoMandatoryDynamicParameter -DynamicParameterSetName "__AllParameterSets" 
    }

    begin {
        $ErrorList = @()
        $progId = Get-Random
        $processFFMpegOutput =
            {
                $line = $_
                $progress = $line | & ${?<FFMpeg_Progress>} -Extract
                $allOutput += $line
                if ($progress -and 
                    $progress.Time.Totalmilliseconds -and 
                    $theDuration.TotalMilliseconds
                ) {
                    $perc = $progress.Time.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
                    $frame, $speed, $bitrate  = $progress.FrameNumber, $progress.Speed, $progress.Bitrate
                    if ($perc -gt 100) { $perc = 100 }
                    $progressMessage = 
                        @("$($progress.Time)".Substring(0,8), "$theDuration".Substring(0,8) -join '/'
                            "Frame: $frame","Speed $speed","Bitrate $bitrate" -join ' - '
                        ) -join ' '                        
                    $timeLeft = $theDuration - $progress.Time
                    Write-Progress "$uro " $progressMessage -PercentComplete $perc -Id $ProgId -SecondsRemaining $timeLeft.TotalSeconds
                    Write-Verbose "$_"
                }
                else {
                    if ($_ -like "*error*" -or $_ -like "*unable*" -or $inErrorState) {
                        $inErrorState = $true
                        $ErrorList += "$_".Trim()
                        Write-Verbose "$_"
                    } else {
                        Write-Verbose "$_"
                    }
                }
            }

        $endFFMpegOutput = {
            if ($ErrorList.Count) {
                Write-Error "$($ErrorList -join ([Environment]::NewLine))"
            }
        }
    }

    process {
        #region Find FFMpeg
        $ffmpeg = Get-FFMpeg -FFMpegPath $ffMpegPath
        if (-not $ffmpeg) { return }
        #endregion Find FFMpeg
        $myParams = [Ordered]@{} + $PSBoundParameters
        $ri =
            if ([IO.File]::Exists($InputPath[0])) {
                $InputPath[0]
            } else {
                $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath[0])
            }

        if (-not $OutputPath -and -not $OutputMap.Count) {
            $inputItem = Get-Item -LiteralPath $ri
            $CanRunExtensions  = Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $myParams
            $paramSetShortName =
                @(foreach ($canRunExt in $CanRunExtensions) { $canRunExt.ExtensionCommand.DisplayName }) -join '_'
            $OutputPath = $inputItem.Fullname.Substring(0, $inputItem.FullName.Length - $inputItem.Extension.Length) + "_$paramSetShortName" + $inputItem.Extension
        }
        $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)


        $mediaInfo = Get-Media -InputPath $ri
        if ($Start -or $end){
            if (-not $Start) {
                $start = [TimeSpan]::FromMilliseconds(0)
            }
            if (-not $end) {
                $end = $theduration
            }
            $theduration = $end - $Start
        }
        elseif ($Duration.TotalMilliseconds) {
            $theDuration = $Duration
        }    

        $ffmpegParams = @()

        if ($Codec) {

            $foundSeparator = $false
            $codecList = Get-FFMpeg -ListCodec

            $matchingCodec = $codecList | Where-Object {$_.Codec -like $codec -or $_.FullName -like $codec } | Select-Object -First 1

            if (-not $matchingCodec) {
                Write-Error "Codec not found.  Try one of the following items $($codecList | Where-Object {$_.CanEncode } | Select-Object Codec, Fullname | Out-String)"
                return
            }

            $ffmpegParams += "-c"
            $ffmpegParams += "$($matchingCodec.Codec)"
        }

        if ($mediaInfo.streams -and @($mediainfo.streams)[0].codec_type -eq 'video') {
            $ffmpegParams += '-pix_fmt', $PixelFormat
        }

        if ($tune) { # If -Tune was provided
            $filterParams += '-tune', $tune # add the -tune parameter.
        }

        if ($Preset) { # If -Preset was provied
            $filterParams += '-preset', $Preset # add the -preset parameter.
        }

        $filterParams = @()

        if ($MetaData) {
            foreach ($kv in $metaData.GetEnumerator()) {
                $filterParams += "-metadata"
                $filterParams+= "`"$($kv.Key)`"=`"$($kv.Value)`""
            }
        }

        if ($VideoFilter) {
            foreach ($kv in $VideoFilter.GetEnumerator()) {
                $filterParams += "-vf"
                $filterString = "$($kv.Key)=".ToLower()
                if ($kv.Value -is [Collections.IDictionary]) {
                    $filterString += '"'
                    $filterString += @(foreach ($ikv in $kv.Value.GetEnumerator()) {
                        "$($ikv.Key)=$($ikv.Value.ToString().Replace(',','\,').Replace(':','\:'))"
                    }) -join ':'
                    $filterString += '"'
                } elseif ($kv.Value.ToString().Trim()) {
                    $filterString += "$($kv.Value.ToString().Replace(',','\,').Replace(':','\:'))"
                }
                $filterParams += $filterString
            }
        }

        if ($AudioFilter) {
            foreach ($kv in $AudioFilter.GetEnumerator()) {
                $filterParams += "-af"
                $filterString = "$($kv.Key)=".ToLower()
                if ($kv.Value -is [Collections.IDictionary]) {
                    $filterString += '"'
                    $filterString += @(foreach ($ikv in $kv.Value.GetEnumerator()) {
                        "$($ikv.Key)=$($ikv.Value.ToString().Replace(',','\,').Replace(':','\:'))"
                    }) -join ':'
                    $filterString += '"'
                } elseif ($kv.Value.ToString().Trim()) {
                    $filterString += "$($kv.Value.ToString().Replace(',','\,').Replace(':','\:'))"
                }
                $filterParams += $filterString
            }
        }


        if ($ComplexFilter) {
            foreach ($cf in $ComplexFilter) {
                $filterParams += "-filter_complex"
                $filterParams +=
                @(foreach ($kv in $cf.GetEnumerator()) {
                    "$($kv.Key)=".ToLower() +
                    $(if ($kv.Value -is [Collections.IDictionary]) {
                        @(foreach ($ikv in $kv.Value.GetEnumerator()) {
                            "$($ikv.Key)=$($ikv.Value.ToString().Replace(',','\,').Replace(':','\:'))"
                        }) -join ':'
                    } elseif ($kv.Value.ToString().Trim()) {
                        "$($kv.Value.ToString().Replace(',','\,').Replace(':','\:'))"
                    })

                }) -join ','
            }
        }

        $ffInFileInfos = @(
            foreach ($in in $InputPath) {
                if ([IO.File]::Exists($In)) {
                    [IO.FileInfo]$in
                } else {
                    $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($in) | Get-Item
                }
            }
        )

        $ffInFiles = @(
            foreach ($in in $ffInFileInfos) {                    
                '-i'
                $in.FullName                
            }
        )

        

        $outParams = @(
            if ($OutputPath -and $uro) {
                $uro
                '-y'
            } elseif ($OutputMap.Count) {
                foreach ($kv in $OutputMap.GetEnumerator()) {
                    '-map'
                    if ($kv.Key -match '\[\w+\]') {
                        $kv.Key
                    } else {
                        "[$($kv.Key)]"
                    }
                    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($kv.Value).ToString()
                }
                '-y'
            }
        )

        #region Handle Extensions
        Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $myParams |
            . Get-RoughDraftExtension -Run |
            . { process {
                $inObj = $_
                if ($inObj.ExtensionOutput) {
                    Write-Verbose "Adding Filter Parameters from Extension '$($inObj.extensionCommand)'"
                    Write-Verbose "$($inObj.extensionOutput)"
                    $FilterParams += $inObj.extensionOutput
                }
                if ($inObj.Done) {
                    continue nextFile
                }
            } }
        #endregion Handle Extensions


        $allVideoFilters = @()
        $allAudioFilters = @()        
        
        for ($filterParamNumber =0 ; $filterParamNumber -lt $filterParams.Count;$filterParamNumber++) {
            $thisFilterParam = $filterParams[$filterParamNumber]
            if ($thisFilterParam -eq '-af') {
                $allAudioFilters += $filterParams[$filterParamNumber + 1]
                $filterParamNumber++
            }
            if ($thisFilterParam -eq '-vf') {
                $allVideoFilters += $filterParams[$filterParamNumber + 1]
                $filterParamNumber++
            }
        }

        if ($allVideoFilters.Count -gt 1 -or $allAudioFilters.Count -gt 1) {
            $newFilterParams = @(
                for ($filterParamNumber =0 ; $filterParamNumber -lt $filterParams.Count;$filterParamNumber++) {
                    $thisFilterParam = $filterParams[$filterParamNumber]
                    if ($thisFilterParam -eq '-af' -and $allAudioFilters) {
                        if ($allAudioFilters) {
                            '-af'
                            $allAudioFilters -join ','
                            $allAudioFilters = @()
                        }
                        $filterParamNumber++        
                    }
                    elseif ($thisFilterParam -eq '-vf') {
                        if ($allVideoFilters) {
                            '-vf'
                            $allVideoFilters -join ','
                            $allVideoFilters = @()
                        }
                        $filterParamNumber++
                    } else {
                        $thisFilterParam
                    }
                }
            )

            $filterParams = $newFilterParams
        }

        #region Determine Timeframe
        $TimeFrame =@()
        if ($Start -and $start.TotalMilliseconds -ge 0) { # If we were provided a start time
            $TimeFrame += '-ss' # Use -ss.
            $TimeFrame += "$Start"
        }

        if ($End -and $end.TotalMilliseconds -ge 0) { # If we were provided an end
            if (-not $PSBoundParameters.Start -and -not ($Loop -or $LoopCount)) { # if we didn't get a start and we're not looping
                $TimeFrame += '-ss'
                $TimeFrame += "$([Timespan]::FromMilliseconds(0))" # set start to 0
            }
            $TimeFrame += '-to' # then use '-to' to set the end time.
            $TimeFrame += "$End"
        }

        if ($Duration) {
            $TimeFrame += '-t'
            $TimeFrame += "$($Duration.TotalSeconds)"
        }
        #endregion Determine Timeframe

        # Write the arguments out to verbose
        
        $ffMpegFullArgs = @(
            $ffInFiles
            $TimeFrame
            $filterParams
            $ffmpegParams
            $FFMpegArgument
            $OutParams            
        )

        Write-Verbose "FFMpeg Arguments: $ffMpegFullArgs"

        if ($WhatIfPreference) { return $ffMpegFullArgs } # If -WhatIf was passed, return the FFMpeg Arguments.
        if ($uro -and (Test-Path $uro)) {
            # If we have only one output, and it already exists.
            $ExistingOutput = Get-Item -LiteralPath $uro
            if ($ExistingOutput.Length -gt 0) {
                $clixmlPath     = 
                        Join-Path $ExistingOutput.Directory.FullName (
                            '.' + 
                            $ExistingOutput.Name.Substring(0,$ExistingOutput.Name.Length - $ExistingOutput.Extension.Length) + 
                            ".$myCmd.RoughDraft.xml"
                        )
                if (Test-Path $clixmlPath) {
                    $existingData = Import-Clixml -LiteralPath $clixmlPath
                    if (-not $MyParams.Force -and 
                        $existingData.FFArgs -eq ($ffMpegFullArgs -join ' ') -and
                        $existingData.InputLastWriteTime -EQ $ffInFileInfos[0].LastWriteTime
                    ) {
                        Get-Item -ErrorAction SilentlyContinue -LiteralPath $uro
                        return
                    }
                }
            }
        }        
        if (-not $PSCmdlet.ShouldProcess("$($ffMpegFullArgs -join ' ')")) { return } # Check ShouldProcess, and return if we shouldn't.
        $allOutput = @()
        & $ffmpeg @ffInFiles @TimeFrame @filterParams @ffmpegParams @FFMpegArgument @outParams 2>&1 |
            ForEach-Object -Process $processFFMpegOutput -End $endFFMpegOutput
        
        
        if ($uro) { # If we had a single output
            $existingOutput = Get-Item -ErrorAction SilentlyContinue -LiteralPath $uro # get it.
            $existingOutput
            $clixmlPath     = 
                if ($ExistingOutput) {
                    Join-Path $ExistingOutput.Directory.FullName (
                            '.' + 
                            $ExistingOutput.Name.Substring(0,$ExistingOutput.Name.Length - $ExistingOutput.Extension.Length) + 
                            ".$myCmd.RoughDraft.xml"
                    )
                }

            if ($clixmlPath) {
                [PSCustomObject][Ordered]@{
                    PSTypeName = 'RoughDraft.Log'
                    FFArgs = $ffMpegFullArgs -join ' '
                    FFOutput = $allOutput -join ' '
                    InputLastWriteTime = $ffInFileInfos[0].LastWriteTime
                    OutputPath = "$uro"
                } | 
                    Export-Clixml -Path $clixmlPath
            }            
        } elseif ($OutputMap.Count) { # If we had an output map
            foreach ($kv in $OutputMap.GetEnumerator()) {
                $rp = # Find each file in the map
                    try {
                        $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($kv.Value)
                    } catch {
                        $null
                    }

                if ($rp) { Get-Item -LiteralPath $rp } # and output it.
            }
        }
    }
}
