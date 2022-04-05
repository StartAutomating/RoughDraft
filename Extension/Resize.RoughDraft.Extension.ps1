<#
.Synopsis
    Resizes a video
.Description
    Applies the resize filter to a video.
.EXAMPLE
    Convert-Media
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Convert","Media")]
[Management.Automation.Cmdlet("Edit","Media")]
# that is inherited (this is the default)
[ComponentModel.Inheritance("Inherited")]
param(
# The width and height used to resize the video.
[Parameter(Mandatory)]
[ValidatePattern("\d{1,}x\d{1,}")]
[string]
$Resize
)

"-vf" # Use the [scale videofilter](https://ffmpeg.org/ffmpeg-filters.html#scale-1)
"`"scale=$($Resize.Replace("x", ":"))`""
