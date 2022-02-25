function Receive-Media
{
    <#
    .Synopsis
        Receives Media from an Input
    .Description
        Receives media from inputs.
    .Notes
        Stopping a script that is receiving media with CTRL+C may prevent certain filetypes from being finalized.

        For best results, use a filetype designed for streaming, such as .wav for audio or .mpg for video.

        Alternatively, if you run Receive-Media -AsJob, stopping the job will normally allow FFMpeg to finalize.
    #>
    param(
    # The input device type.
    [Parameter(ParameterSetName='InputDevice',ValueFromPipelineByPropertyName)]
    [string]
    $InputType,

    # The input device identifier.  This will be specific to a given input type.
    [Parameter(ParameterSetName='InputDevice',ValueFromPipelineByPropertyName)]
    [string]
    $InputDevice,

    # If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Pix_Fmt')]
    [string]
    $PixelFormat,

    # The frame rate of the outputted video
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FrameRate,

    # The number of frames to output.        
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FrameCount,

    # A list of additional arguments to FFMpeg.
    [Alias('Arguments','Argument')]
    [string[]]
    $ArgumentList,

    # If set, will save output to a file
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath,
    
    # If set, will run as a background job.
    [switch]
    $AsJob,

    # The path to FFMpeg.exe.  By default, checks in the path.
    [string]
    $FFMpegPath
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        if ($AsJob) { # If -AsJob was passed,
            return & $StartRoughDraftJob # start a background job.
        }

        :receivingMedia do {

            #region Handle Extensions        
            $extensionArguments = @()
        
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Arguments from Extension '$extensionCommand'"
                        Write-Verbose "$($inObj.extensionOutput)"
                        $extensionArguments += $inObj.extensionOutput
                    }
                    if ($inObj.Done) {
                        break receivingMedia
                    }
                } }

            #endregion Handle Extensions
            $allArguments = @()
            if ($InputType -and $InputDevice) {
                $allArguments += '-f', $InputType, '-i', $InputDevice
            }

            if ($extensionArguments) {
                $allArguments += $extensionArguments
            }

            if ($PixelFormat) {
                $allArguments += '-pix_fmt', $PixelFormat
            }

            if ($FrameRate) { # If -FrameRate was passed
                $allArguments += "-r" # use '-r' to set it.
                $allArguments += "$FrameRate"
            }
            
            if ($FrameCount) {
                $allArguments += "-frames" # use '-r' to set it.
                $allArguments += "$FrameCount"
            }

            $allArguments += $ArgumentList
            if ($OutputPath) {
                $allArguments += '-y', $OutputPath
            }

            $ProgId = Get-Random
            Write-Verbose "FFMpeg Arguments: $allArguments"

            Use-FFMpeg -FFMpegArgument $allArguments -FFMpegPath $FFMpegPath |
                ForEach-Object {
                    $outLine = $_
                    Write-Verbose $outLine

                    $progress = $outLine | & ${?<FFMpeg_Progress>} -Extract
                    if ($progress -and 
                        $progress.Time.Totalmilliseconds
                    ) {
                        Write-Progress "Receving Media" "$($progress.Time)" -Id $ProgId
                    }
                }

            Write-Progress "Receving Media" "$($progress.Time)" -Id $ProgId -Completed
        } while ($false)
    }    
}
