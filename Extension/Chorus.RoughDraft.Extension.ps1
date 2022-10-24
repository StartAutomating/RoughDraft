
<#
.Synopsis
    chorus
.Description
    Add a chorus effect to the audio.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#chorus
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Add a chorus effect to the audio.
    [Parameter(Mandatory)]
    [switch]
    $Chorus,
    # set input gain 
    [Alias('chorus_in_gain')]
    [ValidateRange(0, 1)]
    [float]
    $ChorusInGain,
    # set output gain 
    [Alias('chorus_out_gain')]
    [ValidateRange(0, 1)]
    [float]
    $ChorusOutGain,
    # set delays
    [Alias('chorus_delays', 'ChorusDelays')]
    [string[]]
    $ChorusDelay,
    # set decays
    [Alias('chorus_decays', 'ChorusDecays')]
    [string[]]
    $ChorusDecay,
    # set speeds
    [Alias('chorus_speeds', 'ChorusSpeeds')]
    [string[]]
    $ChorusSpeed,
    # set depths
    [Alias('chorus_depths', 'ChorusDepths')]
    [string[]]
    $ChorusDepth
)



$filterName = 'chorus'
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
            if ($v -is [string[]]) {
                $v = $v -join '|'
            }
            "$p=$($v)"
        }
    }
) -join ':'
'-af'


"$filterName=$filterArgs" -replace "=$"
 

