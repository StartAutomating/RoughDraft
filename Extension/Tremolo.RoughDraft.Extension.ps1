<#
.Synopsis
    Tremolo effect
.Description
    Sinusoidal phase modulation.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#tremolo
#>
[Management.Automation.Cmdlet("(?>Edit|Show)","Media")]
param(
# If set, will use the Tremolo effect
[Parameter(Mandatory)]
[switch]
$Tremolo,

# Modulation frequency in Hertz. Range is 0.1 - 20000.0. Default value is 5.0 Hz.
[ValidateRange(0.1,20000.0)]
[float]
$TremoloFrequency,

# Depth of modulation as a percentage. Range is 0.0 - 1.0. Default value is 0.5.
[ValidateRange(0.0,1.0)]
[float]
$TremoloDepth
)

$filterArgs =@(
    if ($TremoloFrequency){
        "f=$TremoloFrequency"
    }
    if ($TremoloDepth) {
        "d=$TremoloDepth"
    }
) -join ':'

'-af'
"tremolo=$FilterArgs" -replace '=$'


