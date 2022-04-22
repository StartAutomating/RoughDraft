<#
.SYNOPSIS
    Hue Extension
.DESCRIPTION
    Adjusts the Hue of a video source
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#hue
#>
[Management.Automation.Cmdlet("^Edit|Show", "Media")]
param(
# If set, will change hue levels.
[Parameter(Mandatory)]
[switch]
$SetHue,

# The adjustment to the hue (in degrees).  Can include expressions.  Mutually exclusive with -HueRadian.
[Alias('HueDegrees')]
[string]
$HueDegree,

# The adjustment to the hue (in radians).  Can include expressions.  Mutually exclusive with -HueDegree.
[Alias('HueRadians')]
[string]
$HueRadian,

# The adjustment to the saturation.  Can include expressions.
[string]
$Saturation,

# The adjustment to the brightness.  Can include expressions.
[string]
$Brightness
)

$filterArgs = @(
    if ($HueDegree)       {"H=$hueDegree"}
    elseif ($HueRadian)   {"h=$hueRadian"}
    
    if ($Saturation) {"s=$Saturation"}
    if ($Brightness) {"b=$brightness"}
) -join ':'
"-vf"
"hue=$filterArgs" -replace '=$'
