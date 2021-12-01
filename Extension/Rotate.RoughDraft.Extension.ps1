<#
.Synopsis
    Rotates a video
.Description
    Applies the rotate filter to rotate a video.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Join-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# and extends Convert-Media   
[Management.Automation.Cmdlet("Convert","Media")] 
# that is inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If provided, the video file will be rotated
[Parameter(Mandatory)]
[ValidateSet('90','180','270')]
[Uint32]
$Rotate
)

if ($Rotate) { # If we're going to rotate the video
    "-vf" # Use the [transpose videofilter](https://ffmpeg.org/ffmpeg-filters.html#transpose-1)
    "`"transpose=$(if ($rotate  -eq 90) { 1 } elseif ($rotate -eq 180) { 2 } elseif ($rotate -eq 270)  { 3})`""
}
