<#
.Synopsis
    Reverses audio
.Description
    Reverses audio, using the areverse filter.

    Warning: This filter requires memory to buffer the entire clip.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#areverse
#>
[Runtime.CompilerServices.Extension()]             # It's an extension
[Management.Automation.Cmdlet("Edit","Media")]     # that extends Edit-Media
param(
# If set, will reverse audio
[Parameter(Mandatory)]
[Alias('BackmaskAudio')]
[switch]
$ReverseAudio
)

"-af"
"areverse"

