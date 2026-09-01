<#
.SYNOPSIS
    Deinterlace Extension
.DESCRIPTION
    Deinterlace input video by applying Donald Graft’s adaptive kernel deinterling.
    Work on interlaced parts of a video to produce progressive frames.    
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#interlace_002c-interlace_005fvulkan
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will use the interlace video filter.
[Parameter(Mandatory)]
[switch]
$Deinterlace,

# Set the threshold which affects the filter’s tolerance when determining if a pixel line must be processed.
[byte]
$DeinterlaceThreshold,

# Paint pixels exceeding the threshold value to white if set.
[switch]
$DeinterlaceMap,

# Set the fields order.
[switch]
$DeinterlaceOrder,

# Enable additional sharpening
[switch]
$DeinterlaceSharp,

# Enable twoway sharpening
[switch]
$DeinterlaceTwoWay
)


"-vf" # Video Filter

$filterArgs =@(
    if ($DeinterlaceThreshold) { "thresh=$DeinterlaceThreshold"}
    if ($DeinterlaceMap) { "map=1" }
    if ($DeinterlaceOrder) { "order=1"}
    if ($DeinterlaceSharp) { "sharp=1"}
    if ($DeinterlaceTwoWay) { "twoway=1"}    
) -join ':'

"kerndeint=$FilterArgs" -replace '=$'