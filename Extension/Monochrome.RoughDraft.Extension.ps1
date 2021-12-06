<#
.Synopsis
    Make video monochrome 
.Description
    Make video monochrome, using the monochrome filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#monochrome
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
param(
[Parameter(Mandatory)]
[switch]
$Monochrome,

# Set the chroma blue spot. Allowed range is from -1 to 1. Default value is 0.
[ValidateRange(-1,1)]
[double]
$MonochromeChromaBlueSpot,

# Set the chroma red spot. Allowed range is from -1 to 1. Default value is 0.
[ValidateRange(-1,1)]
[double]
$MonochromeChromaRedSpot,

# Set the color filter size. Allowed range is from .1 to 10. Default value is 1.
[ValidateRange(.1,10)]
[double]
$MonochromeColorFilterSize,

# Set the highlights strength. Allowed range is from 0 to 1. Default value is 0.
[ValidateRange(0,1)]
[double]
$MonochromeHighlightStrength
)

$filterArgs  =@(
    if ($MonochromeChromaBlueSpot) {
        "cb=$MonochromeChromaBlueSpot"
    }
    if ($MonochromeChromaRedSpot) {
        "cr=$MonochromeChromaRedSpot"
    }
    if ($MonochromeColorFilterSize) {
        "size=$MonochromeColorFilterSize"
    }

    if ($MonochromeColorFilterSize) {
        "high=$MonochromeHighlightStrength"
    }
    
) -join ':'

"-vf"
"monochrome=$filterArgs" -replace '=$'
