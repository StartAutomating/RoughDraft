<#
.SYNOPSIS
    Evaluates Video Expressions
.DESCRIPTION
    Evaluates Video Expressions, using the [geq filter](https://ffmpeg.org/ffmpeg-filters.html#geq)
.NOTES
    The colorspace is selected according to the specified options. If one of the lum_expr, cb_expr, or cr_expr options is specified, the filter will automatically select a YCbCr colorspace. If one of the red_expr, green_expr, or blue_expr options is specified, it will select an RGB colorspace.

    If one of the chrominance expression is not defined, it falls back on the other one. If no alpha expression is specified it will evaluate to opaque value. If none of chrominance expressions are specified, they will evaluate to the luminance expression.

    The expressions can use the following variables and functions:
    
    |Variable|Purpose|
    |--------|-------|
    |N       |The sequential number of the filtered frame, starting from 0.|
    |X,Y     |The coordinates of the current sample.|    
    |W,H     |The width and height of the image.|    
    |SW,SH   |Width and height scale depending on the currently filtered plane. It is the ratio between the corresponding luma plane number of pixels and the current plane ones. E.g. for YUV4:2:0 the values are 1,1 for the luma plane, and 0.5,0.5 for chroma planes.|
    |T       |Time of the current frame, expressed in seconds.|
    |p(x, y) |Return the value of the pixel at location (x,y) of the current plane.|
    |lum(x, y)|Return the value of the pixel at location (x,y) of the luminance plane.|
    |cb(x, y)|Return the value of the pixel at location (x,y) of the blue-difference chroma plane. Return 0 if there is no such plane.|
    |cr(x, y)|Return the value of the pixel at location (x,y) of the red-difference chroma plane. Return 0 if there is no such plane.|
    |r(x, y),g(x, y),b(x, y)|Return the value of the pixel at location (x,y) of the red/green/blue component. Return 0 if there is no such component.
    |alpha(x, y)|Return the value of the pixel at location (x,y) of the alpha plane. Return 0 if there is no such plane.|
    |psum(x,y), lumsum(x, y), cbsum(x,y), crsum(x,y), rsum(x,y), gsum(x,y), bsum(x,y), alphasum(x,y)|Sum of sample values in the rectangle from (0,0) to (x,y), this allows obtaining sums of samples within a rectangle. See the functions without the sum postfix.|
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#geq
.EXAMPLE
    # Flips a video horizontally
    Edit-Media -InputPath .\a.mp4 -VideoExpression 'p(W-X,Y)'
.EXAMPLE
    Edit-Media -InputPath .\a.mp4 -VideoExpression 'clip(sin(T*2), -.5,.5)*p(X,Y)'
.EXAMPLE
    Edit-Media -InputPath .\a.mp4 -VideoExpression 'p(floor((sin(T) * W) -X),Y)'
    Edit-Media -InputPath .\a.mp4 -VideoExpression 'p(        
            if(
                gt(X,W/2),
                X,
                W-X
            ),
            Y
        )
    '
.EXAMPLE
    # Changes color based off of the pixel position
    Edit-Media -InputPath .\a.mp4 -VideoExpression '' -VideoExpressionRed '(X*Y)/(W*H)*r(X,Y)' -VideoExpressionGreen '(1-X/W)*g(X,Y)' -VideoExpressionBlue '(H-Y)/H*b(X,Y)' -Verbose
#>
[Management.Automation.Cmdlet("(?>Edit|Show)","Media")]
param(
# The video luminance expression.
# If you do not wish to provide a luminance expression, pass a blank string to this parameter.
[Parameter(Mandatory)]
[Alias('geq_lum_expr')]
[AllowEmptyString()]
[AllowNull()]
[string[]]
$VideoExpression,

# Set the chrominance blue expression.
[Alias('geq_cb_expr')]
[string]
$VideoExpressionChrominanceBlue,

# Set the chrominance red expression.
[Alias('geq_cr_expr')]
[string]
$VideoExpressionChrominanceRed,

# Set the alpha expression.
[Alias('geq_alpha_expr')]
[string]
$VideoExpressionAlpha,

# Set the red expression.
[Alias('geq_red_expr')]
[string]
$VideoExpressionRed,

# Set the green expression.
[Alias('geq_blue_expr')]
[string]
$VideoExpressionBlue,

# Set the blue expression.
[Alias('geq_green_expr')]
[string]
$VideoExpressionGreen
)

$myCmd = $MyInvocation.MyCommand
$filterArgs = @(    
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        $match=  @([Regex]::Match($myCmd.Parameters[$kv.Key].Aliases, '_(?<p>.+)$'))
        if ($match.Success) {
            $v = $kv.Value
            if ([string]::IsNullOrEmpty($v)) { continue }
            $p = $match.Value -replace '^_'
            if ($v -is [switch]) {
                $v = ($v -as [bool]).ToString().ToLower()
            }
            "$p='$($kv.Value -replace "^'" -replace "'$")'"
        }
    }        
) -join ':'

'-vf'
"geq=$FilterArgs" -replace '=$'