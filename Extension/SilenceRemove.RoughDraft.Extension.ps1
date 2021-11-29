<#
.Synopsis
    Detects silence in an audio stream
.Description
    Detects silence in an audio stream, using the silencedetect filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#silenceremove
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
param(
# If set, will remove silence.
[Parameter(Mandatory)]
[switch]
$RemoveSilence,

# The Silence Duration
[Timespan]
$SilenceDuration = "00:00:00.0",

# The noise tolerance (by default 0.1%)  
# If this is a number between 0 and 1 it will be treated as an amplitude ratio.
# Otherwise, it will be treated as a decibal value.
[Parameter(ValueFromPipelineByPropertyName=$true)]
[double]
$SilenceThreshold = 0.001,

# If set, will find silence within any channel of audio 
[Parameter(ValueFromPipelineByPropertyName=$true)]
[switch]
$AnyChannel,

# The number of periods of silence at the start of the sample that will be trimmed.  
# The default is one (which trims leading silence)
# To not trim leading silence, pass a value of 0
# To trim more than one period of silence, pass a value greater than one.   
[Parameter(ValueFromPipelineByPropertyName=$true)]
[Alias('Start_Periods','SP','StartAtPeriod')]
[int]
$SilenceStartPeriod = 1,

# The number of periods of silence at the end of the sample that will be trimmed.
# The default is 0 (trim after the last silence, but don't trim between the first and last silence)    
[Parameter(ValueFromPipelineByPropertyName=$true)]
[Alias('Stop_Periods', 'EP', 'EndAtPeriod')]
[int]
$SilenceStopPeriod = 0
)

$silenceOptions = 
    @(
        if ($psBoundParameters.AnyChannel) {
            if ($anyChannel) {
                "start_mode=any"
                "start_stop=any"
            } else {
                "start_mode=all"
                "stop_mode=all"
            }
        }
        if ($Duration) {
            "start_duration=$($Duration.TotalSeconds)"
        }
        "start_periods=$StartPeriod"
        "stop_periods=$StopPeriod"
        if ($threshold) {
            $t = 
                if ($Threshold -ge 0 -and $Threshold -le 1){
                    $Threshold
                } else {"${Threshold}dB"}
            "start_threshold=$t"
            "stop_threshold=$t"
        }
    )
$silenceRemove = "silenceremove=$($silenceOptions -join ':')"
if ($silenceRemove.EndsWith('=')) {
    $silenceRemove = $silenceRemove.TrimEnd('=')
}

'-af'
$silenceRemove
