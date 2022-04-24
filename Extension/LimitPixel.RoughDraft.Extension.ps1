<#
.SYNOPSIS
    Limits Pixel values
.DESCRIPTION
    Limits the pixel components values to the specified range [min, max].
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#limiter
.EXAMPLE
    Edit-Media -InputPath .\TestSource.gif -LimitPixel -LimitPixelMin 50 -LimitPixelMax 200
#>
[Management.Automation.Cmdlet("^(Edit|Show)","Media")]
param(
# If set, will limit pixels between a range of values.
[Parameter(Mandatory)]
[switch]
$LimitPixel,

# Lower bound. Defaults to the lowest allowed value for the input.
[string]
$LimitPixelMin,

# Upper bound. Defaults to the highest allowed value for the input.
[string]
$LimitPixelMax,

# Specify which planes will be processed. Defaults to all available.
[string]
$LimitPixelPlane
)

$filterArgs = @(
    if ($LimitPixelMin) {
        "min=$limitPixelMin"
    }
    if ($LimitPixelMax) {
        "max=$LimitPixelMax"
    }
    if ($LimitPixelPlane) {
        "planes=$limitPixelPlane"
    }
) -join ':'
"-vf", 
"limiter=$filterArgs" -replace '=$'

