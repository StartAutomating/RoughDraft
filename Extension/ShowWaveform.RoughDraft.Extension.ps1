<#
.SYNOPSIS
    Shows audio waveform.
.DESCRIPTION
    Shows a waveform of the audio, using the [showwaves filter](https://ffmpeg.org/ffmpeg-filters.html#showwaves)
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#showwaves
.EXAMPLE
    Show-Media -InputPath .\a.mp3 -ShowWaveform
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -ShowWaveform -OutputPath .\a.mp4
#>
[Management.Automation.Cmdlet("(?>New|Edit|Show)", "Media")]
param(
# If set, will show a line waveform
[Parameter(Mandatory)]
[Alias('ShowWaves')]
[switch]
$ShowWaveform,

# Set display mode
[Alias('showwaves_mode')]
[ValidateSet("point","line","p2p","cline")]
[string]
$ShowWaveformMode,

# Specify the video size for the output.  Default value is 600x200
[Alias('showwaves_size', 'ShowWavesSize')]
[string]
$ShowWaveformSize,

# Set if channels should be drawn separately or overlap
[Alias('showwaves_split_channel')]
[switch]
$ShowWaveformSplitChannel,

# Show waves color
[Alias('showwaves_colors', 'ShowWavesColor')]
[string[]]
$ShowWaveformColor,

# Set amplitude scale.
[Alias('showwaves_scale','ShowWavesScale')]
[ValidateSet('lin','log','sqrt','cbrt')]
[string]
$ShowWaveformScale
)

if ($PSBoundParameters['ShowWaveformColor']) {
    $PSBoundParameters['ShowWaveformColor'] = $PSBoundParameters['ShowWaveformColor'] -join '|'
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
    "[0:a]showwaves=${filterargs},format=$pixelFormat[v]",
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
    "$inputAudioMovieFilter,asplit=2[out1][a];[a]showwaves=${filterargs},format=yuv420p[out0]"
}

