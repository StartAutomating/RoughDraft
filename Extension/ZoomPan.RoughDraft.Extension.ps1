<#
.Synopsis
    Zoom and Pan
.Description
    Apply Zoom & Pan effect.

    Zoom and Pan is accomplished using a series of expressions.

    Each expression can use the following variables:

    Each expression can contain the following constants:

    |Variable   |Description |
    |-----------|------------|
    |in_w, iw   |Input width |
    |in_h, ih   |Input height|
    |out_w, ow  |Output width|
    |out_h, oh  |Output height|
    |in         |Input frame count|
    |on         |Output frame count|
    |in_time, it|The input timestamp expressed in seconds. It’s NAN if the input timestamp is unknown.|
    |out_time, time, ot|The output timestamp expressed in seconds.|
    |x          |Last calculated 'x' expression for current input frame|
    |y          |Last calculated 'y' expression for current input frame|
    |px         |'x' of last output frame of previous input frame or 0 when there was not yet such frame (first input frame).|
    |py         |'y' of last output frame of previous input frame or 0 when there was not yet such frame (first input frame).|
    |zoom       |Last calculated zoom from ’z’ expression for current input frame.|
    |pzoom      |Last calculated zoom of last output frame of previous input frame.|
    |duration   |Number of output frames for current input frame. Calculated from ’d’ expression for each input frame.|
    |pduration  |number of output frames created for previous input frame|
    |a          |Rational number: input width / input height|
    |sar        |sample aspect ratio|
    |dar        |display aspect ratio|    
.Link
    https://ffmpeg.org/ffmpeg-filters.html#zoompan
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]
param(
    # Apply Zoom & Pan effect.
    [Parameter(Mandatory)]
    [switch]
    $ZoomPan,
    # Set the zoom expression. Range is 1-10. Default is 1.
    [Alias('zoompan_zoom', 'ZoomPanZ')]
    [string]
    $ZoomPanZoom,
    # Set the x expression 
    [Alias('zoompan_x')]
    [string]
    $ZoomPanX,
    # set the y expression 
    [Alias('zoompan_y')]
    [string]
    $ZoomPanY,
    # set the duration expression 
    [Alias('zoompan_d')]
    [string]
    $ZoomPanD,
    # set the output image size 
    [Alias('zoompan_s')]
    [string]
    $ZoomPanS,
    # set the output framerate 
    [Alias('zoompan_fps')]
    [int]
    $ZoomPanFps
)



$filterName = 'zoompan'
$myCmd = $MyInvocation.MyCommand
$filterArgs = @(
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        $match=  
            foreach ($paramAlias in $myCmd.Parameters[$kv.Key].Aliases) {
                $m = [Regex]::Match($paramAlias, '_(?<p>.+)$')
                if ($m.Success) {
                    $m;break
                }
            }
        
        if ($match.Success) {
            $v = $kv.Value
            $p = $match.Value -replace '^_'
            if ($v -is [switch]) {
                $v = ($v -as [bool] -as [int]).ToString().ToLower()
            }
            if ($v -is [string] -and $myCmd.Parameters[$kv.Key].ValidateSet) {
                $v = $v.ToLower()
            }
            "$p='$($v)'"
        }
    }
) -join ':'
'-vf'


"$filterName=$filterArgs" -replace "=$"
 

