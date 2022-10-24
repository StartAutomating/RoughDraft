
<#
.Synopsis
    Hysteresis
.Description
    Grow first stream into second stream by connecting components.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#hysteresis
#>

[Management.Automation.Cmdlet('Join', 'Media')]
param(
    # Grow first stream into second stream by connecting components.
    [Parameter(Mandatory)]
    [switch]
    $Hysteresis,
    # set planes 
    [ValidateRange(0, 15)]
    [int]
    [Alias('hysteresis_planes')]
    $HysteresisPlanes,
    # set threshold 
    [ValidateRange(0, 65535)]
    [int]
    [Alias('hysteresis_threshold')]
    $HysteresisThreshold
)



$filterName = 'hysteresis'
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
 

