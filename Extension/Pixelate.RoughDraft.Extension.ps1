<#
.Synopsis
    Pixelate effect
.Description
    Applies a pixelation effect, by using a chain of two scale filters
.Link
    https://ffmpeg.org/ffmpeg-filters.html#scale
#>
[Runtime.CompilerServices.Extension()]          # It's an extension
[Management.Automation.Cmdlet("Edit","Media")]  # that extends Edit-Media
param(
# If set, will pixelate a video
[Parameter(Mandatory)]
[switch]
$Pixelate,

# The pixelation width.  This is the number of effective pixels wide.  By default, 64
[int]
$PixelationWidth = 64,

# The pixelation width.  This is the number of effective pixels tall.  If not provided, this will be the pixelationwidth
[int]
$PixelationHeight
)

if (-not $PixelationHeight) { $PixelationHeight = $PixelationWidth }

"-vf"
"`"scale='$($PixelationWidth):$PixelationHeight',scale='$($mediaInfo.Resolution -replace 'x', ':'):flags=neighbor'`""