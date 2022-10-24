
<#
.Synopsis
    overlay
.Description
    Overlay a video source on top of the input.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#overlay
#>

[Management.Automation.Cmdlet('Join', 'Media')]

param(
# Overlay a video source on top of the input.
[Parameter(Mandatory)]
[switch]
$Overlay,
    # set the x expression 
    [string]
    [Alias('overlay_x')]
    $OverlayX,
    # set the y expression 
    [string]
    [Alias('overlay_y')]
    $OverlayY,
    # Action to take when encountering EOF from secondary input 
    [switch]
    [Alias('overlay_eof_action')]
    $OverlayEof_action,
    # specify when to evaluate expressions 
    [switch]
    [Alias('overlay_eval')]
    $OverlayEval,
    # force termination when the shortest input terminates 
    [switch]
    [Alias('overlay_shortest')]
    $OverlayShortest,
    # set output format 
    [switch]
    [Alias('overlay_format')]
    $OverlayFormat,
    # repeat overlay of the last overlay frame 
    [switch]
    [Alias('overlay_repeatlast')]
    $OverlayRepeatlast,
    # alpha format 
    [switch]
    [Alias('overlay_alpha')]
    $OverlayAlpha
)



$filterName = 'overlay'
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
            "$p=$($v)"
        }
    }
) -join ':'
'-filter_complex'


"$filterName=$filterArgs" -replace "=$"
 

