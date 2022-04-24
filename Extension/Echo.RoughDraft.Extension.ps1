<#
.Synopsis
    Adds echoes to audio
.Description
    Apply echoing to the input audio.
    
    Echoes are reflected sound and can occur naturally amongst mountains (and sometimes large buildings) when talking or shouting; 
    digital echo effects emulate this behaviour and are often used to help fill out the sound of a single instrument or vocal. 
    
    The time difference between the original signal and the reflection is the delay, 
    and the loudness of the reflected signal is the decay. 
    
    Multiple echoes can have different delays and decays.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#aecho
#>

[Runtime.CompilerServices.Extension()]          # It's an extension
[Management.Automation.Cmdlet("^Edit|Show","Media")]  # that extends Edit/Show-Media
[ComponentModel.Inheritance("Inherited")]       # that is not inherited
param(
# If set, will remove a logo
[Parameter(Mandatory)]
[switch]
$Echo,

# Set input gain of reflected signal. Default is 0.6.
[double]
$EchoInputGain,

# Set output gain of reflected signal. Default is 0.3.
[double]
$EchoOutputGain,

# Set list of time intervals in milliseconds between original signal and reflections. Allowed range for each delay is (0 - 90000.0). Default is 1000
[Alias('EchoDelays')]
[ValidateRange(0,90000.0)]
[double[]]
$EchoDelay,

# Set list of loudness of reflected signal
# Allowed range for each decay is (0 - 1.0)
[ValidateRange(0,1)]
[Alias('EchoDecays')]
[double[]]
$EchoDecay
)

$filterArgs = @(
    if ($EchoInputGain) {
        "in_gain=$EchoInputGain"
    }
    if ($EchoOutputGain) {
        "out_gain=$EchoOutputGain"
    }
    if ($EchoDelay) {
        "delays=$($EchoDelay -join '|')"
    }
    if ($EchoDecay) {
        "decays=$($EchoDecay -join '|')"
    }
) -join ':'
"-af"
"aecho=$filterArgs"

