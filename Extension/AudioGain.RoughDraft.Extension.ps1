<#
.Synopsis
    Increases audio volume
.Description
    Increases audio volume, using the volume filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#volume

#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is inherited (this is the default).
[ComponentModel.Inheritance("Inherited")]
param(
# The audio gain, either in decibals (i.e. 12db) or as a ratio (i.e. 1.5)    
[Parameter(Mandatory)]
[string]
$AudioGain
)

if ($AudioGain) { # If we're going to turn up the volume
    '-af' # use the [volume audiofilter](https://ffmpeg.org/ffmpeg-filters.html#volume)
    "`"volume=$($audioGain -ireplace 'db', 'dB')`""
}