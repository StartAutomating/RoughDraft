<#
.Synopsis
    Vibrato effect
.Description
    Sinusoidal phase modulation.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#vibrato
#>
[Management.Automation.Cmdlet("(?>Edit|Show)","Media")]
param(
# If set, will use the vibrato effect
[Parameter(Mandatory)]
[switch]
$Vibrato,

# Modulation frequency in Hertz. Range is 0.1 - 20000.0. Default value is 5.0 Hz.
[ValidateRange(0.1,20000.0)]
[float]
$VibratoFrequency,

# Depth of modulation as a percentage. Range is 0.0 - 1.0. Default value is 0.5.
[ValidateRange(0.0,1.0)]
[float]
$VibratoDepth
)

$filterArgs =@(
    if ($VibratoFrequency){
        "f=$VibratoFrequency"
    }
    if ($VibratoDepth) {
        "d=$VibratoDepth"
    }
) -join ':'

'-af'
"vibrato=$FilterArgs" -replace '=$'

