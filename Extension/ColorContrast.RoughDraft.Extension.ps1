<#
.SYNOPSIS
    ColorContrast Extension
.DESCRIPTION
    Adjusts color contrast
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#colorcontrast
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will adjust color contrast
[Parameter(Mandatory)]
[switch]
$ColorContrast,

# The constrast between Red and Cyan.  Valid between -1 and 1.
[ValidateRange(-1,1)]
[float]
$RedCyanColorContrast,

# The constrast between Green and Magenta.  Valid between -1 and 1.
[ValidateRange(-1,1)]
[float]
$GreenMagentaColorContrast,

# The constrast between Blue and Yellow.  Valid between -1 and 1.
[ValidateRange(-1,1)]
[float]
$BlueYellowColorContrast,

# The weight of the constrast between Red and Cyan.  Valid between 0 and 1.
[ValidateRange(0,1)]
[float]
$RedCyanConstrastWeight,

# The weight of the constrast between Green and Magenta.  Valid between 0 and 1.
[ValidateRange(0,1)]
[float]
$GreenMagentaConstrastWeight,

# The weight of the constrast between Blue and Yellow.  Valid between 0 and 1.
[ValidateRange(0,1)]
[float]
$BlueYellowConstrastWeight,

# The amount of lightness that should be preserved.  Valid between 0 and 1.
[ValidateRange(0,1)]
[float]
$ColorContrastPreserveLightness
)

$filterArgs  = @(
    if ($RedCyanColorContrast) {"rc=$RedCyanColorContrast"}
    if ($GreenMagentaColorContrast) {"gm=$GreenMagentaColorContrast"}
    if ($BlueYellowColorContrast) {"by=$BlueYellowColorContrast"}
    if ($RedCyanConstrastWeight) { "rcw=$RedCyanConstrastWeight"}
    if ($GreenMagentaConstrastWeight) {"gmw=$GreenMagentaConstrastWeight"}
    if ($BlueYellowConstrastWeight) {"byw=$BlueYellowConstrastWeight"}
    if ($ColorContrastPreserveLightness) {"pl=$ColorContrastPreserveLightness"}
 ) -join ':'
"-vf"
"colorcontrast=$filterArgs" -replace '=$'