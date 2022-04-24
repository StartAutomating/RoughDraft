<#
.SYNOPSIS
    Flips video vertically
.DESCRIPTION
    Flips video vertically, using the vflip filter.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#vflip
.EXAMPLE
    Edit-Media -InputPath .\TestSource.gif -FlipVertical
#>
[Management.Automation.Cmdlet("^(Edit|Show)","Media")]
param(
[Parameter(Mandatory)]
[Alias('FlipVertically', 'vflip')]
[switch]
$FlipVertical
)

"-vf", "vflip"

