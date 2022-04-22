<#
.Synopsis
    Applies a vignette filter
.Description
    Applies a vignette filter to a video source.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#vignette
#>
[Runtime.CompilerServices.Extension()]  # It's an extension
[Management.Automation.Cmdlet("^(Edit|Show)","Media")] # that extends Edit/Show-Media
param(
[Parameter(Mandatory)]
[switch]
$Vignette,

# Set vignette lens angle expression as a number of radians.
# The value is clipped in the [0,PI/2] range.
# Default value: "PI/5"
[string]
$VignetteAngle,

# Set vignette center x coordinates expression. By default "w/2",
[string]
$VignetteCenterX,

# Set vignette center Y coordinates expression. By default "w/2",
[string]
$VignetteCenterY,

# Set forward/backward mode.
# Available values are:
# * ‘forward’  
#   * The larger the distance from the central point, the darker the image becomes.
# * ‘backward’
#   * The larger the distance from the central point, the brighter the image becomes. 
#   * This can be used to reverse a vignette effect, though there is no automatic detection to extract the lens angle and other settings (yet). 
#   * It can also be used to create a burning effect.
[ValidateSet('forward', 'backward')]
[string]
$VignetteDirection,

# Set evaluation mode for the -VignetteAngle, -VignetteCenterX, -VignetteCenterY expressions
# *‘init’
#   * Evaluate expressions only once during the filter initialization.
# *‘frame’
#   * Evaluate expressions for each incoming frame. 
#   * This is way slower than the ‘init’ mode since it requires all the scalers to be re-computed, but it allows advanced dynamic expressions.
[ValidateSet('init','frame')]
[string]
$VignetteEvaluatioMode,

# Set dithering to reduce the circular banding effects
[switch]
$DoNotDitherVignette,

# Set vignette aspect. 
# This setting allows one to adjust the shape of the vignette. 
# Setting this value to the SAR of the input will make a rectangular vignetting following the dimensions of the video.
[string]
$VignetteAspectRatio
)

$filterArgs  =@(
    if ($VignetteAngle) {
        "angle=$VignetteAngle"
    }
    if ($VignetteCenterX) {
        "x0=$VignetteCenterX"
    }
    if ($VignetteCenterY) {
        "y0=$VignetteCenterY"
    }
    if ($VignetteDirection) {
        "mode=$VignetteDirection"
    }
    if ($VignetteEvaluationMode) {
        "eval=$VignetteEvaluationMode"
    }
    if ($VignetteAspectRatio) {
        "aspect=$VignetteAspectRatio"
    }
    if ($DoNotDitherVignette) {
        "dither=0"
    } else {
        "dither=1"
    }
) -join ':'

"-vf"
"vignette=$filterArgs" -replace '=$'
