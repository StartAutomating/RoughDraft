<#
.Synopsis
    Adds chorus to audio
.Description
    Add a chorus effect to the audio.

    Chorus resembles an echo effect with a short delay. 
    
    With echo the delay is constant, with chorus, it is varied using using sinusoidal or triangular modulation. 
    
    The modulation depth defines the range the modulated delay is played before or after the delay.
    
    Hence the delayed sound will sound slower or faster, 
    that is the delayed sound tuned around the original one, 
    like in a chorus where some vocals are slightly off key.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#chorus
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will remove a logo
[Parameter(Mandatory)]
[switch]
$Chorus,

# Set input gain of reflected signal. Default is 0.4.
[double]
$ChorusInputGain,

# Set output gain of reflected signal. Default is 0.4.
[double]
$ChorusOutputGain,

# Set list of time intervals in milliseconds between original signal and reflections. Allowed range for each delay is (0 - 90000.0). Default is 1000
[Alias('ChorusDelays')]
[ValidateRange(0,90000.0)]
[double[]]
$ChorusDelay,

# Set list of loudness of reflected signal
# Allowed range for each decay is (0 - 1.0)
[ValidateRange(0,1)]
[Alias('ChorusDecays')]
[double[]]
$ChorusDecay,

# Set chorus speeds
[double[]]
$ChorusSpeed,

# Set chorus depths
[double[]]
$ChorusDepth
)

$filterArgs = @(
    if ($ChorusInputGain) {
        "in_gain=$ChorusInputGain"
    }
    if ($ChorusOutputGain) {
        "out_gain=$ChorusOutputGain"
    }
    if ($ChorusDelay) {
        "delays=$($ChorusDelay -join '|')"
    }
    if ($ChorusDecay) {
        "decays=$($ChorusDecay -join '|')"
    }
    if ($ChorusSpeed) {
        "speed=$($ChorusSpeed -join '|')"
    }
    if ($ChorusDepth) {
        "depth=$($ChorusDepth -join '|')"
    }
) -join ':'
"-af"
"chorus=$filterArgs" -replace '=$'

