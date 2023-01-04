
<#
.Synopsis
    Finite Equalizer
.Description
    Finite Impulse Response Equalizer.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#firequalizer
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -FiniteEqualizer -FiniteEqualizerGain @'
if(eq(chid,1), gain_interpolate(f), if(eq(chid,2), gain_interpolate(1e6+f), 0))
'@ -FiniteEqualizerGainentry @'
entry(1000, 0); entry(1001,-INF); entry(1e6+1000,0)
'@
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Finite Impulse Response Equalizer.
    [Parameter(Mandatory)]
    [switch]
    $FiniteEqualizer,


    <#
    Set gain curve equation (in dB).
    
    
    The expression can contain variables:

    f
    the evaluated frequency

    sr
    sample rate

    ch
    channel number, set to 0 when multichannels evaluation is disabled

    chid
    channel id, see libavutil/channel_layout.h, set to the first channel id when multichannels evaluation is disabled

    chs
    number of channels

    chlayout
    channel_layout, see libavutil/channel_layout.h

    and functions:

    gain_interpolate(f)
    interpolate gain on frequency f based on gain_entry

    cubic_interpolate(f)
    same as gain_interpolate, but smoother

    #>

    [Alias('firequalizer_gain')]
    [string]
    $FiniteEqualizerGain,
    <#
    Set gain entry for gain_interpolate function. The expression can contain functions:

    entry(f, g)
    store gain entry at frequency f with value g

    This option is also available as command.
    #>
    [Alias('firequalizer_gain_entry')]
    [string]
    $FiniteEqualizerGainentry,
    # Set filter delay in seconds. Higher value means more accurate.
    [Alias('firequalizer_delay')]    
    [double]
    $FiniteEqualizerDelay,

    # Set filter accuracy in Hz. Lower value means more accurate. 
    [Alias('firequalizer_accuracy')]    
    [double]
    $FiniteEqualizerAccuracy,

    # set window function 
    [Alias('firequalizer_wfunc')]
    [ValidateSet(
        'rectangular','hann','hamming','blackman','nuttall3','mnuttall3','nuttall','bnuttall','bharris','tukey'
    )]
    [string]
    $FiniteEqualizerWindowFunction,
    # If enabled, use fixed number of audio samples. This improves speed when filtering with large delay. Default is disabled.
    [Alias('firequalizer_fixed')]
    [switch]
    $FiniteEqualizerFixed,
    # Enable multichannels evaluation on gain.
    [Alias('firequalizer_multi')]
    [switch]
    $FiniteEqualizerMultichannel,
    # Enable zero phase mode by subtracting timestamp to compensate delay.
    [Alias('firequalizer_zero_phase')]
    [switch]
    $FiniteEqualizerZeroPhase,
    # set gain scale 
    [Alias('firequalizer_scale')]
    [ValidateSet('linlin','linlog', 'loglin','loglog')]
    [string]
    $FiniteEqualizerScale,
    # set dump file
    [Alias('firequalizer_dumpfile')]
    [string]
    $FiniteEqualizerDumpfile,
    # set dump scale 
    [Alias('firequalizer_dumpscale')]
    [switch]
    $FiniteEqualizerDumpscale,
    # Enable 2-channel convolution using complex FFT.
    [Alias('firequalizer_fft2')]
    [switch]
    $FiniteEqualizerFft2,
    # Enable minimum phase impulse response.
    [Alias('firequalizer_min_phase')]
    [switch]
    $FiniteEqualizerMinphase
)



$filterName = 'firequalizer'
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
            "$p='$($v)'"
        }
    }
) -join ':'
'-af'


"$filterName=$filterArgs" -replace "=$"
 

