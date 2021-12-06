<#
.Synopsis
    Reverses audio
.Description
    Reverses audio, using the areverse filter.

    Warning: This filter requires memory to buffer the entire clip.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#areverse
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
param(
# If set, will reverse audio
[Parameter(Mandatory)]
[Alias('BackmaskAudio')]
[switch]
$ReverseAudio
)

"-af"
"areverse"

