<#
.Synopsis
    Resizes a video
.Description
    Applies the resize filter to a video.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# and extends Convert-Media   
[Management.Automation.Cmdlet("Convert","Media")] 
# that is inherited (this is the default)
[ComponentModel.Inheritance("Inherited")]
param(
# The width and height used to resize the video.
[Parameter(Mandatory)]
[ValidatePattern("\d{1,}x\d{1,}")]
[string]
$Resize
)

if ($Resize) { # If we're going to resize the video
    "-vf" # Use the [scale videofilter](https://ffmpeg.org/ffmpeg-filters.html#scale-1)
    "`"scale=$($Resize.Replace("x", ":"))`""        
}
