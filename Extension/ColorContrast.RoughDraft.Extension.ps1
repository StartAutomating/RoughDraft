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
[Parameter(Mandatory)]
[switch]
$ColorContrast,

[ValidateRange(-1,1)]
[float]
$RedCyanColorContrast,

[ValidateRange(-1,1)]
[float]
$GreenMagentaColorContrast,

[ValidateRange(-1,1)]
[float]
$BlueYellowColorContrast,

[ValidateRange(0,1)]
[float]
$RedCyanConstrastWeight,

[ValidateRange(0,1)]
[float]
$GreenMagentaConstrastWeight,

[ValidateRange(0,1)]
[float]
$BlueYellowConstrastWeight,

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