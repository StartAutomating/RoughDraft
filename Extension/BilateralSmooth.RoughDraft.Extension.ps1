<#
.SYNOPSIS
    Bilateral Smooth
.DESCRIPTION
    Applies a [bilateral](https://ffmpeg.org/ffmpeg-filters.html#bilateral) video filter, spatial smoothing while preserving edges.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#bilateral
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, apply Apply bilateral filter, spatial smoothing while preserving edges
[Parameter(Mandatory)]
[Alias('bilateral')]
[switch]
$BilateralSmooth,

# Set sigma of gaussian function to calculate spatial weight. Allowed range is 0 to 512. Default is 0.1.
[Alias('bilateral_sigmaS')]
[ValidateRange(0,512)]
[double]
$BilateralSmoothSpatialWeight,

# Set sigma of gaussian function to calculate range weight. Allowed range is 0 to 1. Default is 0.1.
[Alias('bilateral_sigmaR')]
[ValidateRange(-1, 1)]
[float]
$BilateralSmoothRangeWeight
)

$myCmd = $MyInvocation.MyCommand
$filterArgs = @(
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        $match=  @([Regex]::Match($myCmd.Parameters[$kv.Key].Aliases, '_(?<p>.+)$'))
        if ($match.Success) {
            $v = $kv.Value
            $p = $match.Value -replace '^_'
            if ($v -is [switch]) {
                $v = ($v -as [bool]).ToString().ToLower()
            }
            "$p=$($kv.Value)"
        }
    }
) -join ':'

'-vf'
"bilateral=$FilterArgs" -replace '=$'