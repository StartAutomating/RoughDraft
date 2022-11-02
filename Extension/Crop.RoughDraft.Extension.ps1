<#
.SYNOPSIS
    Crop Extension
.DESCRIPTION
    Crops Video, using the ffmpeg crop filter
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#crop
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Send","Media")]
[Management.Automation.Cmdlet("Receive","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will crop video
[Parameter(Mandatory)]
[switch]
$CropVideo,

# The crop width
[string]
$CropWidth,

# The crop height
[string]
$CropHeight,

# The crop top coordinate
[Alias('CropY')]
[string]
$CropTop,

# The crop left coordinate
[Alias('CropX')]
[string]
$CropLeft,

# A crop expression, consisting of width/height/left/top.  This value is returned from CropDetect
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$CropExpression,

#  If set, subsampled videos will be cropped at exact width/height/x/y as specified and will not be rounded to nearest smaller value.
[switch]
$ExactCrop,

# If set, will keep the aspect ratio.  Defaults to false.
[switch]
$KeepAspectRatio
)

$filterArgs  =@(
    if ($CropExpression)
    {
        $CropExpression -replace '^crop='
    }
    else {
        if ($CropWidth) {
            "w=$cropWidth"
        }
        if ($CropHeight) {
            "h=$CropHeight"
        }
        if ($CropLeft) {
            "x=$cropLeft"
        }
        if ($CropTop) {
            "y=$cropTop"
        }                
    }
    if ($KeepAspectRatio) {
        "keep_aspect=1"
    }
    if ($ExactCrop) {
        "exact=1"
    }    
) -join ':'

"-vf"
"crop='$filterArgs'" -replace '=$'
