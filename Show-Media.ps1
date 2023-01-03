function Show-Media
{
    <#
    .Synopsis
        Shows media
    .Description
        Shows media, using FFPlay
    .Link
        Get-RoughDraftExtension
    .Example
        Show-Media -InputPath $home\Music\ASong.mp3
    .Example
        Show-Media -InputPath $home\Videos\AMovie.mp4 -Fullscreen
    .EXAMPLE
        $cameraName = "NexiGo N60 FHD Webcam" # Replace with your own camera, use Get-FFMpeg -ListCaptureDevice
        $ShowSplat = [Ordered]@{
            DirectShow = $true
            VideoDevice = $CameraName
            Mirror = $true
            TimeMix = 5
            EdgeDetect = $true
            DrawText = $true
            DrawTextFontSize = 24            
            DrawTextFontColor = 'white'
            DrawTextShadowColor = 'black'
            DrawTextBorderWidth = 2
            DrawTextBorderColor = 'black'
            DrawTextCenter = $true
        }
        $showText = @(foreach ($kv in $showSplat.GetEnumerator()) {
            if ($kv.Value -is [bool]) {
                "-$($kv.Key)"
            } else {
                "-$($kv.Key) '$($kv.Value)'"
            }
        }) -join [Environment]::Newline
        $showSplat.DrawTextText = $showText
        Show-Media @showSplat -Fullscreen -Verbose
    #>
    [OutputType([Nullable], [Management.Automation.Job])]
    param(
    # The input path.
    [Parameter(Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # If set, will run as a background job.
    [switch]
    $AsJob,

    # The resolution of the media player.  This can be passed down to extensions that generate video.
    [string]
    $Resolution,

    # The display mode.  When input is audio, defaults to 'Waves'
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateSet('Default','Waves','RDFT')]
    [string]
    $ShowMode,

    # The volume.
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateRange(0,100)]
    [int]
    $Volume,

    # If set, will run fullscreen
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Fullscreen,

    # If set, will keep the player open after the media finishes.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $KeepOpen,

    # If set, will not automatically rotate video.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('NoAutoRotate')]
    [switch]
    $DoNotAutoRotate,

    # Set the x position for the left of the window
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $Left,

    # Set the y position for the top of the window
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $Top,

    # If set, will force the displayed width.
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $Width,

    # If set, will force the displayed height.
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $Height,

    # If set, will not display anything.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $NoDisplay,

    # If set, will run in a borderless window.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $NoBorder,

    # If set, will run in a window that is always on top.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $AlwaysOnTop,

    # If set, this will loop the input source.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Switch]
    $Loop,

    # If set, this will loop the input source any number of times.
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $LoopCount,

    # The number of threads to use for decoding and filtering.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $ThreadCount,

    # The path to FFPlay.  If not provided, this will be automatically detected.    
    [string]
    $FFPlayPath
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter -DynamicParameterSetName 'ExtendedParameters' -NoMandatoryDynamicParameter
    }

    process {
        if ($AsJob) {
            return . $StartRoughDraftJob
        }
        $ffPlay = Get-FFPlay -ffplayPath $FFPlayPath
        if (-not $ffPlay) { return }

        $ffArgs = @(
            '-hide_banner'
            if (-not $KeepOpen) {
                '-autoexit'
            }
            if (-not $DoNotAutoRotate) {
                '-autorotate'
            }
            if ($Fullscreen) {
                '-fs'
            }
            if ($ShowMode -eq 'Waves') {
                '-showmode',1
            }
            if ($ShowMode -eq 'RDFT') {
                '-showmode',2
            }
            
            if ($Resolution) {
                $width, $height = $Resolution -split 'x'
            }

            if ($width) {
                '-x',$Width
            }

            if ($height) {
                '-y', $Height
            }

            if ($PSBoundParameters.ContainsKey('Left') -or $PSBoundParameters.ContainsKey('Top')) {
                '-left', $Left
                '-top', $top
            }

            if ($PSBoundParameters.ContainsKey('Volume')) {
                '-volume', $Volume
            }

            if ($NoDisplay) {'-nodisp'}
            if ($AlwaysOnTop) {'-alwaysontop'}
            if ($NoBorder) {'-noborder'}

            
        )
        $theDuration = $null

        $inputMovieFilter      = ''
        $inputAudioMovieFilter = ''

        $ffInputArgs = @()
        if ($InputPath) {
            $myParams = ([Ordered]@{} + $PSBoundParameters)
            $ri = if ([IO.File]::Exists($InputPath)) {
                $InputPath
            } else {
                $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath) |
                    Get-Item -LiteralPath {$_ } |
                    Select-Object -ExpandProperty Fullname
            }
            
            $escaper = '[\:\(\)'']'
            $replacement = "'\\`$0'"
            $inputMovieFilter      = "movie='$($ri.Replace('\', "'\\\\'") -replace $escaper, $replacement)'"
            $inputAudioMovieFilter = "amovie='$($ri.Replace('\', "'\\\\'") -replace $escaper, $replacement)'"
            

            if ($ri -match '\.m3u$') {
                $myParams.Remove('InputPath')
                Push-Location ($ri | Split-Path)
                Get-Content -LiteralPath $ri | Where-Object { $_ -notlike '#*' } | Get-Item | Show-Media @myParams
                Pop-Location
                return
            }

            $mi = $mediaInfo = Get-Media -InputPath $ri
            $theDuration = $mi.Duration
            
            $ffInputArgs += '-i', $ri
            # If there were one or fewer frames detected (or the media has a miniscule duration )
            if ((-not $theDuration -or $theDuration -eq '0.040000') -and ($mi.streams.nb_frames -le 1)) {     
                $ffInputArgs += '-loop', -1   # automatically loop.
            }
            if ($mi.CodecTypes -and @($mi.CodecTypes)[0] -eq 'Audio' -and (-not ($ffArgs -eq '-showmode'))) {
                $ffInputArgs += '-showmode', '1'
            }            
        }

        :nextFile do {

        #region Handle Extensions
        $in = [Ordered]@{} + $PSBoundParameters
        Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
            . Get-RoughDraftExtension -Run |
            . { process {
                $inObj = $_
                if ($inObj.ExtensionOutput) {
                    Write-Verbose "Adding Filter Parameters from Extension '$extensionCommand'"
                    Write-Verbose "$extensionOutput"
                    $ffArgs += $inObj.extensionOutput
                }
                if ($inObj.Done) {
                    continue nextFile
                }
            } }        
        #endregion Handle Extensions
        } while (0) 

        if ($Loop) {
            $ffInputArgs += '-loop', -1
        }
        if ($LoopCount) {
            $ffInputArgs += '-loop', $LoopCount
        }

        $progressId = Get-Random

        $filterParams = $ffArgs
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
                    if ($thisFilterParam -eq '-af') {
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

            $ffArgs = $filterParams = $newFilterParams
        }

        if (-not $($ffArgs -eq 'lavfi')) {
            $ffArgs = $ffInputArgs + $ffArgs
        }

        if ($ThreadCount) {
            $ffArgs += "-filter_threads", $ThreadCount            
        }

        $lastTime = $null
        Use-FFPlay -FFPlayArgument $ffArgs |
            ForEach-Object {
                $line= $_
                if ($line -like '*:*=*') {
                    $lineParts = @($line -split '\s' -ne '')
                    if ($lineParts[0] -as [double]) {
                        $perc = if ($theDuration -and ($lineParts[0] -as [double])) {
                            $linePartsDouble = $lineParts[0] -as [double]
                            if ("$linePartsDouble" -and "$linePartsDouble" -ne 'nan') {
                                $lastTime = [Timespan]::FromSeconds($lineParts[0] -as [double])
                                $lastTime.TotalSeconds * 100/ $theDuration.TotalSeconds
                            } else { 0 }
                        }
                        else {
                            (($lineParts[0] -as [int]) % 60)*100/60
                        }
                        Write-Progress "Playing @ $($lineParts[0])s" " $InputPath" -Id $progressId -PercentComplete ([Math]::Min($perc, 100))
                    }
                }
                Write-Verbose $line
            }

        Write-Progress "Playing" " $InputPath" -Completed -Id $progressId

        # If we stopped before the end
        if ($theDuration -and ($lastTime -lt $theDuration) -and # and we're calling ourselves recursively
            @(Get-PSCallStack | Where-Object { $_.InvocationInfo.MyCommand -eq $myCmd }).Count -ge 2) {
            break out # break to a non-existent label, which will stop the current scipt.
        }
    }
}
