<#
.Synopsis
    Picks median pixels
.Description
    Pick median pixel from certain rectangle defined by radius.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#median

#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is inherited (this is the default).
[ComponentModel.Inheritance("Inherited")]
param(
# The audio gain, either in decibals (i.e. 12db) or as a ratio (i.e. 1.5)    
[Parameter(Mandatory)]
[switch]
$MedianPixel,

# Set horizontal radius size. Default value is 1. Allowed range is integer from 1 to 127.
[ValidateRange(1,127)]
[int]
$MedianPixelRadius,

# Set which planes to process. Default is 15, which is all available planes.
[string]
$MedianPixelPlanes,

# Set vertical radius size. Default value is 0. 
# Allowed range is integer from 0 to 127. 
# If it is 0, value will be picked from horizontal radius option.
[ValidateRange(1,127)]
[int]
$MedianPixelRadiusV,

# Set median percentile. 
# Default value is 0.5.
# Default value of 0.5  will pick always median values, 
# while 0 will pick minimum values and 1 maximum values.
[ValidateRange(0,1)]
[double]
$MedianPixelPercentile
)

$filterArgs = @(
    if ($MedianPixelRadius) {
        "radius=$MedianPixelRadius"
    }
    if ($MedianPixelPlanes) {
        "planes=$MedianPixelPlanes"
    }
    if ($MedianPixelRadiusV) {
        "radiusV=$MedianPixelRadiusV"
    }
    if ($MedianPixelPercentile) {
        "percentile=$MedianPixelPercentile"
    }
) -join ':'
'-vf'
"`"median=$filterArgs`""

