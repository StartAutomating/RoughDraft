<#
.SYNOPSIS
    ColorHold Extension
.DESCRIPTION
    Remove all color information for all RGB colors except for certain one.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#colorhold
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# The color which will not be replaced with neutral gray.
[Parameter(Mandatory)]
[string]
$ColorHold,

# Similarity percentage with the above color. 0.01 matches only the exact key color, while 1.0 matches everything.
[ValidateRange(0,1)]
[float]
$ColorHoldSimilarity,
# Blend percentage. 0.0 makes pixels fully gray. Higher values result in more preserved color.
[ValidateRange(0,1)]
[float]
$ColorHoldBlend
)

$filterArgs  = @(
    if ($ColorHold) {"color=$colorHold"}
    if ($ColorHoldSimilarity) {"similarity=$ColorHoldSimilarity"}
    if ($ColorHoldBlend) {"blend=$ColorHoldBlend"}
 ) -join ':'
"-vf"
"colorhold=$filterArgs" -replace '=$'
