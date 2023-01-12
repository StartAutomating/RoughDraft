<#
.SYNOPSIS
    Color Expression
.DESCRIPTION
    Applies an expression to each color.

    Color Expressions can be used to tweak color in a single video stream,
    and can also be used to join two streams together based on the values of each pixel.
#>
[Management.Automation.Cmdlet("(?>Edit|Show|Join)","Media")]
param(
<#
Up to four Color Expressions.
Color Expressions can use the following variables:

|Name|Description|
|-|-|
|w/h|The input width/height.|
|val|The input value for the pixel component.|

Color Expressions on a single source without blending frames can also use:

|Name|Description|
|-|-|
|maxval|The maximum value for the pixel component.|
|minval|The minimum value for the pixel component.|
|negval|The negated value for the pixel component value, clipped to the minval-maxval range; it corresponds to the expression "maxval-clipval+minval".|
|clip(val)|The computed value in val, clipped to the minval-maxval range.|
|gammaval(gamma)|The computed gamma correction value of the pixel component value, clipped to the minval-maxval range. It corresponds to the expression "pow((clipval-minval)/(maxval-minval)\,gamma)*(maxval-minval)+minval"|

Color Expressions that combine sources or blend frames can also use:

|Name|Description|
|-|-|
|x|The first value for the pixel component.|
|y|The second value for the pixel component.|
|bdx|The first input video bit depth.|
|bdy|The second input video bit depth.|
#>
[Parameter(Mandatory)]
[string[]]
$ColorExpression,

# The color expression color space.  Ignored when joining files.
[ValidateSet('rgb','yuv')]
[string]
$ColorExpressionColorSpace,

# If set, will blend sucessive frames together.  Ignored when joining files.
[switch]
$BlendFrameColor
)

if ($commandName -eq 'Join-Media') {
    $filterName = 'lut2'
} else {
    if ($ColorExpressionColorSpace) {
        $filterName = "lut$($ColorExpressionColorSpace.ToLower())"        
    }
    elseif ($BlendFrameColor) {
        $filterName = "tlut2"
    }
}

if ($commandName -eq 'Join-Media') {
    '-filter_complex'
} else {
    '-vf'
}

"$filterName='$($colorExpression -join ':')'"
