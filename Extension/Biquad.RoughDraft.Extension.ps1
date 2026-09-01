<#
.SYNOPSIS
    Biquad Filter
.DESCRIPTION
    Apply a biquad IIR filter with the given coefficients.
    
    Where b0, b1, b2 and a0, a1, a2 are the numerator and denominator coefficients respectively.    
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#biquad
#>
[Management.Automation.Cmdlet("(?>Edit|Show)","Media")]
param(
# If set, will use the `biquad` filter
[Parameter(Mandatory)]
[switch]
$Biquad,

# Biquad Denominator 0
[double]
$BiqaudA0,

# Biquad Denominator 1
[double]
$BiqaudA1,

# Biquad Denominator 2
[double]
$BiqaudA2,

# Biquad Numerator 0
[double]
$BiqaudB0,

# Biquad Numerator 1
[double]
$BiqaudB1,

# Biquad Numerator 2
[double]
$BiqaudB2,

# Normalize biquad coefficients, by default is disabled.
# Enabling it will normalize magnitude response at DC to 0dB.
[switch]
$BiquadNormalize,

# Set transform type of IIR filter.
[ValidateSet('di','dii','tdi','tdii','latt','svf','zdf')]
[string]
$BiquadTransform,

# Set precision of filtering.
[ValidateSet('auto','s16','s32','f32','f64')]
[string]
$BiquadPrecision,

# Set block size used for reverse IIR processing.
# If this value is set to high enough value
# (higher than impulse response length truncated when reaches near zero values)
# filtering will become linear phase otherwise if not big enough it will just produce nasty artifacts.
# 
# Note that filter delay will be exactly this many samples when set to non-zero value.
[int]
$BiquadBlockSize,

# Specify which channels to filter, by default all available are filtered.
[Alias('BiquadChannels')]
[string]
$BiquadChannel,

# How much to use biquad signal in output.
# Default is 1. 
# Range is between 0 and 1.
[ValidateRange(0, 1)]
[double]
$BiquadMix
)

"-af" #Audio Filter

$filterArgs =@(
    if ($BiqaudA0) { "ao=$BiqaudA0"}
    if ($BiqaudA1) { "a1=$BiqaudA1"}
    if ($BiqaudA2) { "a2=$BiqaudA2"}    
    if ($BiqaudB0) { "bo=$BiqaudB0"}
    if ($BiqaudB1) { "b1=$BiqaudB1"}
    if ($BiqaudB2) { "b2=$BiqaudB2"}
    if ($BiquadBlockSize) { "block_size=$biquadBlockSize"}
    if ($BiquadChannel) { "channels=$($BiquadChannel.ToLower())"}
    if ($BiquadTransform) { "transform=$($BiquadTransform.ToLower())"}
    if ($BiquadPrecision) { "precision=$($BiquadPrecision.ToLower())"}
    if ($BiquadNormalize) { "normalize=1"}
    if ($BiquadMix) { "mix=$BiquadMix"}
) -join ':'

"biquad=$FilterArgs" -replace '=$'