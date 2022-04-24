<#
.SYNOPSIS
    Mirror Extension
.DESCRIPTION
    Mirrors video vertical, horizontally, or in quadrants.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#crop
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#hstack
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#hflip
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#vstack
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#vflip
.EXAMPLE
    Edit-Media -InputPath "a.mp4" -Mirror # Mirror vertically
.EXAMPLE
    Edit-Media -InputPath "a.mp4" -Mirror -HorizontalMirror # Mirror horitonztally
.EXAMPLE
    Edit-Media -InputPath "a.mp4" -Mirror -QuadMirror       # Mirror four quadrants.
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will mirror video.  If no other parameters are provided, will mirror horizontally.
[Parameter(Mandatory)]
[switch]
$Mirror,

# If set, will create a QuadMirror, mirroring the upper left.
[switch]
$QuadMirror,

# If set, will create a horizontal mirror instead of a vertical mirror.
[switch]
$HorizontalMirror
)


if ($Mirror) {
    '-vf'
    if ($horizontalMirror) {
        # Horizontal Mirror
        @'
"
crop=iw:ih/2:0:0,split[top][tmp];
[tmp]vflip[bottom];
[top][bottom] vstack
"
'@
    }
    elseif ($QuadMirror) {
        @'
"
crop=iw/2:ih/2:0:0,split[top][tmp];
[tmp]vflip[bottom];
[top][bottom] vstack, split[left][righttmp];
[righttmp]hflip[right];
[left][right] hstack
"
'@        
    } else {
        # Vertical Mirror
        @'
"
crop=iw/2:ih:0:0,split[left][tmp];
[tmp]hflip[right];
[left][right] hstack
"
'@
    }
}



