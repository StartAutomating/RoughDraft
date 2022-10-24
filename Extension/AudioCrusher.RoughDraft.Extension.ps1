
<#
.Synopsis
    Audio Crusher
.Description
    Reduce audio bit resolution.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#acrusher
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Reduce audio bit resolution.
    [Parameter(Mandatory)]
    [switch]
    $AudioCrusher,
    # set level in 
    [double]
    [Alias('acrusher_level_in')]
    $AudioCrusherLevelIn,
    # set level out 
    [double]
    [Alias('acrusher_level_out')]
    $AudioCrusherLevelOut,
    # set bit reduction 
    [ValidateRange(1, 64)]
    [double]
    [Alias('acrusher_bits')]
    $AudioCrusherBits,
    # set mix 
    [ValidateRange(0, 1)]
    [double]
    [Alias('acrusher_mix')]
    $AudioCrusherMix,
    # set mode 
    
    [ValidateSet('lin','log')]
    [string]
    [Alias('acrusher_mode')]
    $AudioCrusherMode,
    # set DC 
    [double]
    [Alias('acrusher_dc')]
    $AudioCrusherDc,
    # set anti-aliasing 
    [ValidateRange(0, 1)]
    [double]
    [Alias('acrusher_aa')]
    $AudioCrusherAa,
    # set sample reduction 
    [ValidateRange(1, 250)]
    [double]
    [Alias('acrusher_samples')]
    $AudioCrusherSamples,
    # enable LFO 
    [switch]
    [Alias('acrusher_lfo')]
    $AudioCrusherLfo,
    # set LFO depth 
    [ValidateRange(1, 250)]
    [double]
    [Alias('acrusher_lforange')]
    $AudioCrusherLforange,
    # set LFO rate 
    [double]
    [Alias('acrusher_lforate')]
    $AudioCrusherLforate
)



$filterName = 'acrusher'
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
 

