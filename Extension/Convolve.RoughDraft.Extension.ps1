
<#
.Synopsis
    convolve
.Description
    Convolve first video stream with second video stream.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#convolve
#>

[Management.Automation.Cmdlet('Join', 'Media')]

param(
    # Convolve first video stream with second video stream.
    [Parameter(Mandatory)]
    [switch]
    $Convolve,
    # set planes to convolve 
    [ValidateRange(0, 15)]
    [int]
    [Alias('convolve_planes')]
    $ConvolvePlanes,
    # when to process impulses 
    [switch]
    [Alias('convolve_impulse')]
    $ConvolveImpulse,
    # set noise 
    [ValidateRange(0, 1)]
    [float]
    [Alias('convolve_noise')]
    $ConvolveNoise
)



$filterName = 'convolve'
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
 
