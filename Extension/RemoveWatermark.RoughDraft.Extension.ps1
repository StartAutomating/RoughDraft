<#
.Synopsis
    Removes logos from video
.Description
    Suppress a TV station logo by a simple interpolation of the surrounding pixels. 
    Just set a rectangle covering the logo and watch it disappear (and sometimes something even uglier appear - your mileage may vary).
.Link
    https://ffmpeg.org/ffmpeg-filters.html#delogo
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will remove a logo
[Parameter(Mandatory)]
[Alias('DeLogo')]
[switch]
$RemoveWatermark,

# Sets the left corner of the logo.
[Parameter(Mandatory)]
[Alias('RemoveWatermarkLeft')]
[string]
$RemoveWaterMarkX,

# Sets the top corner of the logo.
[Parameter(Mandatory)]
[Alias('RemoveWatermarkTop')]
[string]
$RemoveWaterMarkY,

# Sets the width of the logo to remove.
[Parameter(Mandatory)]
[string]
$RemoveWaterMarkWidth,

# Sets the height of the logo to remove.
[Parameter(Mandatory)]
[string]
$RemoveWaterMarkHeight,

# When set, a green rectangle is drawn on the screen to simplify finding the right x, y, w, and h parameters.
# The rectangle is drawn on the outermost pixels which will be (partly) replaced with interpolated values. 
# The values of the next pixels immediately outside this rectangle in each direction will be used to compute the interpolated pixel values inside the rectangle.
[switch]
$ReplaceWaterMarkWithGreenBlock
)

$filterArgs = @(
    "x=$RemoveWaterMarkX"
    "y=$RemoveWaterMarkX"
    "w=$RemoveWaterMarkWidth"
    "h=$RemoveWaterMarkHeight"    
    if ($ReplaceWaterMarkWithGreenBlock) {
        "show=1"
    }
) -join ':'
"-vf"
"delogo=$filterArgs"
