<#
.Synopsis
    Generates a Sierpinski fractal 
.Description
    Generates a Sierpinski fractal, using the sierpinski filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#sierpinski
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends New-Media            
[Management.Automation.Cmdlet("New","Media")]
# that extends Show-Media            
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will generate a Sierpinksi fractal
[Parameter(Mandatory)]
[switch]
$Sierpinski,

# Set seed which is used for random panning
[int]
$SierpinksiSeed,

# Set max jump for single pan destination. Allowed range is from 1 to 10000.
[ValidateRange(1,10000)]
[double]
$SierpinksiJump,

# Set fractal type, can be default carpet or triangle
[ValidateSet('carpet', 'triangle')]
[string]
$SierpinksiType
)

'-f'
'lavfi'
'-i'
"sierpinski=$(@(    
    if ($Resolution) {
        "s=$Resolution"
    }
    if ($SierpinksiSeed) {
        "seed=$SierpinksiSeed"
    }
    if ($SierpinksiJump) {
        "jump=$SierpinksiJump"
    }
    if ($SierpinksiType) {
        "type=$($SierpinksiType.ToLower())"
    }
) -join ':')"


