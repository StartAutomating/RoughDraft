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
    [Alias('ffmpeg')]
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
                begin {
                    $replaceBrackets = '^\[[^\]]+\]\s{0,}'
                }
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
                        # Then create an error message with both lines.
                        $errorMessage = @(foreach ($errorLine in $errorLines) {
                            $errorLine -replace $replaceBrackets
                        }) -join [Environment]::NewLine                        
                    }
                    # Alternatively, some errors start with 'error', but ones that start with 'error while'
                    # can generally be ignored.
                    elseif ($line -match '^Error' -and $line -notmatch '^Error while') 
                    {
                        $errorMessage = @(for ($outLineNumber = $outputLines.Count - 2; $outLineNumber; $outLineNumber--) {
                            if ($outputLines[$outLineNumber] -notmatch '^\[') { break }
                            $outputLines[$outLineNumber] -replace $replaceBrackets
                        }) -join [Environment]::NewLine
                    }
                    # Some other errors start with brackets and "unable"
                    elseif ($line -match '^\[[^\]]+\]\sUnable') {
                        # In this case, the error message is on this line.
                        $errorMessage = $line -replace $replaceBrackets
                    }

                    # If we had an error message
                    if ($errorMessage) {
                        # create an error record and
                        $errorRecord = [Management.Automation.ErrorRecord]::new(
                            [Exception]::new($errorMessage),
                            "FFMpeg.Error",
                            "NotSpecified",
                            $FFMpegArgument
                        )
                        # then write the error.
                        $psCmdlet.WriteError($errorRecord)
                    }
                    "$line"
                }
            }
        #endregion Run FFMpeg
    }
}
