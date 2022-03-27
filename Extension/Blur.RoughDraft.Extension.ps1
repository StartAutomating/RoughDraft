<#
.SYNOPSIS
    Blurs Video
.DESCRIPTION
    Blurs Video, using a variety of FFMpeg filters.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#avgblur
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#boxblur
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#dblur
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#gblur
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#smartblur-1
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#yaepblur
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
[switch]
$Blur,

[Parameter(ValueFromPipelineByPropertyName)]
[ValidateSet(
        'Average','avgblur',
        'Box', 'boxblur', 
        'Directional', 'dblur', 
        'EdgePreserving','yeapblur',
        'Gaussian', 'gblur',
        'Smart', 'smartblur'        
)]
[string]
$BlurType = "boxblur",

# The radius of the blur.
[Alias('BlurLumaRadius', 'BlurSigma', 'BlurSizeX')]
[string]
$BlurRadius,

# Set vertical radius size, if zero it will be same as sizeX. Default is 0.
# With avgblur, this will be the sizeX parameter
# With gblur, this will be the sigmaV parameter.
[Alias('BlurChromaRadius', 'BlurSigmaV', 'BlurSizeY')]
[string]
$BlurRadiusY,

# The angle of the blur.  Used in dblur.
[string]
$BlurAngle,

[Alias('BlurLumaPower')]
[string]
$BlurLumaStrength,

[Alias('BlurChromaPower')]
[string]
$BlurChromaStrength,

# Set the luma threshold used as a coefficient to determine whether a pixel should be blurred or not.
# The option value must be an integer in the range [-30,30].
# A value of 0 will filter all the image, a value included in [0,30] will filter flat areas and a value included in [-30,0] will filter edges.
# Default value is 0.
[ValidateRange(-30,30)]
[int]
$BlurLumaThreshold,

# Set the chroma threshold used as a coefficient to determine whether a pixel should be blurred or not.
# The option value must be an integer in the range [-30,30].
# A value of 0 will filter all the image, a value included in [0,30] will filter flat areas and a value included in [-30,0] will filter edges.
# Default value is 0.
[ValidateRange(-30,30)]
[int]
$BlurChromaThreshold,

# Set which planes to filter. By default all planes are filtered.
[string]
$BlurPlanes
)
$blurValues = $MyInvocation.MyCommand.Parameters.BlurType.Attributes.ValidValues

$filterName = for ($i = 0; $i -lt $blurValues.Count; $i++) {
    if ($BlurType -eq $blurValues[$i]) {
        if ($blurValues[$i] -match '^\p{Lu}'){
            do {
                $i++
            } while ($i -lt ($blurValues.Count - 1) -and 
            $blurValues[$i + 1] -notmatch '^\p{Lu}')

            $blurValues[$i]
        }
        
    }
}

$filterArgs = @(
    if ($PSBoundParameters.ContainsKey("BlurRadius")) {
        if ($filterName -eq 'avgblur') {
            "sizeX=$blurRadius"
        }
        if ($filterName -eq 'dblur') {
            "radius=$blurRadius"
        }
        if ($filterName -eq 'gblur') {
            "sigma=$BlurRadius"
        }
        if ($filterName -eq 'yeapblur') {
            "r=$blurRadius"
        }
        if ($filterName -in 'smartblur', 'boxblur') {
            "luma_radius=$blurRadius"
        }                
    }

    if ($PSBoundParameters.ContainsKey("BlurRadiusY")) {
        if ($filterName -eq 'avgblur') {
            "sizeY=$blurSizeY"
        }
        if ($filterName -eq 'gblur') {
            "sigmaV=$blurRadiusY"
        }
        if ($filterName -eq 'yeapblur') {
            "sigma=$BlurRadiusY"
        }
        if ($filterName -in 'smartblur', 'boxblur') {
            "chroma_radius=$blurRadius"
        }
    }

    if ($BlurLumaStrength) {
        if ($filterName -eq 'boxblur') {
            "luma_power=$BlurLumaStrength"
        }
        if ($filterName -eq 'smartblur') {
            "luma_strength=$BlurLumaStrength"
        }
    }

    if ($BlurLumaThreshold -and $filterName -eq 'smartblur') {
        "luma_threshold=$BlurLumaThreshold"
    }

    if ($BlurChromaThreshold -and $filterName -eq 'smartblur') {
        "chroma_threshold=$blurChromaThreshold"
    }

    if ($BlurChromaStrength) {
        if ($filterName -eq 'boxblur') {
            "chroma_power=$BlurChromaStrength"
        }
        if ($filterName -eq 'smartblur') {
            "chroma_strength=$BlurChromaStrength"
        }
    }

    if ($BlurAngle -and $filterName -eq 'dblur') {
        "angle=$BlurAngle"
    }    
            
    if ($BlurPlanes) {
        "planes=$BlurPlanes"
    }
) -join ':'

"-vf"
"$filterName=$filterArgs" -replace '=$'