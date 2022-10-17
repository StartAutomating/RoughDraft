<#
.SYNOPSIS
    Shows a Vector Scope of the Audio
.DESCRIPTION
    Shows a Vector Scope of the Audio, using the [avectorscope filter](https://ffmpeg.org/ffmpeg-filters.html#avectorscope)
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#avectorscope
.EXAMPLE
    Show-Media -InputPath .\a.mp3 -ShowVectorScope
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -ShowVectorScope -OutputPath .\a.mp4
#>
[Management.Automation.Cmdlet("(?>New|Edit|Show)", "Media")]
param(
# If set, will show volume
[Parameter(Mandatory)]
[switch]
$ShowVectorScope,

# Specify the video size for the output.  Default value is 400x400
[Alias('avectorscope_size')]
[string]
$ShowVectorScopeSize,

# Set the vectorscope mode.
[validateset("lissajous",'lissajous_xy','polar')]
[alias('avectorscope_mode')]
[string]
$ShowVectorScopeMode,

# Set the zoom factor.
# Default value is 1.
# Allowed range is [0, 10].
# Values lower than 1 will auto adjust zoom factor to maximal possible value.
[alias('avectorscope_zoom')]
[ValidateRange(0,10)]
[double]
$ShowVectorScopeZoom,

# Set the vectorscope drawing mode.
[validateset("dot",'line')]
[alias('avectorscope_draw')]
[string]
$ShowVectorScopeDrawMode,


# Specify amplitude scale of audio samples
[Alias('avectorscope_scale')]
[ValidateSet('lin','log','sqrt','cbrt')]
[string]
$ShowVectorScopeScale,

# Swap left channel axis with right channel axis.
[Alias('avectorscope_swap')]
[switch]
$ShowVectorScopeSwap,

# Mirror axis.
[Alias('avectorscope_mirror')]
[ValidateSet('none','x','y','xy')]
[string]
$ShowVectorScopeMirror,


# Specify the red contrast. Default values is 40.
[Alias('avectorscope_rc')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeRedContrast,

# Specify the green contrast. Default value is 160.
[Alias('avectorscope_gc')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeGreenContrast,

# Specify the blue contrast. Default value is 80.
[Alias('avectorscope_bc')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeBlueContrast,

# Specify the alpha contrast. Default values is 255.
[Alias('avectorscope_ac')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeAlphaContrast,


# Specify the red, green, blue and alpha fade. Default values is 15.
[Alias('avectorscope_rf')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeRedFade,

# Specify the green fade. Default values is 10.
[Alias('avectorscope_gf')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeGreenFade,

# Specify the blue fade. Default values is 5.
[Alias('avectorscope_bf')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeBlueFade,

# Specify the alpha fade. Default values is 5.
[Alias('avectorscope_af')]
[ValidateRange(0,255)]
[int]
$ShowVectorScopeAlphaFade
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
    "[0:a]avectorscope=${filterargs},format=$pixelFormat[v]",
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
    "$inputAudioMovieFilter,asplit=2[out1][a];[a]avectorscope=${filterargs},format=yuv420p[out0]"
}

