<#
.SYNOPSIS
    FrameStep Effect
.DESCRIPTION
    Select one frame every N-th frame.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#framestep
.EXAMPLE
    Edit-Media -InputPath .\a.mp4 -FrameStep 2
#>
[Management.Automation.Cmdlet("Edit", "Media")]
[Management.Automation.Cmdlet("Show", "Media")]
param(
# Select frame after every step frames.
# Allowed values are positive integers higher than 0.
[Parameter(Mandatory)]
[ValidateRange(1,1mb)]
[int]
$FrameStep
)

"-vf"
"framestep=$frameStep"
