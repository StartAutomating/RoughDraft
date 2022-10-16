<#
.SYNOPSIS
    Shows the volume of an audio stream.
.DESCRIPTION
    Shows the volume of an audio stream, using the [showvolume filter](https://ffmpeg.org/ffmpeg-filters.html#showvolume)
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#showvolume
.EXAMPLE
    Show-Media -InputPath .\a.mp3 -ShowVolume
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -ShowVolume -OutputPath .\a.mp4
#>
[Management.Automation.Cmdlet("(?>New|Edit|Show)", "Media")]
param(
# If set, will show volume
[Parameter(Mandatory)]
[switch]
$ShowVolume,

# Set border width, allowed range is [0, 5]. Default is 1.
[validateRange(1,5)]
[alias('showvolume_b')]
[int]
$ShowVolumeBorderWidth,

# Set channel width, allowed range is [80, 8192]. Default is 400
[validateRange(80,8192)]
[alias('showvolume_w')]
[int]
$ShowVolumeChannelWidth,

# Set channel height, allowed range is [1, 900]. Default is 20.
[alias('showvolume_h')]
[validateRange(1,900)]
[int]
$ShowVolumeChannelHeight,

# Set fade, allowed range is [0, 1]. Default is 0.95.
[alias('showvolume_f')]
[validateRange(0,1)]
[double]
$ShowVolumeChannelFade,

<#
Set volume color expression.

The expression can use the following variables:

VOLUME
Current max volume of channel in dB.

PEAK
Current peak.

CHANNEL
Current channel number, starting from 0.
#>
[alias('showvolume_c')]
[string]
$ShowVolumeColorExpression,


# Set orientation, can be horizontal: h or vertical: v, default is h.
[ValidateSet('v','h','horizontal', 'vertical')]
[Alias('showvolume_o')]
[string]
$ShowVolumeOrientation,

# Set metering mode, can be peak: p or rms: r, default is p.
[ValidateSet('p','r','peak', 'rms')]
[Alias('showvolume_m')]
[string]
$ShowVolumeMode,

# Set step size, allowed range is [0, 5]. Default is 0, which means step is disabled.
[Alias('showvolume_s')]
[ValidateRange(0,5)]
[double]
$ShowVolumeStepSize,

# Set background opacity, allowed range is [0, 1]. Default is 0.
[Alias('showvolume_p')]
[ValidateRange(0,1)]
[double]
$ShowVolumeBackgroundOpacity,

# Set display scale, can be linear: lin or log: log, default is lin.
[ValidateSet('lin','log')]
[Alias('showvolume_ds')]
[string]
$ShowVolumeDisplayScale,

# In second. If set to > 0., display a line for the max level in the previous seconds. default is disabled
[Alias('showvolume_dm')]
[double]
$ShowVolumeDisplayMaxInterval,

# The color of the max line (if -ShowVolumeDisplayMaxInterval is set).
# default is 'orange'.
[Alias('showvolume_dmc')]
$ShowVolumeDisplayMaxColor
)

foreach ($ToShorten in 'ShowVolumeOrientation', 'ShowVolumeMode') {
    if ($PSBoundParameters[$ToShorten]) {
        $PSBoundParameters[$ToShorten] = $PSBoundParameters[$ToShorten].ToString().Substring(0,1).ToLower()
    }
}

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
    "[0:a]showvolume=${filterargs},format=$pixelFormat[v]",
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
    "$inputAudioMovieFilter,asplit=2[out1][a];[a]showvolume=${filterargs},format=yuv420p[out0]"
}

