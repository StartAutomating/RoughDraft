<#
.Synopsis
    Embosses video or images
.Description
    Embosses video or images, using the convolution filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#convolution
#>

[Runtime.CompilerServices.Extension()]  # It's an extension
[Management.Automation.Cmdlet("Edit","Media")] # that extends Edit-Media            
param(
# If set, will emboss an image
[Parameter(Mandatory)]
[switch]
$Emboss
)

"-vf"
"convolution=`"-2 -1 0 -1 1 1 0 1 2:-2 -1 0 -1 1 1 0 1 2:-2 -1 0 -1 1 1 0 1 2:-2 -1 0 -1 1 1 0 1 2`""