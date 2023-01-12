<#
.SYNOPSIS
    BlendFrame Extension
.DESCRIPTION
    Blends Frames.
    
    If used with one file (Edit/Show-Media), blends successive frames.
    If used with two files, blends frames from two video streams.    
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#blend
#>
[Management.Automation.Cmdlet("^(?>Edit|Show|Join)","Media")]
param(
# If set, will blend frames
[Parameter(Mandatory)]
[switch]
$BlendFrame,

# The blend mode.
[ValidateSet(
'addition',
'and',
'average',
'bleach',
'burn',
'darken',
'difference',
'divide',
'dodge',
'exclusion',
'extremity',
'freeze',
'geometric',
'glow',
'grainextract',
'grainmerge',
'hardlight',
'hardmix',
'hardoverlay',
'harmonic',
'heat',
'interpolate',
'lighten',
'linearlight',
'multiply',
'multiply128',
'negation',
'normal',
'or',
'overlay',
'phoenix',
'pinlight',
'reflect',
'screen',
'softdifference',
'softlight',
'stain',
'subtract',
'vividlight',
'xor'
)]
[string]
$BlendMode,

# The blend mode for a given color
[ValidateSet(
'',
'addition',
'and',
'average',
'bleach',
'burn',
'darken',
'difference',
'divide',
'dodge',
'exclusion',
'extremity',
'freeze',
'geometric',
'glow',
'grainextract',
'grainmerge',
'hardlight',
'hardmix',
'hardoverlay',
'harmonic',
'heat',
'interpolate',
'lighten',
'linearlight',
'multiply',
'multiply128',
'negation',
'normal',
'or',
'overlay',
'phoenix',
'pinlight',
'reflect',
'screen',
'softdifference',
'softlight',
'stain',
'subtract',
'vividlight',
'xor'
)]
[string[]]
$BlendColorMode,

# The blend expression
[string]
$BlendExpression,

# One or more blend color expressions
[string[]]
$BlendColorExpression,

# The blend opacity
[string]
$BlendOpacity,

# One or more blend color opacities.
[string[]]
$BlendColorOpacity
)

$filterArgs = @(
    if ($BlendColorMode) {
        for ($c = 0; $c -lt $BlendColorMode.Length; $c++) {
            "c${c}_mode=$($BlendColorMode[$c])"
        }
    } elseif ($BlendMode) {
        "all_mode=$blendMode"   
    }

    if ($BlendColorOpacity) 
    {
        for ($c = 0; $c -lt $BlendColorOpacity.Length; $c++) {
            "c${c}_opacity=$($BlendColorOpacity[$c])"
        }
    } elseif ($BlendOpacity) 
    {
        "all_opacity=$BlendOpacity"
    }

    if ($BlendColorExpression) {
        for ($c = 0; $c -lt $BlendColorExpression.Length; $c++) {
            "c${c}_expr=$($BlendColorExpression[$c])"
        }
    } elseif ($BlendExpression) {
        for ($c = 0; $c -lt $BlendColorOpacity.Length; $c++) {
            "all_expr=$BlendExpression"
        }
    }
) -join ':'

if ($commandName -eq 'Join-Media') {    
    "-filter_complex"
    "blend=$filterArgs" 
} else {
    "-vf"
    "tblend=$filterArgs" -replace '=$'
}
