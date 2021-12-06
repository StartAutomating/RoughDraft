<#
.Synopsis
    Reverses video
.Description
    Reverses video, using the reverse filter.

    Warning: This filter requires memory to buffer the entire clip.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#reverse
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
param(
# If set, will reverse audio
[Parameter(Mandatory)]
[Alias('BackmaskVideo')]
[switch]
$ReverseVideo
)

"-vf"
"reverse"

