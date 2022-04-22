<#
.Synopsis
    Shuffles pixels in video
.Description
    Shuffles pixels in a video stream.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#shufflepixels
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will shuffle pixels
[Parameter(Mandatory)]
[Alias('ShufflePixels')]
[switch]
$ShufflePixel,

# Set shuffle direction. Can be forward or inverse direction. Default direction is forward.
[ValidateSet('Forward', 'Inverse')]
[string]
$PixelShuffleDirection,

# Set shuffle mode. Can be horizontal, vertical or block mode.
[ValidateSet('Horizontal', 'Vertical')]
[string]
$PixelShuffleMode,

# Set shuffle block_size. 
# In case of horizontal shuffle mode only width part of size is used.
[string]
$PixelShuffleBlockWidth,

# Set shuffle block_size. 
# In case of vertical shuffle mode only height part of size is used.
[string]
$PixelShuffleBlockHeight,

# Set random seed used with shuffling pixels. 
# Mainly useful to set to be able to reverse filtering process to get original input. 
# For example, to reverse forward shuffle you need to use same parameters and exact same seed and to set direction to inverse.
[int]
$PixelShuffleSeed
)

$filterArgs = @(
    if ($PixelShuffleDirection) {
        "direction=$($PixelShuffleDirection.ToLower())"
    }
    if ($PixelShuffleMode) {
        "mode=$($PixelShuffleMode.ToLower())"
    }
    if ($PixelShuffleBlockWidth) {
        "width=$PixelShuffleBlockWidth"
    }
    if ($PixelShuffleBlockHeight) {
        "height=$PixelShuffleBlockHeight"
    }
    if ($PixelShuffleSeed) {
        "seed=$PixelShuffleSeed"
    }

) -join ':'
"-vf"
"shufflepixels=$filterArgs"


