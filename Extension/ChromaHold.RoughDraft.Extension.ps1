<#
.Synopsis
    chromahold
.Description
    Turns a certain color range into gray.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#chromahold
#>
[Management.Automation.Cmdlet('Edit', 'Media')]
param(
    # Turns a certain color range into gray.
    [Parameter(Mandatory)]
    [switch]
    $Chromahold,
    # set the chromahold key color 
    [Alias('chromahold_color')]
    [string]
    $ChromaholdColor,
    # set the chromahold similarity value 
    [Alias('chromahold_similarity')]
    [float]
    $ChromaholdSimilarity,
    # set the chromahold blend value 
    [Alias('chromahold_blend')]
    [ValidateRange(0, 1)]
    [float]
    $ChromaholdBlend,
    # color parameter is in yuv instead of rgb 
    [Alias('chromahold_yuv')]
    [switch]
    $ChromaholdYuv
)



$filterName = 'chromahold'
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
 

