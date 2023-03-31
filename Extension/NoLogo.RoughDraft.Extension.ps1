
<#
.Synopsis
    delogo
.Description
    Remove logo from input video.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#delogo
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Remove logo from input video.
    [Parameter(Mandatory)]
    [Alias('NoLogo')]
    [switch]
    $Delogo,
    # set logo x position 
    [Alias('delogo_x','DeLogoX','NoLogoLeft')]
    [int]
    $NoLogoX,
    # set logo y position 
    [Alias('delogo_y','DeLogoY','NoLogoTop')]
    [int]
    $NoLogoY,
    # set logo width 
    [Alias('delogo_w','DeLogoWidth')]
    [int]
    $NoLogoWidth,
    # set logo height 
    [Alias('delogo_h', 'DeLogoHeight')]
    [int]
    $NoLogoHeight,
    # show delogo area 
    [Alias('delogo_show','DeLogoShow')]
    [switch]
    $NoLogoShow
)



$filterName = 'delogo'
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
 
