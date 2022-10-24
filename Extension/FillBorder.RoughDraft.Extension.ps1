<#
.Synopsis
    Fill Borders.
.Description
    Fill Borders of a video.
    
    Borders can be filled with a -FillBorderMode and a -FillBorderColor.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#fillborders
.EXAMPLE
    Edit-Media -InputPath "a.mp4" -FillBorder -FillBorderLeft 50 -FillBorderRight 50 -FillBorderTop 40 -FillBorderBottom 40 -FillBorderMode Reflect
#>
[Management.Automation.Cmdlet("^(?>Edit|Show)", "Media")]
param(
# If set, will fill borders.
[Parameter(Mandatory)]
[Alias('FillBorders')]
[switch]
$FillBorder,

# The Border Width.  This value will be used for both left and right.
[int]
$FillBorderWidth,

# The Border Height.  This value will be used for both top and bottom.
[int]
$FillBorderHeight,

# The Border Left Coordinate.
[int]
$FillBorderLeft,

# The Border Right Coordinate.
[int]
$FillBorderRight,

# The Border Top Coordinate.
[int]
$FillBorderTop,

# The Border Bottom Coordinate.
[int]
$FillBorderBottom,

# The Border Fill mode Coordinate.
[ValidateSet("smear", "mirror","fixed","reflect","wrap","fade","margins")]
[string]
$FillBorderMode,

# The color used to fill the border.
[string]
$FillBorderColor
)

$filterArgs = @(
    if ($FillBorderWidth) {
        if ($FillBorderHeight) {
            "left=$FillBorderWidth"
            "right=$FillBorderWidth"
            "bottom=$FillBorderHeight"
            "top=$FillBorderHeight"
        } else {
            "left=$FillBorderWidth"
            "right=$FillBorderWidth"
            "bottom=$FillBorderWidth"
            "top=$FillBorderHeight"
        }
    } 
    elseif ($FillBorderHeight) {
        "left=$FillBorderHeight"
        "right=$FillBorderHeight"
        "bottom=$FillBorderHeight"
        "top=$FillBorderHeight"
    }
    else {
        if ($FillBorderLeft) {
            "left=$fillborderLeft"
        }
        if ($FillBorderRight) {
            "right=$FillBorderRight"
        }
        if ($FillBorderTop) {
            "top=$FillBorderTop"
        }
        if ($fillBorderBottom) {
            "bottom=$FillBorderBottom"
        }
    }
    if ($FillBorderMode) {
        "mode=$($FillBorderMode.ToLower())"
    }
    if ($FillBorderColor) {
        "color=$FillBorderColor"
    }
) -join ':'

"-vf"
"fillborders=$filterArgs" -replace "=$"
