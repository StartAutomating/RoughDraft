function Measure-Media
{
    <#
    .Synopsis
        Measures Media Files
    .Description
        Measures Media Files using a variety of filters
    .Example
        Measure-Media -InputPath $home\Music\ASong.mp3 -SilenceDetect
    .Example
        Measure-Media -InputPath $home\Videos\AMovie.mp4 -BlackDetect
    .Link
        Get-RoughDraftExtension
    .Link
        Use-RoughDraftExtension
    #>
    [CmdletBinding(DefaultParameterSetName='None')]
    [OutputType([PSObject])]
    param(
    # The input path
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName,ValueFromPipeline)]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FFMpegPath,

    # If set, will run as a background job.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $AsJob
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Use-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        if ($AsJob){
            . $startRoughDraftJob
            return 
        }
        $ri = if ([IO.File]::Exists($InputPath)) {
            $InputPath
        } else {
            $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath)
        }
        $myCmd = $MyInvocation.MyCommand
        $mi = Get-MediaInfo -InputPath $ri

        if (-not $mi.CodecTypes) { return }

        $theDuration = $mi.Duration
        $progId = Get-Random
        
        #region Handle Extensions
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
            } }
       #endregion Handle Extensions


        
        
    }
}
