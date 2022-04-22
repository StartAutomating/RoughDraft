<#
.SYNOPSIS
    Skew Extension
.DESCRIPTION
    Skews video, using the shear filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#shear
#>
[Management.Automation.Cmdlet("Edit","Media")]
param(
# If set, will skew video
[Parameter(Mandatory)]
[Alias('Shear')]
[switch]
$Skew,

# Skew factor in X-direction. Default value is 0. Allowed range is from -2 to 2.
[ValidateRange(-2,2)]
[Alias('ShearX')]
[float]
$SkewX  = 0,

# Skew factor in Y-direction. Default value is 0. Allowed range is from -2 to 2.
[ValidateRange(-2,2)]
[Alias('ShearY')]
[float]
$SkewY = 0,

# Set the color used to fill the output area not covered by the transformed video.
[Alias('ShearFillColor')]
[string]
$SkewFillColor,

# Set interpolation type.  Default is 'bilinear'
[ValidateSet('bilinear', 'nearest')]
[Alias('ShearInterpolation')]
[string]
$SkewInteropolation
)

$filterArgs =@(
    if ($SkewX) {
        "shx=$SkewX"
    }
    if ($SkewY) {
        "shy=$SkewY"
    }
    if ($SkewFillColor) {
        "fillcolor=$skewfillColor"
    }
    if ($SkewInteropolation) {
        "interp=$($SkewInteropolation.ToLower())"
    }
) -join ':'
"-vf"
"shear=$filterArgs" -replace '=$'
