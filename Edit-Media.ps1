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
    [Parameter(Position=2,ValueFromPipelineByPropertyName)]
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

    # The metadata to put in the converted file
    [Collections.IDictionary]
    $MetaData,

    # The timespan to start
    [Parameter(ValueFromPipelineByPropertyName)]
    [Timespan]
    $Start,

    # The time span to end
    [Parameter(ValueFromPipelineByPropertyName)]
    [Timespan]
    $End,

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
    $ComplexFilter
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
        if (-not $start) { $start = [Timespan]::FromMilliseconds(0) }
        if (-not $end -and $mediaInfo.Duration)   { $end = $MediaInfo.Duration }
        $theDuration = $End - $Start
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

        $ffInFiles = @(
            foreach ($in in $InputPath) {
                if ([IO.File]::Exists($In)) {
                    '-i'
                    ([IO.FileInfo]$in).FullName
                } else {
                    '-i'
                    "$($ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($in) | Get-Item |Select-Object -ExpandProperty Fullname)"
                }
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

        # Write the arguments out to verbose
        Write-Verbose "FFMpeg Arguments -i $ri -ss `"$start`" -to `"$end`" $($filterParams -join ' ') $uro -y $($ffmpegParams -join ' ')"
        $ffMpegFullArgs = @(
            $ffInFiles
            '-ss'
            "$start"
            if ("$end") {
                '-to'
                "$end"
            }
            $filterParams
            $ffmpegParams
            $OutParams
            
        )

        $timeArgs  =  @(
            '-ss'
            "$start"
            if ("$end") {
                '-to'
                "$end"
            }
        )

        if ($WhatIfPreference) { return $ffMpegFullArgs } # If -WhatIf was passed, return the FFMpeg Arguments

        if (-not $PSCmdlet.ShouldProcess("$($ffMpegFullArgs -join ' ')")) { return } # Otherwise, check ShouldProcess
        & $ffmpeg @ffInFiles @timeArgs @filterParams @ffmpegParams @outParams 2>&1 |
            ForEach-Object -Process $processFFMpegOutput -End $endFFMpegOutput

        if ($uro) { # If we had a single output
            Get-Item -ErrorAction SilentlyContinue -LiteralPath $uro # get it.
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
