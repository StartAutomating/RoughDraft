
<#
.SYNOPSIS
    Colorscope extension
.DESCRIPTION
    Display CIE color diagram with pixels overlaid onto it.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#ciescope
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will display a video ColorScope
[Parameter(Mandatory)]
[Alias('ciescope')]
[switch]
$ColorScope,

# Set color system for the ColorScope
[ValidateSet("ntsc","470m","ebu","470bg","smpte","240m","apple","widergb","cie1931","rec709","hdtv","uhdtv", "rec2020", "dcip3")]
[string]
$ColorScopeColorSystem,

# Sets the gamut for the ColorScope
[ValidateSet("ntsc","470m","ebu","470bg","smpte","240m","apple","widergb","cie1931","rec709","hdtv","uhdtv", "rec2020", "dcip3")]
[string]
$ColorScopeColorGamut,

# Set CIE system for the ColorScope
[ValidateSet("xyy","ucs","luv")]
[string]
$ColorScopeCIESystem,

# Set ciescope size, by default set to 512.
[int]
$ColorScopeSize,

# Set intensity used to map input pixel values to CIE diagram.
[string]
$ColorScopeIntensity,

# Set contrast used to draw tongue colors that are out of active color system gamut.
[string]
$ColorScopeContrast,

# Correct gamma displayed on scope, by default enabled.
[switch]
$ColorScopeNoGamutCorrection,

# Show white point on CIE diagram, by default disabled.
[switch]
$ColorScopeShowWhitePoint,

# Set input gamma. Used only with XYZ input color space
[string]
$ColorScopeInputGamma



)

$filterArgs  = @(
    if ($ColorScopeColorSystem) {"system=$($ColorScopeColorSystem.ToLower())"}
    if ($ColorScopeCIESystem) {"cie=$($ColorScopeCIESystem.ToLower())"}
    if ($ColorScopeColorGamut) {"gamuts=$($ColorScopeColorGamut.ToLower())"}
    if ($ColorScopeCIESystem -eq 'xxy' -and $ColorScopeInputGamma) {
        "gamma=$colorScopeInputGamma"
    }
    if ($ColorScopeShowWhitePoint) {
        "showwhite=1"
    }
    if ($ColorScopeNoGamutCorrection) {
        "corrgamma=0"
    }
    if ($ColorScopeContrast) {
        "constrast=$colorScopeConstrast"
    }
    if ($ColorScopeSize) {
        "size=$colorScopeSize"
    }
    if ($ColorScopeIntensity) {
        "intensity=$colorScopeIntensity"
    }    
 ) -join ':'
"-vf"
"ciescope=$filterArgs" -replace '=$'

