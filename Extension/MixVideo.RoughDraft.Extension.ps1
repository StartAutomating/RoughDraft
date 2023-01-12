
<#
.Synopsis
    Mix Video
.Description
    Video mixing.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#mix
#>
[Management.Automation.Cmdlet('Join', 'Media')]
param(
    # Video mixing.
    [Parameter(Mandatory)]
    [switch]
    $MixVideo,
    # Number of inputs.  If unspecified, defaults to 2.
    [Alias('vmix_inputs')]
    [ValidateRange(1, 1024)]
    [int]
    $MixVideoInputs,
    # How to determine the end-of-stream. 
    [Alias('vmix_duration')]
    [ValidateSet('longest','shortest', 'first')]
    [string]
    $MixVideoDuration,
    # Set weight for each input. 
    [Alias('vmix_weights','MixVideoWeights')]
    [double[]]
    $MixVideoWeight,

    # Specify scale, if it is set it will be multiplied with sum of each weight multiplied with pixel values to give final destination pixel value.
    # By default scale is auto scaled to sum of weights.
    [Alias('vmix_scale')]
    [double]
    $MixVideoScale
    )



$filterName = 'mix'
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
 

