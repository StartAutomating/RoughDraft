<#
.Synopsis
    Normalizes loudness
.Description
    Normalizes loudness, using the loudnorm filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#loudnorm
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
[Parameter(Mandatory)]
[switch]
$NormalizeLoudness,

# Set integrated loudness target. Range is -70.0 - -5.0. Default value is -24.0.
[ValidateRange(-70.0, -5.0)]
[double]
$IntegratedLoudness,

# Set loudness range target. Range is 1.0 - 20.0. Default value is 7.0.
[ValidateRange(1.0, 20.00)]
[double]
$LoudnessRange,

# Set maximum true peak. Range is -9.0 - +0.0. Default value is -2.0.
[ValidateRange(-9.0, 0.0)]
[double]
$TruePeakLoudness,

# Set offset gain. Gain is applied before the true-peak limiter. Range is -99.0 - +99.0. Default is +0.0.
[ValidateRange(-99.0, 99.0)]
[double]
$LoudnessOffset
)

$filterParams= @(
    'linear=false'
    if ($IntegratedLoudness) {
        "i=$IntegratedLoudness"
    }
    if ($LoudnessRange) {
        "lra=$LoudnessRange"
    }
    if ($TruePeakLoudness) {
        "tp=$TruePeakLoudness"
    }
    if ($LoudnessOffset) {
        "offset=$LoudnessOffset"
    }    
) -join ':'


"-af"
"loudnorm=$filterParams" -replace '=$'
