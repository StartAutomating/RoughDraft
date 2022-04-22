<#
.SYNOPSIS
    EdgeDetect Extension
.DESCRIPTION
    Uses the edgedetect filter to outline edges found in a video.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#edgedetect
#>
[Management.Automation.Cmdlet("^(Edit|Show)","Media")]
param(
# If set, will detect edges
[Parameter(Mandatory)]
[Alias('DetectEdge', 'DetectEdges')]
[switch]
$EdgeDetect,

# The low threshold.  By default, ~0.86
[ValidateRange(0,1)]
[float]
$EdgeLowThreshold,

# The high threshold.  By default ~.196
[ValidateRange(0,1)]
[float]
$EdgeHighThreshold,

# The edge detection mode.  By default, wires.
[ValidateSet('wires','colormix','canny')]
[string]
$EdgeDetectMode
)

$filterArgs = @(
    if ($EdgeLowThreshold) {
        "low=$EdgeLowThreshold"
    }
    if ($EdgeHighThreshold) {
        "high=$edgehighThreshold"
    }
    if ($EdgeDetectMode) {
        "mode=$($EdgeDetectMode.ToLower())"
    }
) -join ':'
"-vf"
"edgedetect=$filterArgs" -replace '=$'
