<#
.Synopsis
    Detects silence in an audio stream
.Description
    Detects silence in an audio stream, using the silencedetect filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#silencedetect
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Get-Media
[Management.Automation.Cmdlet("Get","Media")]
param(
    # If set, will find silences within an audio.
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [switch]
    $SilenceDetect,

    # The duration of quiet that is considered silence.  By default a half second.
    [Parameter(ValueFromPipelineByPropertyName)]    
    [Timespan]
    $SilenceDuration = "00:00:00.5",

    # The noise tolerance (by default 0.1%)  
    # If this is a number between 0 and 1 it will be treated as an amplitude ratio.
    # Otherwise, it will be treated as a decibal value.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Noise','Tolerance')]    
    [double]
    $NoiseThreshold = 0.001,
    
    # If set, will find silence within any channel of audio 
    # (this passes the ironically named mono parameter to the silencedetect filter of FFMPEG). 
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Mono','M')]
    [ComponentModel.AmbientValue({"m=true"})]
    [switch]
    $AnyChannel
)

$filterArgs = 
    "d=$($SilenceDuration.TotalSeconds)",
    "n=$(if ($NoiseThreshold -ge 0 -and $NoiseThreshold -le 1){$NoiseThreshold} else {"${NoiseThreshold}dB"})",
    "$(if ($AnyChannel) {'m=true'})" -join ":"

$ffArgs = @(
    '-i', "`"$ri`"", "-af", "silencedetect=$filterArgs", '-f', 'null', '-'
)

Use-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $ffArgs |
. {
    param([Parameter(Mandatory,ValueFromPipeline)][string]$line)

    process {
        $theSilence = @([Regex]::Matches($line, "(?<Key>silence_\S{1,})\s{0,}:\s{0,}(?<Value>[^\s]{1,})"))
        if ($theSilence) {
            foreach ($foundSilence in $theSilence) {
                $theKey = $foundSilence.Groups["Key"].Value
                $theValue = $foundSilence.Groups["Value"].Value
                if ($theKey -eq 'silence_start') {
                    $silenceStart = [Timespan]::FromSeconds($theValue)
                }
                if ($theKey -eq 'silence_end' -and $silenceStart) {
                    $SilenceEnd = [Timespan]::FromSeconds($theValue)
                    [PSCustomObject][Ordered]@{
                        InputPath = "$ri"
                        FilterName = 'silencedetect'
                        Start    = $silenceStart
                        End      = $silenceEnd
                        SilenceDuration = ($silenceEnd - $silenceStart)
                    }               
                    $silenceStart = $null

                    if ($theDuration -and $progId) {
                        $perc = $silenceEnd.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
                        Write-Progress "$ri - $filterName" " " -PercentComplete $perc -Id $ProgId
                    }
                }
            }
        }
    }

}