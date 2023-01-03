<#
.SYNOPSIS
    Erode Video
.DESCRIPTION
    Apply erosion effect to the video.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#erosion
.EXAMPLE
    Edit-Media -InputPath .\a.mp4 -Erosion
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, apply Apply bilateral filter, spatial smoothing while preserving edges
[Parameter(Mandatory)]
[Alias('Erode')]
[switch]
$Erosion,

# Limit the maximum change for each plane, default is 65535. If 0, plane will remain unchanged.
[ValidateRange(0,65535)]
[Alias('ErodeThreshold')]
[int[]]
$ErosionThreshold,

# Set sigma of gaussian function to calculate range weight. Allowed range is 0 to 1. Default is 0.1.
[Alias('erosion_coordinates','ErosionCoordinates','ErodeCoordinates')]
[ValidateRange(0, 255)]
[string]
$ErosionCoordinate
)

if ($ErosionThreshold.Count -gt 4) {
    Write-Error "-ErosionThreshold may have up to 4 values"
    return
}

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

    if ($ErosionThreshold) {
        for ($i = 0; $i -lt $ErosionThreshold.Length; $i++) {
            "threshold$i=$($ErosionThreshold[$i])"
        }
    }
) -join ':'

'-vf'
"erosion=$FilterArgs" -replace '=$'