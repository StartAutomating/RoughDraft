<#
.Synopsis
    Generates fractals
.Description
    Generates fractals using the mandelbrot filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#mandelbrot
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends New-Media            
[Management.Automation.Cmdlet("New","Media")]
# that extends Show-Media            
[Management.Automation.Cmdlet("Show","Media")]
param(
# The type of fractal source
[Parameter(Mandatory)]
[switch]
$Mandelbrot,

# Set the initial x position (from -100 to 100) (default -0.743644)
[int]
$MandelbrotStartX,

# Set the initial y position (from -100 to 100) (default -0.131826)
[int]
$MandelbrotStartY,

# set the initial scale value (from 0 to FLT_MAX) (default 3)
[double]
$MandelbrotStartScale,

# set the terminal scale value (from 0 to FLT_MAX) (default 0.3)
[double]
$MandelbrotEndScale,
# set the terminal pts value (from 0 to I64_MAX) (default 400)
[double]
$MandelbrotEndPTS,
# set the bailout value (from 0 to FLT_MAX) (default 10)
$MandelbrotBailout,       
# set morph x frequency (from -FLT_MAX to FLT_MAX) (default 0.01)
[double]
$MandelbrotMorphXFrequency,
# set morph y frequency (from -FLT_MAX to FLT_MAX) (default 0.0123)
[double]
$MandelbrotMorphYFrequency,
# set morph amplitude (from -FLT_MAX to FLT_MAX) (default 0)
[double]

$MandelbrotMorphAmplitude,
# set inner coloring mode (from 0 to INT_MAX) (default mincol)
$MandelbrotInnerColoringMode,
# set outer coloring mode (from 0 to INT_MAX) (default normalized_iteration_count)
$MandelbrotOuterColoringMode
)

$fractalSrc = "Mandelbrot"
$fractalArgs = @(
    if ($resolution) {
        "s=$resolution"
    }
    
    if ($MandelbrotStartX) {
        "start_x=$MandelbrotStartX"
    }
    if ($MandelbrotStartY) {
        "start_y=$MandelbrotStartY"
    }
    if ($MandelbrotStartScale) {
        "start_scale=$MandelbrotStartScale"
    }
    if ($MandelbrotEndScale) {
        "end_scale=$MandelbrotEndScale"
    }
    if ($MandelbrotEndPTS) {
        "end_pts=$MandelbrotEndPTS"
    }
    if ($MandelbrotBailout) {
        "bailout=$MandelbrotBailout"
    }
    if ($MandelbrotMorphXFrequency) {
        "morphxf=$MandelbrotMorphXFrequency"
    }
    if ($MandelbrotMorphYFrequency) {
        "morphyf=$MandelbrotMorphYFrequency"
    }
    if ($MandelbrotMorphAmplitude) {
        "morphamp=$MandelbrotMorphAmplitude"
    }
    if ($MandelbrotInnerColoringMode) {
        "inner=$MandelbrotInnerColoringMode"
    }
    if ($MandelbrotOuterColoringMode) {
        "outer=$MandelbrotOuterColoringMode"
    }
)

'-f'
'lavfi'
'-i'
("$fractalSrc=".ToLower() + $(
    $fractalArgs -join ':'
)) -replace '\=$'



