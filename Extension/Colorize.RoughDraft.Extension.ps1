<#
.SYNOPSIS
    Colorize a video stream
.DESCRIPTION
    Overlay a solid color on the video stream
.EXAMPLE
    Edit-Media -InputPath .\a.mp4 -Colorize -ColorizeHue 200 -ColorizeSaturation 100 -ColorizeValue 1 -ColorizeMix .1
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#colorize
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, will overlay a solid color on the video stream
[Parameter(Mandatory)]
[switch]
$Colorize,

# Set the colorize hue. Allowed range is from 0 to 360. Default value is 0.
[alias('colorize_hue')]
[int]
$ColorizeHue,

# Set the color saturation. Allowed range is from 0 to 1. Default value is 0.5.
[alias('colorize_saturation')]
[ValidateRange(0,1)]
[double]
$ColorizeSaturation,


[alias('colorize_lightness')]
[ValidateRange(0,1)]
[double]
$ColorizeLightness,

# Set the mix of source lightness. By default is set to 1.0. Allowed range is from 0.0 to 1.0.
[ValidateRange(0,1)]
[double]
$ColorizeMix
)

if ($PSBoundParameters['ColorizeHue']) {
    $PSBoundParameters['ColorizeHue'] = $PSBoundParameters['ColorizeHue'] % 360
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
) -join ':'

'-vf'
"colorize=$FilterArgs" -replace '=$'