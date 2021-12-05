<#
.Synopsis
    Embosses video or images
.Description
    Embosses video or images, using the convolution filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#convolution
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
param(
# If set, will emboss an image
[switch]
$Emboss
)

"-vf"
"convolution=`"-2 -1 0 -1 1 1 0 1 2:-2 -1 0 -1 1 1 0 1 2:-2 -1 0 -1 1 1 0 1 2:-2 -1 0 -1 1 1 0 1 2`""