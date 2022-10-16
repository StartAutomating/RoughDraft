<#
.SYNOPSIS
    Shows the audio spectrum
.DESCRIPTION
    Shows the audio spectrum, using the [showspectrum filter](https://ffmpeg.org/ffmpeg-filters.html#showspectrum)
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#showspectrum
.EXAMPLE
    Show-Media -InputPath .\a.mp3 -ShowSpectrum
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -ShowSpectrum -OutputPath .\a.mp4
#>
[Management.Automation.Cmdlet("(?>New|Edit|Show)", "Media")]
param(
# If set, will show a line waveform
[Parameter(Mandatory)]
[switch]
$ShowSpectrum,

# Set display mode
[Alias('showspectrum_mode')]
[ValidateSet("combined","separate")]
[string]
$ShowSpectrumMode,

<#
Specify how the spectrum should slide along the window.

It accepts the following values:

* replace   - The samples start again on the left when they reach the right
* scroll    - the samples scroll from right to left
* fullframe - frames are only produced when the samples reach the right
* rscroll   - the samples scroll from left to right
* lreplace  - the samples start again on the right when they reach the left
#>
[Alias('showspectrum_slide')]
[ValidateSet("replace","scroll","fullframe","rscroll","lreplace")]
[string]
$ShowSpectrumSlide,

# Specify the video size for the output.  Default value is 600x200
[Alias('showspectrum_size')]
[string]
$ShowSpectrumSize,

<#

Show spectrum color mode

* channel     - each channel is displayed in a separate color
* intensity   - each channel is displayed using the same color scheme
* rainbow     - each channel is displayed using the rainbow color scheme
* moreland    - each channel is displayed using the moreland color scheme
* nebulae     - each channel is displayed using the nebulae color scheme
* fire        - each channel is displayed using the fire color scheme
* fiery       - each channel is displayed using the fiery color scheme
* fruit       - each channel is displayed using the fruit color scheme
* cool        - each channel is displayed using the cool color scheme
* magma       - each channel is displayed using the magma color scheme
* green       - each channel is displayed using the green color scheme
* viridis     - each channel is displayed using the viridis color scheme
* plasma      - each channel is displayed using the plasma color scheme
* cividis     - each channel is displayed using the cividis color scheme
* terrain     - each channel is displayed using the terrain color scheme
#>

[Alias('showspectrum_color')]
[ValidateSet('channel','intensity','rainbow','moreland','nebulae','fire','fiery','fruit','cool','magma','green','viridis','plasma','cividis','terrain')]
[string]
$ShowSpectrumColorMode,

# Specify scale used for calculating intensity color values.
[Alias('showspectrum_scale')]
[ValidateSet('lin','log','sqrt','cbrt','4thrt','5thrt')]
[string]
$ShowSpectrumColorScale,

# Specify frequency scale.
[Alias('showspectrum_fscale')]
[ValidateSet('lin','log')]
[string]
$ShowSpectrumFrequencyScale,

# Set saturation modifier for displayed colors.
# Negative values provide alternative color scheme.
# 0 is no saturation at all.
# Saturation must be in [-10.0, 10.0] range. Default value is 1.
[ValidateRange(-10.0,10.0)]
[Alias('showspectrum_saturation')]
[double]
$ShowSpectrumSaturation,

# Set window function.
[Alias('showspectrum_win_func')]
[ValidateSet(
    'rect','bartlett','hann','hanning','hamming','blackman','welch','flattop',
    'bharris','bnuttall','bhann','sine','nuttall','lanczos','gauss','tukey',
    'dolph','cauchy','parzen','poisson','bohman')]
[string]
$ShowSpectrumWindowFunction,

# Set orientation of time vs frequency axis
[alias('showspectrum_orientation')]
[ValidateSet('horizontal', 'vertical')]
[string]
$ShowSpectrumOrientation,

# Set ratio of overlap window. Default value is 0. When value is 1 overlap is set to recommended size for specific window function currently used.
[alias('showspectrum_overlap')]
[ValidateRange(0,1)]
[double]
$ShowSpectrumOverlap,

# Set scale gain for calculating intensity color values. Default value is 1.
[alias('showspectrum_gain')]
[double]
$ShowSpectrumGain,

# Set which data to display. Can be magnitude, default or phase, or unwrapped phase: uphase.
[alias('showspectrum_data')]
[ValidateSet('magnitude','phase','uphase')]
[string]
$ShowSpectrumData,

# Set color rotation, must be in [-1.0, 1.0] range. Default value is 0
[alias('showspectrum_rotation')]
[ValidateRange(-1,1)]
[double]
$ShowSpectrumColorRotation,

# Set start frequency from which to display spectrogram.
[Alias('showspectrum_start', 'ShowSpectrumBeginFrequency')]
[int]
$ShowSpectrumStartFrequency,

# Set stop frequency to which to display spectrogram.
[Alias('showspectrum_stop', 'ShowSpectrumEndFrequency')]
[int]
$ShowSpectrumStopFrequency,

# Set upper frame rate limit. Default is auto, unlimited.
[Alias('showspectrum_fps', 'ShowSpectrumFPS')]
[string]
$ShowSpectrumFramesPerSecond,

# Draw time and frequency axes and legends.  
[Alias('showspectrum_legend')]
[switch]
$ShowSpectrumLegend,

# Set dynamic range used to calculate intensity color values. Default is 120 dBFS. Allowed range is from 10 to 200
[Alias('showspectrum_drange')]
[ValidateRange(10,200)]
[int]
$ShowSpectrumDynamicRange,

# Set upper limit of input audio samples volume in dBFS. Default is 0 dBFS. Allowed range is from -100 to 100.
[Alias('showspectrum_limit')]
[ValidateRange(-100,100)]
[int]
$ShowSpectrumLimit,

# Set opacity strength when using pixel format output with alpha component.
[Alias('showspectrum_opacity')]
[double]
$ShowSpectrumOpacity
)

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
    "[0:a]showspectrum=${filterargs},format=$pixelFormat[v]",
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
    "$inputAudioMovieFilter,asplit=2[out1][a];[a]showspectrum=${filterargs},format=yuv420p[out0]"
}

