<#
.Synopsis
    Watermarks a video
.Description
    Watermarks a video, using the overlay filter.
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Runtime.CompilerServices.Extension()]
param(
# The path to the watermark file.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[Alias('WatermarkInputPath')]
[string]
$WatermarkPath,

# The X coordinate for the watermark.  
# If the coordinate is positive, then it will be relative to the top.  
# If the coordinate is negative, it will be relative to the bottom.
[Int32]
$WatermarkX = -5,

# The Y coordinate for the watermark
# If the coordinate is positive, then it will be relative to the top.  
# If the coordinate is negative, it will be relative to the bottom.
[Int32]
$WatermarkY = -5,

# If set, will put the watermark at the center of the video.  X and Y will be ignored
[Switch]
$CenterWatermark
)


if ($CenterWatermark) {
    $ComplexFilterParts = @()
    $ComplexFilterParts += 
        if ($PSBoundParameters.WatermarkX) { 
            if ($WatermarkX -ge 0) {
                "x=$WatermarkX"
            } else {
                "x=main_w-overlay_w$WatermarkX"
            }
        } else {
            "x=(main_w-overlay_w)/2"
        }
    $ComplexFilterParts +=
        if ($PSBoundParameters.WatermarkY) {
            if ($WatermarkY -ge 0) {
                "y=$WatermarkY"
            } else {
                "y=main_h-overlay_h$WatermarkY"
            }
        } else {
            "y=(main_h-overlay_h)/2"
        }            
    $TheComplexFilter = "overlay=$($ComplexFilterParts -join ':')"
} else {
    $ComplexFilterParts = @()
    $ComplexFilterParts += 
        if ($WatermarkX -ge 0) {
            "x=$WatermarkX"
        } else {
            "x=main_w-overlay_w$WatermarkX"
        }
            
    $ComplexFilterParts +=
        if ($WatermarkY -ge 0) {
            "y=$WatermarkY"
        } else {
            "y=main_h-overlay_h$WatermarkY"
        }            
    $TheComplexFilter = "overlay=$($ComplexFilterParts -join ':')"
}

$ComplexFilterParts = @()
$ComplexFilterParts += 
    if ($PSBoundParameters.WatermarkX) { 
        if ($X -ge 0) {
            "x=$X"
        } else {
            "x=main_w-overlay_w$WatermarkX"
        }
    } else {
        "x=(main_w-overlay_w)/2"
    }
$ComplexFilterParts +=
    if ($PSBoundParameters.WatermarkY) {
        if ($Y -ge 0) {
            "y=$y"
        } else {
            "y=main_h-overlay_h$WatermarkY"
        }
    } else {
        "y=(main_h-overlay_h)/2"
    }            
$TheComplexFilter = "overlay=$($ComplexFilterParts -join ':')"
$wri = 
 if ([IO.File]::Exists($WatermarkPath)) {
    $WatermarkPath
} else {
    $ExecutionContext.SessionState.path.GetResolvedPSPathFromPSPath($WatermarkPath)
}
'-i'
"$wri"
'-filter_complex'
"$TheComplexFilter"
