<#
.SYNOPSIS
    Slowly update darker pixels.
.DESCRIPTION
    This filter makes short flashes of light appear longer.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#lagfun
#>
[Management.Automation.Cmdlet("Edit","Media")]
param(
# If set, will use the lagfun filter
[Parameter(Mandatory)]
[switch]
$LagFun,

# Set factor for decaying. Default is .95. Allowed range is from 0 to 1.
[float]
$LagFunDecay
)

$filterArgs = @(
    if ($LagFunDecay) {
        "decay=$LagFunDecay"
    }
) -join ':'

"-vf"
"lagfun=$filterArgs" -replace '=$'
