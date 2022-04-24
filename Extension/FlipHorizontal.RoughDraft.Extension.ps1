<#
.SYNOPSIS
    Flips video horizontally
.DESCRIPTION
    Flips video horizontally, using the hflip filter.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#hflip
.EXAMPLE
    Edit-Media -InputPath .\TestSource.gif -FlipHorizontal
#>
[Management.Automation.Cmdlet("^(Edit|Show)","Media")]
param(
[Parameter(Mandatory)]
[Alias('FlipHorizontally', 'hflip')]
[switch]
$FlipHorizontal
)

"-vf", "hflip"

