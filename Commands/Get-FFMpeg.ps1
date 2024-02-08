function Get-FFMpeg
{
    <#
    .Synopsis
        Gets FFMpeg
    .Description
        Gets FFMpeg, if installed
    .Example
        Get-FFMpeg
    .Link
        Use-FFMpeg
    .Link
        Get-RoughDraftExtension
    #>
    [Outputtype([string])]
    [CmdletBinding(DefaultParameterSetName='GetFFMpegPath')]
    param(
    # The path to FFMpeg
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FFMpegPath
    )

    dynamicParam {
        Get-RoughDraftExtension -CommandName $MyInvocation.MyCommand -DynamicParameter
    }

    process {
        if ($PSCmdlet.ParameterSetName -ne 'GetFFMpegPath') {
            $ffmpeg = Get-FFMpeg -FFMpegPath $FFMpegPath
            #region Handle Extensions
            $PSBoundParameters['InputPath'] = "$in"
            
            Get-RoughDraftExtension -CommandName $MyInvocation.MyCommand -Run -ExtensionParameter (@{} + $PSBoundParameters) -Stream
            return
        }
        if ($script:KnownFFMpegPath) {
            return $script:KnownFFMpegPath
        }


        if ($ffMpegPath) {
            $ffMpegAtPath = $ExecutionContext.SessionState.InvokeCommand.GetCommand($ffMpegPath, 'Application')
            if ($ffMpegAtPath) {
                $script:KnownFFMpegPath = $ffMpegAtPath.Source
                return $script:KnownFFMpegPath
            }
        }

        $ffMpegInPath = $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffmpeg', 'Application')
        if ($ffMpegInPath) {
            $script:KnownFFMpegPath = $ffMpegInPath.Source
            return $script:KnownFFMpegPath
        }

        if ($env:ProgramFiles) {
            $ffMpegInProgramFiles =
                $ExecutionContext.SessionState.InvokeCommand.GetCommand((
                    Join-Path (Join-Path (Join-Path $env:ProgramFiles ffmpeg) 'bin') 'ffmpeg.exe'
                ), 'Application')

            if ($ffMpegInProgramFiles) {
                $script:KnownFFMpegPath = $ffMpegInProgramFiles.Source
                return $script:KnownFFMpegPath
            }
        }
    

        throw "Cannot find ffmpeg"
    }
}