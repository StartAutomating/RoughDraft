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
# If set, will blend multiple videos
[Parameter(Mandatory)]
[switch]
$BlendVideo,

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

# One or more blend modes for a given color.
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

# The blend expressions for a given color
[string[]]
$BlendColorExpression,

# The blend opacity.
[string]
$BlendOpacity,

# The blend opacity for a given color.
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