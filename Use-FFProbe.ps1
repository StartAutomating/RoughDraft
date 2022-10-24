function Use-FFProbe
{
    <#
    .Synopsis
        Uses ffprobe directly.
    .Description
        Runs ffprobe.
    .Example
        Use-FFProbe -FFProbeArgument "$home\Music\ASong.mp3"
    .Link
        Use-FFMpeg
    #>
    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([string])]
    [Alias('ffprobe')]
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
        $ffprobe = Get-FFProbe -ffprobePath $ffprobePath
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
