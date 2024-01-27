<#
.Synopsis
    swaprect
.Description
    Swap 2 rectangular objects in video.
.NOTES
    All options support expressions containing the following variables:

    |Variable|Description|
    |-|-|
    |w|The input width|
    |h|The input height|
    |a|The input width/ The Input Height|
    |sar|input sample aspect ratio|
    |dar|input display aspect ratio, it is the same as (w / h) * sar|
    |n|The number of the input frame, starting from 0.
    |t|The timestamp expressed in seconds. It’s NAN if the input timestamp is unknown.
    |pos|the position in the file of the input frame, NAN if unknown; deprecated, do not use|

.Link
    https://ffmpeg.org/ffmpeg-filters.html#swaprect
#>

[Management.Automation.Cmdlet('Edit', 'Media')]

param(
# Swap 2 rectangular objects in video.
[Parameter(Mandatory)]
[switch]
$Swaprect,
    # set rect width 
    [Alias('swaprect_w')]
    [string]
    $SwapRectWidth,
    # set rect height 
    [Alias('swaprect_h')]
    [string]
    $SwapRectHeight,
    # set 1st rect x top left coordinate 
    [Alias('swaprect_x1')]
    [string]
    $SwapRectX1,
    # set 1st rect y top left coordinate 
    [Alias('swaprect_y1')]
    [string]
    $SwapRectY1,
    # set 2nd rect x top left coordinate 
    [Alias('swaprect_x2')]
    [string]
    $SwapRectX2,
    # set 2nd rect y top left coordinate 
    [Alias('swaprect_y2')]
    [string]
    $SwapRectY2
)



$filterName = 'swaprect'
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
'-vf'


"$filterName=$filterArgs" -replace "=$"
 

