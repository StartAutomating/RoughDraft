<#
.SYNOPSIS
    Show the tonal scale of the audio
.DESCRIPTION
    Show the tonal scale of the audio, using the showcqt filter
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#showqct
.EXAMPLE
    Show-Media -InputPath .\a.mp3 -ShowScale
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -ShowScale -OutputPath .\a.mp4
#>
[Management.Automation.Cmdlet("(?>New|Edit|Show)", "Media")]
param(
# If set, will show volume
[Parameter(Mandatory)]
[switch]
$ShowScale,

# Specify the video size for the output.  Default value is 1920x1080
[Alias('showcqt_size')]
[string]
$ShowScaleSize,

# Set the bargraph height. It must be even. Default value is -1 which computes the bargraph height automatically.
[alias('showcqt_bar_h')]
[int]
$ShowScaleBarGraphHeight,

# Set the axis height. It must be even. Default value is -1 which computes the axis height automatically.
[alias('showcqt_axis_h')]
[int]
$ShowScaleAxisHeight,

# Set the sonogram height. It must be even. Default value is -1 which computes the sonogram height automatically.
[alias('showcqt_sono_h')]
[int]
$ShowScaleSonogramHeight,

<#
Specify the sonogram volume expression

It can contain variables:

|Variable|Description|
|-|-|
|bar_v|the bar_v evaluated expression|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|

and functions:

|Function|Description|
|-|-|
|a_weighting(f)|A-weighting of equal loudness|
|b_weighting(f)|B-weighting of equal loudness|
|c_weighting(f)|C-weighting of equal loudness|

#>

[alias('showcqt_sono_v')]
[string]
$ShowScaleSonogramVolume,


<#
Specify the bargraph volume expression

It can contain variables:

|Variable|Description|
|-|-|
|bar_v|the bar_v evaluated expression|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|

and functions:

|Function|Description|
|-|-|
|a_weighting(f)|A-weighting of equal loudness|
|b_weighting(f)|B-weighting of equal loudness|
|c_weighting(f)|C-weighting of equal loudness|

#>
[alias('showcqt_bar_v')]
[string]
$ShowScaleBarGraphVolume,

# Specify the sonogram gamma. Lower gamma makes the spectrum more contrast, higher gamma makes the spectrum having more range. Default value is 3. Acceptable range is [1, 7].
[Alias('showcqt_sono_g')]
[ValidateRange(1,7)]
[double]
$ShowScaleSonogramGamma,

# Specify the bargraph gamma. Default value is 1.
[Alias('showcqt_bar_g')]
[ValidateRange(1,7)]
[double]
$ShowScaleBarGraphGamma,

# Specify the bargraph transparency level. Lower value makes the bargraph sharper. Default value is 1
[Alias('showcqt_bar_t')]
[double]
$ShowScaleBarGraphTransparency,

# Specify the transform timeclamp.
# At low frequency, there is trade-off between accuracy in time domain and frequency domain.
# If timeclamp is lower, event in time domain is represented more accurately (such as fast bass drum),
# otherwise event in frequency domain is represented more accurately (such as bass guitar).
# Acceptable range is [0.002, 1]. Default value is 0.17.
[Alias('showcqt_timeclamp')]
[ValidateRange(0.002, 1)]
[double]
$ShowScaleTimeclamp,

# Set attack time in seconds.
# The default is 0 (disabled).
# Otherwise, it limits future samples by applying asymmetric windowing in time domain,
# useful when low latency is required. Accepted range is [0, 1].
[Alias('showcqt_attack')]
[ValidateRange(0, 1)]
[double]
$ShowScaleAttack,

# Specify the transform base frequency.
# Default value is 20.01523126408007475, which is frequency 50 cents below E0.
# Acceptable range is [10, 100000].
[Alias('showcqt_basefreq')]
[ValidateRange(10, 100000)]
[double]
$ShowScaleBaseFrequency,

# Specify the transform end frequency.
# Default value is 20495.59681441799654, which is frequency 50 cents above D#10
# Acceptable range is [10, 100000].
[Alias('showcqt_endfreq')]
[ValidateRange(10, 100000)]
[double]
$ShowScaleEndFrequency,

<#
Specify the transform length in time domain.

Use this option to control accuracy trade-off between time domain and frequency domain at every frequency sample.


It can contain variables:


|Variable|Description|
|-|-|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|
#>
[Alias('showcqt_tlength')]
[string]
$ShowScaleTransformLength,

# Specify the transform count for every video frame. Default value is 6. Acceptable range is [1, 30].
[Alias('showcqt_count')]
[ValidateRange(1,30)]
[int]
$ShowScaleTransformCount,

# Specify the transform count for every single pixel. Default value is 0, which makes it computed automatically. Acceptable range is [0, 10].
[Alias('showcqt_fcount')]
[ValidateRange(1,10)]
[int]
$ShowScaleTransformPixelCount,

<#
Set colorspace.
#>
[Alias('showcqt_csp')]
[ValidateSet('unspecified','bt709','fcc','bt470bg','smpte170m','smpte240m','bt2020ncl')]
[int]
$ShowScaleColorspace,

# Specify fontconfig pattern. This has lower priority than fontfile.
# The : in the pattern may be replaced by | to avoid unnecessary escaping
[Alias('showcqt_font')]
[string[]]
$ShowScaleFont,

# Specify font file for use with freetype to draw the axis.
# If not specified, use embedded font.
# Note that drawing with font file or embedded font is not implemented with custom basefreq and endfreq, use axisfile option instead.
[Alias('showcqt_fontfile')]
[string]
$ShowScaleFontFile,

# Specify image file to draw the axis. This option override fontfile and fontcolor option.
[Alias('showcqt_axisfile')]
[string]
$ShowScaleAxisFile,

# Enable/disable drawing text to the axis.
# If it is set to 0, drawing to the axis is disabled, ignoring fontfile and axisfile option.
# Default value is 1.
[Alias('showcqt_axis')]
[switch]
$ShowScaleHideAxis,

<#
Specify font color expression.

This is arithmetic expression that should return integer value 0xRRGGBB.

It can contain variables:

It can contain variables:

|Variable|Description|
|-|-|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|

and functions:

|Function|Description|
|-|-|
|midi(f)|midi number of frequency f, some midi numbers: E0(16), C1(24), C2(36), A4(69)|
|r(x), g(x), b(x)|red, green, and blue value of intensity x.|

Default value is st(0, (midi(f)-59.5)/12); st(1, if(between(ld(0),0,1), 0.5-0.5*cos(2*PI*ld(0)), 0)); r(1-ld(1)) + b(ld(1)).
#>
[Alias('showcqt_fontcolor')]
[string]
$ShowScaleFontColorExpression
)

if ($PSBoundParameters['ShowScaleFont']) {
    $PSBoundParameters['ShowScaleFont'] = $PSBoundParameters['ShowScaleFont'] -join '|' -replace '\:','|'
}

if ($PSBoundParameters.ContainsKey('ShowScaleHideAxis')) {
    $PSBoundParameters['ShowScaleHideAxis'] = -not ($PSBoundParameters['ShowScaleHideAxis'] -as [bool])
}

foreach ($filePathParameter in 'ShowScaleFontFile', 'ShowScaleAxisFile') {
    if ($PSBoundParameters[$filePathParameter]) {
        $PSBoundParameters[$filePathParameter] = 
            "'$($PSBoundParameters[$filePathParameter].Replace('\', "'\\\\'").Replace("'","'\''").Replace(":", "'\\:'"))'"    
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
    "[0:a]showcqt=${filterargs},format=$pixelFormat[v]",
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
    "$inputAudioMovieFilter,asplit=2[out1][a];[a]showcqt=${filterargs},format=yuv420p[out0]"
}

