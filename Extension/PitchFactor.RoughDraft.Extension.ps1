<#
.SYNOPSIS
    Adjust Pitch by a factor
.DESCRIPTION
    Adjust audit pitch by a factor.

    This is done by:
    * Resampling the audio
    * Resetting the sample rate
    * Adjusting the tempo.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#asetrate
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#aresample
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#atempo
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -PitchFactor 1.25 # Adjust pitch by 125% (making audio more high pitched)
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -PitchFactor 0.9 # Adjust pitch by 90% (making audio lower pitched)
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]
param(
# The Pitch Factor.
[Parameter(Mandatory)]
[ValidateRange(0.5,2)]
[double]
$PitchFactor,

# The pitch factor sample rate.
# When using Edit-Media, this will be automatically be detected from the first audio stream.
# When using Show-Media, this defaults to 44100
[int]
$PitchFactorSampleRate
)

$PitchFactorSampleRate = 
    if ($PitchFactorSampleRate) {
        $PitchFactorSampleRate
    } elseif ($mediaInfo) {
        $mediaInfo.streams |
            Where-Object codec_type -eq 'audio' |
            Where-Object sample_rate |
            Select-Object -first 1 -expand sample_rate

    } else {
        44100
    }


'-af'
"asetrate=$PitchFactorSampleRate*$PitchFactor,aresample=$PitchFactorSampleRate,atempo=$([Math]::round(1/$PitchFactor,4))"
 

