<#
.SYNOPSIS
    Pulsator Effect
.DESCRIPTION
    Adds an Pulsator Effect to the audio
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#apulsator
.EXAMPLE
    Edit-Media -InputPath "a.mp3" -Pulsator
.EXAMPLE
    Show-Media -InputPath "a.mp3" -Pulsator
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, will add a pulsator effect to the audio
[Parameter(Mandatory)]
[switch]
$Pulsator,

# Set pulsator input gain. By default it is 1. Range is [0.015625 - 64].
[ValidateRange(0.015625,64)]
[double]
$PulsatorLevelIn,

# Set pulsator output gain. By default it is 1. Range is [0.015625 - 64].
[ValidateRange(0.015625,64)]
[double]
$PulsatorLevelOut,

# Set waveform shape the LFO will use. Can be one of: sine, triangle, square, sawup or sawdown. Default is sine.
[ValidateSet("sine","triangle","square","sawup", "sawdown")]
[string]
$PulsatorMode,

# Set modulation. Define how much of original signal is affected by the LFO.
[string]
$PulsatorAmount,

# Set pulsator left channel offset. Default is 0. Allowed range is [0 - 1].
[ValidateRange(0,1)]
[double]
$PulsatorOffsetLeft,

# Set pulsator right channel offset. Default is 0.5. Allowed range is [0 - 1].
[ValidateRange(0,1)]
[double]
$PulsatorOffsetRight,

# Set pulse width. Default is 1. Allowed range is [0 - 2]
[ValidateRange(0,2)]
[double]
$PulsatorWidth,

# Set possible timing mode. Can be one of: bpm, ms or hz. Default is hz.
[ValidateSet('bpm','ms','hz')]
[string]
$PulsatorTimingMode,

# Set pulsator bpm. Default is 120. Allowed range is [30 - 300]. Only used if timing is set to bpm.
[ValidateRange(30,300)]
[Alias('PulsatorBeatsPerMinute')]
[double]
$PulsatorBPM,

# Set pulsator ms. Default is 500. Allowed range is [10 - 2000]. Only used if timing is set to ms.
[Alias('PulsatorMilliseconds')]
[ValidateRange(10, 2000)]
[double]
$PulsatorMS,

# Set frequency in Hz. Default is 2. Allowed range is [0.01 - 100]. Only used if timing is set to hz.
[Alias('PulsatorFrequency')]
[ValidateRange(0.01, 100)]
[double]
$PulsatorHZ
)

$filterParams = @(
    if ($PulsatorMode) {
        "mode=$($PulsatorMode.ToLower())"
    }
    if ($PulsatorLevelIn) {
        "level_in=$PulsatorLevelIn"
    }
    if ($PulsatorLevelOut) {
        "level_out=$PulsatorLevelOut"
    }
    if ($PulsatorOffsetLeft) {
        "offset_l=$pulsatorOffsetLeft"
    }
    if ($PulsatorOffsetRight) {
        "offset_r=$pulsatorOffsetLeft"
    }
    if ($PulsatorWidth) {
        "width=$pulsatorWidth"
    }
    if ($PulsatorTimingMode) {
        "timing=$($PulsatorTimingMode.ToLower())"
    }
    if ($PulsatorBPM) {
        "bpm=$pulsatorBPM"
    }
    if ($PulsatorMS) {
        "ms=$pulsatorMS"
    }
    if ($PulsatorHZ) {
        "hz=$pulsatorHZ"
    }
    if ($PulsatorAmount) {
        "amount=$pulsatorAmount"
    }

) -join ':'

"-af"
"apulsator=$filterParams" -replace '=$'