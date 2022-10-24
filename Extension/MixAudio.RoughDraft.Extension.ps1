
<#
.Synopsis
    Mix Audio
.Description
    Audio mixing.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#amix
#>
[Management.Automation.Cmdlet('Join', 'Media')]
param(
    # Audio mixing.
    [Parameter(Mandatory)]
    [switch]
    $MixAudio,
    # Number of inputs. 
    [Alias('amix_inputs')]
    [ValidateRange(1, 1024)]
    [int]
    $MixAudioInputs,
    # How to determine the end-of-stream. 
    [Alias('amix_duration')]
    [ValidateSet('longest','shortest', 'first')]
    [string]
    $MixAudioDuration,
    # Transition time, in seconds, for volume renormalization when an input stream ends. 
    [Alias('amix_dropout_transition')]
    [float]
    $MixAudioDropoutTransition,
    # Set weight for each input. 
    [Alias('amix_weights','MixAudioWeights')]
    [string[]]
    $MixAudioWeight
)



$filterName = 'amix'
$myCmd = $MyInvocation.MyCommand
$filterArgs = @(
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        $match=  
            foreach ($paramAlias in $myCmd.Parameters[$kv.Key].Aliases) {
                $m = [Regex]::Match($paramAlias, '_(?<p>.+)$')
                if ($m.Success) {
                    $m;break
                }
            }
        
        if ($match.Success) {
            $v = $kv.Value
            $p = $match.Value -replace '^_'
            if ($v -is [switch]) {
                $v = ($v -as [bool] -as [int]).ToString().ToLower()
            }
            if ($v -is [string] -and $myCmd.Parameters[$kv.Key].ValidateSet) {
                $v = $v.ToLower()
            }
            "$p=$($v)"
        }
    }
) -join ':'
'-af'
"$filterName=$filterArgs" -replace "=$"
 

