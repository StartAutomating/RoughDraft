<#
.SYNOPSIS
    Interlace Extension
.DESCRIPTION
    Apply Interlace effect to the video.

    Simple interlacing filter from progressive contents. 
    
    This interleaves upper (or lower) lines from odd frames with 
    lower (or upper) lines from even frames.
    
    This halves the frame rate and preserves the image height.    
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#interlace_002c-interlace_005fvulkan
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will use the interlace video filter.
[Parameter(Mandatory)]
[switch]
$Interlace,

# This determines whether the interlaced frame is taken from the 
# even (tff - default) or odd (bff) lines of the progressive frame.
# `bff` may feel like it is jumping back in time.
# `tff` may feel like it is jumping forward in time.
[ValidateSet('bff','tff')]
[string]
$InterlaceScan,

# Vertical lowpass filter to avoid twitter interlacing and reduce moire patterns.
# `off` will not filter
# `linear` blends the interlace.
# `complex` smoothes the interface.
[ValidateSet('0', 'off','1', 'linear', '2', 'complex')]
[string]
$InterlaceLowPass
)


"-vf" # Video Filter

$filterArgs =@(
    if ($InterlaceScan) { "scan=$($InterlaceScan.ToLower())" }
    if ($InterlaceLowPass) { "lowpass=$($InterlaceLowPass.ToLower())"}    
) -join ':'

"interlace=$FilterArgs" -replace '=$'
