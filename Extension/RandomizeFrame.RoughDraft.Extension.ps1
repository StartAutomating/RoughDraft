<#
.Synopsis
    RandomizeFrame extensions
.Description
    Flush video frames from internal cache of frames into a random order. No frame is discarded.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#random
#>
[Management.Automation.Cmdlet("^Edit|Show","Media")]
param(
# If set, will randomize frames
[Parameter(Mandatory)]
[switch]
$RandomizeFrame,

# The number of frames to be randomized.  Default is 30.
[ValidateRange(2,512)]
[int]
$RandomizedFrameCount,

# The seet for the random number generator.
[int]
$RandomizedFrameSeed
)

$filterArgs =@(
    if ($RandomizedFrameCount){
        "frames=$randomizedFrameCount"
    }
    if ($RandomizedFrameSeed) {
        "seed=$randomizedFrameSeed"
    }
) -join ':'

'-vf'
"random=$FilterArgs" -replace '=$'
