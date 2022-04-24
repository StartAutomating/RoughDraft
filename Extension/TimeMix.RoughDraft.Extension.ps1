<#
.SYNOPSIS
    Mix successive video frames.
.DESCRIPTION
    Mix successive video frames, using the tmix filter.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#tmix
.EXAMPLE
    Edit-Media -InputPath .\TestSource.gif -TimeMix 5
#>
[Management.Automation.Cmdlet("^(Edit|Show)","Media")]
param(
# The number of successive frames to mix.
[Parameter(Mandatory)]
[int]
$TimeMix,

# Specify weight of each input video frame. 
# If number of weights is smaller than number of frames last specified weight will be used for all remaining unset weights.
[int[]]
$TimeMixFrameWeight,

# Specify scale, if it is set it will be multiplied with sum of each weight multiplied with pixel values to give final destination pixel value.
# By default scale is auto scaled to sum of weights.
[int]
$TimeMixScale,

# Set which planes to filter. Default is all. Allowed range is from 0 to 15.
[ValidateRange(0,15)]
[Alias('TimeMixPlanes')]
[int]
$TimeMixPlane
)

$filterArgs = @(
    if ($TimeMix -gt 0) {
        "frames=$TimeMix"
    }
    if ($TimeMixFrameWeight) {
        "weights=$($TimeMixFrameWeight -join ' ')"
    }
    if ($TimeMixScale) {
        "scale=$timeMixScale"
    }
    if ($psBoundParameters.ContainsKey("TimeMixPlane")) {
        "planes=$timeMixPlane"
    }
) -join ':'

"-vf"
"tmix=$filterArgs" -replace '=$'
