<#
.Synopsis
    Mixes multiple audio inputs
.Description
    Mixes multiple audio inputs into a single output.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#amix
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Join-Media            
[Management.Automation.Cmdlet("Join","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will mix audio
[Parameter(Mandatory)]
[switch]
$MixAudio,

# If set, will mix audio without normalizing 
[switch]
$MixAudioWithoutNormalizing,

# How to determine the end of the stream.
[ValidateSet('longest', 'shortest', 'first')]
[string]
$MixAudioEndAt,

# Specify weight of each input audio stream as sequence.
[double[]]
$MixAudioWeight,

# The transition time, in seconds, for volume renormalization when an input stream ends. 
# The default value is 2 seconds.
[double]
$MixAudioDropOutTransition
)

$filterArgs = @(
    "inputs=$($inputMedia.Count)"
    if ($MixAudioWithoutNormalizing) {
        "normalize=disabled"
    }
    if ($MixAudioDropOutTransition) {
        "dropout_transition=$MixAudioDropOutTransition"
    }
    if ($MixAudioWeight) {
        "weights=$($MixAudioWeight -join ' ')"
    }
    if ($MixAudioEndAt) {
        "duration=$($MixAudioEndAt.ToLower())"
    } elseif ($Shortest) {
        "duration=shortest"
    }
) -join ':'
"-filter_complex"
"amix=$filterArgs [mixed]"
'-map'
'[mixed]'
"$uro"
'-y'
