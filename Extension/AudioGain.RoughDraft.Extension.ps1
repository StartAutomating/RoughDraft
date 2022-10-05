<#
.Synopsis
    Increases audio volume
.Description
    Increases audio volume, using the volume filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#volume

#>

[Runtime.CompilerServices.Extension()]  # It's an extension
[Management.Automation.Cmdlet("^Edit|Show","Media")]   # that extends Edit/Show-Media
[ComponentModel.Inheritance("Inherited")]  # that is inherited (this is the default).
param(
# The audio gain, either in decibals (i.e. 12db) or as a ratio (i.e. 1.5)    
[Parameter(Mandatory)]
[string]
$AudioGain
)

if ($AudioGain) { # If we're going to turn up the volume
    '-af' # use the [volume audiofilter](https://ffmpeg.org/ffmpeg-filters.html#volume)
    "volume=$($audioGain -ireplace 'db', 'dB')"
}