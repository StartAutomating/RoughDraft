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
    .Link
        Use-RoughDraftExtension
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
        $myCmd = $MyInvocation.MyCommand
        Use-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        if ($PSCmdlet.ParameterSetName -ne 'GetFFMpegPath') {
            $ffmpeg = Get-FFMpeg -FFMpegPath $FFMpegPath
            #region Handle Extensions
            $PSBoundParameters['InputPath'] = "$in"
            do {
            Use-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter (@{} + $PSBoundParameters) |
                . { process {
                    $ext = $_
                    $ExtensionParameter = ([Ordered]@{})
                    foreach ($kv in $ext.ExtensionParameter.getEnumerator()) {
                        if ($ext.ExtensionCommand.Parameters[$kv.Key]) {
                            $ExtensionParameter[$kv.Key] = $kv.Value
                        }
                    }
                    . $ext.ExtensionCommand @ExtensionParameter
                    break
                } }
            } while (0)
            #endregion Handle Extensions
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