
<#
.Synopsis
    Adjust audio tempo.
.Description    
    Adjust audio tempo using the atempo filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#atempo
#>
[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]
param(
# Adjust audio tempo.
[Parameter(Mandatory)]
[Alias('atempo_tempo')]
[double]
$AudioTempo
)

$filterName = 'atempo'
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
'-af'


"$filterName=$filterArgs" -replace "=$"
 

