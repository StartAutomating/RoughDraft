function Use-FFMpeg
{
    <#
    .Synopsis
        Uses ffmpeg directly.
    .Description
        Runs ffmpeg directly.
    .Example
        Use-FFMpeg -FFMpegArgument '-i', "`"$home\Video\A.mp4`"", "`"$home\Music\A.mp3`""
    .Link
        Use-FFProbe
    .Link
        Use-FFPlay
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
        $ffMpeg = Get-FFMpeg -ffmpegPath $FFMpegPath

        if (-not $ffmpeg) {return}
        #endregion Find FFMpeg
        #region Handle -AsJob
        if ($AsJob) {
            return & $startRoughDraftJob
        }
        #endregion Handle -AsJob

        #region Run FFMpeg
        Write-Verbose "Invoke FFMpeg with $($ffmpegArgument -join ' ')"        
        $outputLines = [Collections.ArrayList]::new()
        & $ffmpeg @FFMpegArgument *>&1 |
            . {
                process {                    
                    $line = $_
                    $null = $outputLines.Add($line)
                    $lineIsError = $line -match '^\[[^\]]+\]\sError'
                    $errorMessage = @()
                    if ($lineIsError) { # If the line is an error
                        $errorLines = @(
                            $outputLines[$outputLines.Count - 2] # the previous line should have some context.
                            $line
                        )
                        $errorMessage = @(foreach ($errorLine in $errorLines) {
                            $errorLine -replace '^\[[^\]]+\]\s{0,}'
                        }) -join [Environment]::NewLine                        
                    } elseif ($line -match '^Error') {
                        $errorMessage = @(for ($outLineNumber = $outputLines.Count - 2; $outLineNumber; $outLineNumber--) {
                            if ($outputLines[$outLineNumber] -notmatch '^\[') { break }
                            $outputLines[$outLineNumber] -replace '^\[[^\]]+\]\s{0,}'
                        }) -join [Environment]::NewLine
                    }
                    elseif ($line -match '^\[[^\]]+\]\sUnable') {
                        $errorMessage = $line -replace '^\[[^\]]+\]\s{0,}'
                    }

                    if ($errorMessage) {
                        $errorRecord = [Management.Automation.ErrorRecord]::new(
                            [Exception]::new($errorMessage),
                            "FFMpeg.Error",
                            "NotSpecified",
                            $FFMpegArgument
                        )
                        $psCmdlet.WriteError($errorRecord)
                    }
                    "$line"
                }
            }
        #endregion Run FFMpeg
    }
}
