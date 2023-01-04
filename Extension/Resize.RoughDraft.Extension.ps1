<#
.Synopsis
    Simple video resize.
.Description
    Simply resizes a video using the scale filter.

    To control scaling with more precision, use the Scale extension.
.EXAMPLE
    Convert-Media
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#scale-1    
#>
[Runtime.CompilerServices.Extension()]              # It's an extension
[Management.Automation.Cmdlet("^(Convert|Edit|Show)","Media")]   # that extends Convert/Edit/Show-Media
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
