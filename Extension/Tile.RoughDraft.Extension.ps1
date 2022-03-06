<#
.SYNOPSIS
    Tile Extension
.DESCRIPTION
    Uses the tile filter to tile video frames.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#tile
#>
[Management.Automation.Cmdlet("Edit","Media")]
param(
# Set the grid size (i.e. the number of lines and columns)
[ValidatePattern("^\d+x\d+$")]
[Parameter(Mandatory)]
[string]
$Tile,

# Set the maximum number of frames to render in the given area.
# It must be less than or equal to wxh.
# The default value is 0, meaning all the area will be used.
[int]
$TileFrameCount,

# Set the outer border margin in pixels.
[int]
$TileMargin,

# Set the tile padding in pixels.
[int]
$TilePadding,

# Specify the color of the unused area. The default value of color is "black".
[string]
$TileMarginColor,

# Set the number of frames to overlap when tiling several successive frames together. The value must be between 0 and nb_frames - 1.
[Alias('TileOverlapFrames')]
[int]
$TileOverlapFrame,

# Set the number of frames to initially be empty before displaying first output frame.
# This controls how soon will one get first output frame. The value must be between 0 and nb_frames - 1
[int]
$TileInitialPadding,

# If set, will not prescale a video before tiling it.  This will result in _very_ large frames.
[switch]
$TileNoPrescale
)

$filterArgs = @(
    if ($Tile) {
        "layout=$tile"
    }
    if ($TileFrameCount) {
        "nb_frames=$TileFrameCount"
    }
    if ($TileMarginColor) {
        "color=$tileMarginColor"
    }
    if ($TileMargin) {
        "margin=$tilemargin"
    }
    if ($TilePadding) {
        "padding=$tilePadding"
    }
    if ($TileOverlapFrame) {
        "overlap=$tileOverlapFrame"
    }
    if ($TileInitialPadding) {
        "init_padding=$TileInitialPadding"
    }
) -join ':'
"-vf"
"$(if (-not $TileNoPrescale) { 
    $width, $height = $Tile -split 'x'
    "scale=iw/${width}:ih/${Height},"
})tile=$filterArgs" -replace '=$'

