
<#
.Synopsis
    Show Frequencies
.Description
    Convert input audio to a frequencies video output.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#showfreqs
#>

[Management.Automation.Cmdlet("(?>New|Edit|Show)", "Media")]

param(
    # Convert input audio to a frequencies video output.
    [Parameter(Mandatory)]
    [switch]
    $ShowFrequency,
    # set video size     
    [Alias('showfreqs_size')]
    [string]
    $ShowFrequencySize,
    # set display mode 
    
    [Alias('showfreqs_mode')]
    [ValidateSet('line','bar','dot')]
    [string]
    $ShowFrequencyMode,

    # set amplitude scale     
    [Alias('showfreqs_ascale')]
    [ValidateSet('lin','sqrt','cbrt','log')]
    [string]
    $ShowFrequencyAmplitudeScale,

    # set frequency scale     
    [Alias('showfreqs_fscale')]
    [ValidateSet('lin','log','rlog')]
    [string]    
    $ShowFrequencyScale,

    # set window size 
    [ValidateRange(16, 65536)]
    [int]
    [Alias('showfreqs_win_size')]
    $ShowFrequencyWindowSize,
    # set window function 
    [string]
    [Alias('showfreqs_win_func')]
    [ValidateSet(
        'rect','bartlett','hanning','hamming','blackman','welch',
        'flattop','bharris','bnuttall','bhann','sine','nuttall','lanczos',
        'gauss','tukey','dolph','cauchy','parzen','poisson','bohman','kaiser'
    )]    
    $ShowFrequencyWindowFunction,
    # set window overlap 
    [ValidateRange(0, 1)]
    [float]
    [Alias('showfreqs_overlap')]
    $ShowFrequencyOverlap,
    # set time averaging 
    [int]
    [Alias('showfreqs_averaging')]
    $ShowFrequencyAveraging,
    # set channels colors     
    [Alias('showfreqs_colors')]
    [string]
    $ShowFrequencyColors,
    # set channel mode     
    [Alias('showfreqs_cmode')]
    [validateset("combined","separate")]
    $ShowFrequencyChannelMode,
    # set minimum amplitude 
    [float]
    [Alias('showfreqs_minamp')]
    $ShowFrequencyMinimumAmplitude,

    # Set data display mode.
    [ValidateSet('magnitude','phase','delay')]
    [Alias('showfreqs_data')]    
    [string]
    $ShowFrequencyDataDisplayMode
)



$filterName = 'showfreqs'
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

if ($commandName -eq 'Edit-Media') {
    "-filter_complex"
    "[0:a]showfreqs=${filterargs},format=$pixelFormat[v]",
    "-map",
    "[v]",
    "-map",
    '0:a',
    '-c:v',
    'libx264',
    '-c:a',
    'copy'
} else {
    "-f"
    "lavfi"
    "$inputAudioMovieFilter,asplit=2[out1][a];[a]showfreqs=${filterargs},format=yuv420p[out0]"
}

 
