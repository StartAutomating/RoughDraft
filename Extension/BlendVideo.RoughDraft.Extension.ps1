<#
.SYNOPSIS
    BlendVideo Extension
.DESCRIPTION
    Blends Multiple Videos
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#blend
#>
[Management.Automation.Cmdlet("Join","Media")]
param(
[Parameter(Mandatory)]
[switch]
$BlendVideo,

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

[string]
$BlendExpression,

[string[]]
$BlendColorExpression,

[string]
$BlendOpacity,

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

"-filter_complex"
"blend=$filterArgs" -replace '=$'