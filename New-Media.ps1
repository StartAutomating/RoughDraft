function New-Media {
    <#
    .Synopsis
        Creates media files
    .Description
        Creates audio and video files using ffmpeg
    .Example
        New-Media -OutputPath ".\RGBTestSource.mp4" -TestSource "RGBTestSrc"
    .Link
        Get-RoughDraftExtension
    #>
    [OutputType([IO.FileInfo], [Management.Automation.Job])]
    param(
    # The output path
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath,

    # The duration.  By default, one second.
    [Timespan]
    $Duration = '00:00:01',

    # The resolution.  This can be independently handled by an extension.
    [string]
    $Resolution,

    # If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Pix_Fmt')]
    [string]
    $PixelFormat =  'yuv420p',

    # If set, will create the media in a background job.
    [switch]
    $AsJob
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        #region Find FFMpeg
        $ffmpeg = Get-FFMpeg -FFMpegPath $ffMpegPath
        if (-not $ffmpeg) { return }
        #endregion Find FFMpeg
        if ($AsJob) {
            return & $startRoughDraftJob
        }

        $FilterParams = @()
        $ffmpegArgs = @()
        $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)
        $ffEndArgs  = @('-pix_fmt', $PixelFormat, '-t', $Duration.TotalSeconds, '-y', "$uro")

        #region Handle Extensions
        :nextFile do {
            $myParams = ([Ordered]@{} + $PSBoundParameters)
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $myParams |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Filter Parameters from Extension '$($inObj.ExtensionCommand)'"
                        Write-Verbose "$extensionOutput"
                        $FilterParams += $inObj.ExtensionOutput
                    }
                    if ($inObj.Done) {
                        continue nextFile
                    }
                } }
        } while (0)
        #endregion Handle Extensions

        $allFffMpegArgs = @('-hide_banner') +  $ffmpegArgs + $FilterParams + $ffEndArgs
        $progressId = Get-Random
        $theDuration = $Duration
        Use-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $allFffMpegArgs |
            & { process {
                $line = $_
                $Progress = $line | & ${?<FFMpeg_Progress>} -Extract
                if ($Progress -and $Progress.Time -and $TheDuration) {
                    $perc = $Progress.Time.TotalMilliseconds * 100/ $duration.TotalMilliseconds
                    if ($perc -gt 100) { $perc = 100}
                    $frame, $speed, $bitrate  = $progress.FrameNumber, $progress.Speed, $progress.Bitrate
                    $progressMessage = 
                        @("$($progress.Time)".Substring(0,8), "$theDuration".Substring(0,8) -join '/'
                            "Frame: $frame","Speed $speed","Bitrate $bitrate" -join ' - '
                        ) -join ' '                        
                    $timeLeft = $theDuration - $progress.Time
                    Write-Progress "Creating $OutputPath" $progressMessage -PercentComplete $perc -Id $progressId  -SecondsRemaining $timeLeft.TotalSeconds
                }
                Write-Verbose "$_ "
            }}

        Write-Progress "Creating" "$OutputPath " -Completed -Id $progressId
        Get-Item -Path $uro -ErrorAction SilentlyContinue
    }
}

