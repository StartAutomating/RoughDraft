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
    .Link
        Use-RoughDraftExtension
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
        Use-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        #region Find FFMpeg
        $ffmpeg = & $findFFMpeg -FFMpegPath $ffMpegPath
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
            Use-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter (@{} + $PSBoundParameters) |
                . Use-RoughDraftExtension -Run | 
                . { process { 
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Filter Parameters from Extension '$extensionCommand'"
                        Write-Verbose "$extensionOutput"
                        $FilterParams += $extensionOutput
                    }
                    if ($inObj.Done) {
                        continue nextFile
                    }
                } }
        } while (0)
        #endregion Handle Extensions

        $allFffMpegArgs = @('-hide_banner') +  $ffmpegArgs + $FilterParams + $ffEndArgs

        Invoke-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $allFffMpegArgs |
            & { process {
                Write-Verbose "$_ "
            } } 

        Get-Item -Path $uro -ErrorAction SilentlyContinue
    }
}

