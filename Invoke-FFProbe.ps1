﻿function Invoke-FFProbe
{
    <#
    .Synopsis
        Invokes ffprobe.
    .Description
        Runs ffprobe.
    .Example
        Invoke-FFProbe -FFProbeArgument "$home\Music\ASong.mp3"
    .Link
        Invoke-FFMpeg
    #>
    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([string])]
    param(
    # Arguments to ffprobe.
    [Parameter(ValueFromPipelineByPropertyName,ValueFromRemainingArguments)]
    [Alias('FFProbeArguments','Argument','Arguments')]
    [string[]]
    $FFProbeArgument,

    # The path to FFProbe
    [string]
    $FFProbePath,

    # If set, will launch in a background job.
    [switch]
    $AsJob
    )

    process {
        #region Find FFProbe
        $ffprobe = & $findffprobe -ffprobePath $ffprobePath        
        if (-not $ffprobe) {return}
        #endregion Find FFProbe
        #region Handle -AsJob
        if ($AsJob) {
            return & $startRoughDraftJob
        }
        #endregion Handle -AsJob
        #region Run FFProbe
        Write-Verbose "Invoke ffprobe with $($ffprobeArgument -join ' ')"
        & $ffprobe @ffprobeArgument *>&1 | 
            . {                
                process {
                    $line = $_
                    "$line"
                }                
            }
        #endregion Run FFProbe
    }
}
