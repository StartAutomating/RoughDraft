<#
.SYNOPSIS
    Exposure Extension
.DESCRIPTION
    Adjusts video Exposure, using the [exposure filter](https://ffmpeg.org/ffmpeg-filters.html#exposure)
.EXAMPLE
    Edit-Media -InputPath a.mp4 -SetExposure 
#>
[Management.Automation.Cmdlet("^Edit|Show", "Media")]
param(
# If set, will adjust exposure
[Parameter(Mandatory)]
[switch]
$SetExposure,

# Set the exposure correction in EV. Allowed range is from -3.0 to 3.0.
[ValidateRange(-3,3)]
[double]
$ExposureCorrection,

# Set the black level correction.   Allowed range is from -1.0 to 1.0.
[ValidateRange(-1,1)]
[double]
$ExposureBlackCorrection
)

$filterArgs = @(
    if ($ExposureCorrection) {
        "exposure=$ExposureCorrection"
    }
    if ($ExposureBlackCorrection) {
        "black=$exposureBlackCorrection"
    }
) -join ':'

"-vf"
"exposure=$filterArgs" -replace "=$"
