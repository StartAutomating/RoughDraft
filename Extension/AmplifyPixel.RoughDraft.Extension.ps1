<#
.Synopsis
    AmplifyPixel extension
.Description
    Amplify differences between current pixel and pixels of adjacent frames in same pixel location.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#amplify

#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media and Show-Media            
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
# that is inherited (this is the default).
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will amplify the differences between current pixel and pixels of adjacent frames in same pixel location.
[Parameter(Mandatory)]
[switch]
$AmplifyPixel,

# Set frame radius. Default is 2. Allowed range is from 1 to 63. For example radius of 3 will instruct filter to calculate average of 7 frames.
[ValidateRange(1,63)]
[int]
$AmplifyPixelRadius,

# Set factor to amplify difference. Default is 2
[ValidateRange(0,65535)]
[int]
$AmplifyPixelFactor,

# Set threshold for difference amplification.
# Any difference greater or equal to this value will not alter source pixel.
# Default is 10.
# Allowed range is from 0 to 65535.
[ValidateRange(0,65535)]
[int]
$AmplifyPixelThreshold,

# Set tolerance for difference amplification.
# Any difference lower to this value will not alter source pixel.
# Default is 0. Allowed range is from 0 to 65535.
[ValidateRange(0,65535)]
[int]
$AmplifyPixelTolerance,

# Set lower limit for changing source pixel.
# Default is 65535.
# Allowed range is from 0 to 65535.
# This option controls maximum possible value that will decrease source pixel value
[ValidateRange(0,65535)]
[int]
$AmplifyPixelLow,

# Set high limit for changing source pixel.
# Default is 65535.
# Allowed range is from 0 to 65535.
# This option controls maximum possible value that will decrease source pixel value
[ValidateRange(0,65535)]
[int]
$AmplifyPixelHigh,

# Set which planes to filter. Default is all. Allowed range is from 0 to 15.
[string]
$AmplifyPixelPlanes
)

$filterArgs = @(
    if ($AmplifyPixelRadius) {
        "radius=$AmplifyPixelRadius"
    }
    if ($AmplifyPixelPlanes) {
        "planes=$AmplifyPixelPlanes"
    }
    if ($AmplifyPixelFactor) {
        "factor=$AmplifyPixelFactor"
    }
    if ($AmplifyPixelThreshold) {
        "thresold=$AmplifyPixelThreshold"
    }
    if ($AmplifyPixelTolerance) {
        "tolerance=$AmplifyPixelTolerance"
    }
    if ($AmplifyPixelLow) {
        "low=$AmplifyPixelLow"
    }
    if ($AmplifyPixelHigh) {
        "high=$AmplifyPixelLow"
    }
) -join ':'
'-vf'
"`"amplify=$filterArgs`""