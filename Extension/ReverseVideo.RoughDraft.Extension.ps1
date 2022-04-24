<#
.Synopsis
    Reverses video
.Description
    Reverses video, using the reverse filter.

    Warning: This filter requires memory to buffer the entire clip.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#reverse
.EXAMPLE
    Edit-Media -InputPath "TestSource.gif" -ReverseVideo
#>
[Runtime.CompilerServices.Extension()]          # It's an extension
[Management.Automation.Cmdlet("Edit","Media")]  # that extends Edit-Media
param(
# If set, will reverse audio
[Parameter(Mandatory)]
[Alias('BackmaskVideo')]
[switch]
$ReverseVideo
)

"-vf"
"reverse"

