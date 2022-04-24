<#
.Synopsis
    Scrolls video
.Description
    Scrolls video, using the scroll filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#scroll
#>

[Runtime.CompilerServices.Extension()]          # It's an extension
[Management.Automation.Cmdlet("^(Edit|Show)","Media")]  # that extends Edit/Show-Media
param(
# If set, will scroll video.
[Parameter(Mandatory)]
[switch]
$Scroll,

# Set the horizontal scrolling speed. Default is 0. 
# Allowed range is from -1 to 1. 
# Negative values changes scrolling direction.
[ValidateRange(-1,1)]
[double]
$HorizontalScrollSpeed,

# Set the initial horizontal scrolling position. 
# Default is 0. 
# Allowed range is from 0 to 1.
[ValidateRange(0,1)]
[double]
$HorizontalScrollStartPosition,

# Set the vertical scrolling speed. Default is 0. 
# Allowed range is from -1 to 1. 
# Negative values changes scrolling direction.
[ValidateRange(-1,1)]
[double]
$VerticalScrollSpeed,

# Set the initial vertical scrolling position. 
# Default is 0. 
# Allowed range is from 0 to 1.
[ValidateRange(0,1)]
[double]
$VerticalScrollStartPosition
)

$filterArgs  =@(
    if ($HorizontalScrollSpeed) {
        "horizontal=$HorizontalScrollSpeed"
    }
    if ($HorizontalScrollStartPosition) {
        "hpos=$HorizontalScrollStartPosition"
    }
    if ($VerticalScrollSpeed) {
        "vertical=$VerticalScrollSpeed"
    }
    if ($VerticalScrollStartPosition) {
        "vpos=$VerticalScrollStartPosition"
    }

    if ($MonochromeColorFilterSize) {
        "high=$MonochromeHighlightStrength"
    }
    
) -join ':'

"-vf"
"scroll=$filterArgs" -replace '=$'
