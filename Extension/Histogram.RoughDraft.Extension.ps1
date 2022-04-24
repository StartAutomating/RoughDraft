<#
.SYNOPSIS
    Histogram Extension
.DESCRIPTION
    Compute and draw a color distribution histogram for the input video.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#histogram
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will display a video histogram
[Parameter(Mandatory)]
[switch]
$Histogram,

# Set height of level. Default value is 200. Allowed range is [50, 2048].
[ValidateRange(50,2048)]
[int]
$HistogramLevelHeight,

# Set height of color scale. Default value is 12. Allowed range is [0, 40].
[ValidateRange(0,40)]
[int]
$HistogramScaleHeight,

<#
Set display mode. It accepts the following values:

|Value  |Description                                            |
|-------|-------------------------------------------------------|
|stack  |Per color component graphs are placed below each other.|
|parade |Per color component graphs are placed side by side.    |
|overlay| Presents information identical to that in the parade, except that the graphs representing color components are superimposed directly over one another. |

#>
[ValidateSet('Stack','Parade','Overlay')]
[string]
$HistogramDisplayMode,

# Set mode. Can be either linear, or logarithmic. Default is linear.
[Alias('HistogramLevelsMode')]
[ValidateSet('linear','logarithmic')]
[string]
$HistogramLevelMode,

# Set what color components to display. Default is 7.
[Alias('HistogramComponents')]
[int]
$HistogramComponent,

# Set foreground opacity. Default is 0.7.
[ValidateRange(0,1)]
[float]
$HistogramForegroundOpacity,

# Set background opacity. Default is 0.5.
[ValidateRange(0,1)]
[float]
$HistogramBackgroundOpacity,

# The colormode of the histogram.
[ValidateSet('whiteonblack','blackonwhite','whiteongray','blackongray','coloronblack','coloronwhite','colorongray','blackoncolor','whiteoncolor','grayoncolor')]
[string]
$HistogramColorMode
)

$filterArgs  = @(
    if ($HistogramLevelHeight) {"level_height=$histogramLevelHeight"}
    if ($HistogramScaleHeight) {"scale_height=$HistogramScaleHeight"}
    if ($HistogramLevelMode) {"levels_mode=$($HistogramLevelMode.ToLower())"}
    if ($HistogramDisplayMode) {"display_mode=$($HistogramDisplayMode.ToLower())"}
    if ($HistogramComponent) {"components=$histogramComponent"}
    if ($HistogramForegroundOpacity) {"fgopacity=$HistogramForegroundOpacity"}
    if ($HistogramBackgroundOpacity) {"bgopacity=$HistogramBackgroundOpacity"}
    if ($HistogramColorMode) {"colors_mode=$histogramColorMode"}
    
 ) -join ':'
"-vf"
"histogram=$filterArgs" -replace '=$'

