
<#
.Synopsis
    Audio Phaser
.Description
    Add a phasing effect to the audio.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#aphaser
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Add a phasing effect to the audio.
    [Parameter(Mandatory)]
    [switch]
    $Phaser,
    # set input gain 
    [ValidateRange(0, 1)]
    [double]
    [Alias('aphaser_in_gain')]
    $PhaserInGain,
    # set output gain 
    [ValidateRange(0, 1)]
    [double]
    [Alias('aphaser_out_gain')]
    $PhaserOutGain,
    # set delay in milliseconds 
    [ValidateRange(0, 5)]
    [double]
    [Alias('aphaser_delay')]
    $PhaserDelay,
    # set decay 
    
    [double]
    [Alias('aphaser_decay')]
    $PhaserDecay,
    # set modulation speed 
    [ValidateRange(0.01,2)]
    [double]
    [Alias('aphaser_speed')]
    $PhaserSpeed,
    # set modulation type 
    [ValidateSet('triangular','sinusoidal')]
    [Alias('aphaser_type')]
    $PhaserType
)



$filterName = 'aphaser'
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
 

