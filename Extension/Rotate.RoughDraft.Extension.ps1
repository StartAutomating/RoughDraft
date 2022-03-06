<#
.Synopsis
    Rotates a video
.Description
    Applies the rotate filter to rotate a video.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#rotate
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#transpose-1    
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
[string]
$Rotate,

[string]
$RotateFillColor
)

$intRotate = $Rotate -as [int]
if ($Rotate) { # If we're going to rotate the video 
    "-vf" 
    if ($null -ne $intRotate -and 
        -not ($intRotate % 90)) { # And the angle is an int and a factor of 90 degrees
        # Use the [transpose videofilter](https://ffmpeg.org/ffmpeg-filters.html#transpose-1)
        $intRotate = $intRotate % 360
        "`"transpose=$(if ($intRotate  -eq 90) { 1 } elseif ($intRotate -eq 180) { 2 } elseif ($intRotate -eq 270)  { 3})`""
    }
    else {
        $filterArgs = @(
            "a=$rotate"
            if ($RotateFillColor){
                "fillcolor=$rotateFillColor"
            }
        ) -join ':'
        "`"rotate=$filterArgs`""
    }
}
