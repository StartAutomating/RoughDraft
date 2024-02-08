function Use-FFPlay
{
    <#
    .Synopsis
        Uses FFPlay directly.
    .Description
        Runs FFPlay.
    .Example
        Use-FFPlay -FFPlayArgument "$home\Music\ASong.mp3"
    .Link
        Use-FFMpeg
    .Link
        Use-FFPlay
    #>
    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([string])]
    [Alias('ffplay')]
    param(
    # Arguments to FFPlay.
    [Parameter(ValueFromPipelineByPropertyName,ValueFromRemainingArguments)]
    [string[]]
    $FFPlayArgument,

    # The path to FFPlay.
    [string]
    $FFPlayPath,

    # If set, will run as a background job.
    [switch]
    $AsJob
    )

    process {
        #region Find FFPlay
        $FFPlay = Get-FFPlay -FFPlayPath $FFPlayPath
        if (-not $FFPlay) {return}
        #endregion Find FFPlay
        #region Handle -AsJob
        if ($AsJob) {
            return & $startRoughDraftJob
        }
        #endregion Handle -AsJob
        #region Run FFPlay
        Write-Verbose "Invoke FFPlay with $($FFPlayArgument -join ' ')"
        & $FFPlay @FFPlayArgument *>&1 |
            . {
                process {
                    $line = $_
                    "$line"
                }
            }
        #endregion Run FFPlay
    }
}
