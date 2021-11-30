function Invoke-FFMpeg
{
    <#
    .Synopsis
        Invokes ffmpeg.
    .Description
        Runs ffmpeg
    .Example
        Invoke-FFMpeg -FFMpegArgument '-i', "`"$home\Video\A.mp4`"", "`"$home\Music\A.mp3`""
    .Link
        Invoke-FFProbe
    .Link
        Invoke-FFPlay
    #>
    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([string])]
    param(
    # Arguments to FFMpeg.
    [Parameter(ValueFromPipelineByPropertyName,ValueFromRemainingArguments)]
    [string[]]
    $FFMpegArgument,

    # The path to FFMpeg.
    [string]
    $FFMpegPath,

    # If set, will run as a background job.
    [switch]
    $AsJob
    )

    process {
        #region Find FFMpeg
        $ffMpeg = & $findFFMpeg -ffmpegPath $FFMpegPath

        if (-not $ffmpeg) {return}
        #endregion Find FFMpeg
        #region Handle -AsJob
        if ($AsJob) {
            return & $startRoughDraftJob
        }
        #endregion Handle -AsJob

        #region Run FFMpeg
        Write-Verbose "Invoke FFMpeg with $($ffmpegArgument -join ' ')"
        & $ffmpeg @FFMpegArgument *>&1 |
            . {
                process {
                    $line = $_
                    "$line"
                }
            }
        #endregion Run FFMpeg
    }
}
