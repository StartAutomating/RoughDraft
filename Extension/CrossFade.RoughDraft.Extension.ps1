
<#
.Synopsis
    acrossfade
.Description
    Cross fade two input audio streams.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#acrossfade
#>

[Management.Automation.Cmdlet('Join', 'Media')]
param(
    # Cross fade two input audio streams.
    [Parameter(Mandatory)]
    [Alias('ACrossFade')]
    [switch]
    $CrossFade,
    # Set number of samples for cross fade duratio.  Default is 44100.
    [Alias('acrossfade_nb_samples')]
    [int]
    $CrossfadeSampleCount,
    # set cross fade duration 
    [Alias('acrossfade_duration')]
    [timespan]
    $CrossfadeDuration,
    # overlap 1st stream end with 2nd stream start 
    [Alias('acrossfade_overlap')]
    [switch]
    $CrossfadeOverlap,
    <# 
    set fade curve type for 1st stream 

    |Setting|Description|
    |-|-|
    |tri|triangular, linear slope (default)|
    |qsin  |quarter of sine wave|
    |hsin  |half of sine wave|
    |esin  |exponential sine wave|
    |log   |logarithmic|
    |ipar  |inverted parabola|
    |qua   |quadratic|
    |cub   |cubic|
    |squ   |square root|
    |cbr   |cubic root|
    |par   |parabola|
    |exp   |exponential|
    |iqsin |inverted quarter of sine wave|
    |ihsin |inverted half of sine wave|
    |dese  |double-exponential seat|
    |desi  |double-exponential sigmoid|
    |losi  |logistic sigmoid|
    |sinc  |sine cardinal function|
    |isinc |inverted sine cardinal function|
    |nofade|no fade applied|
    #>
    [ValidateSet('tri','qsin','hsin','esin',
    'log','ipar','qua','cub','squ','cbr',
    'par','exp','iqsin','ihsin','dese','desi','losi','sinc','isinc','nofade')]
    [Alias('acrossfade_c1')]
    [string]
    $CrossfadeCurve1,
    <# 
    set fade curve type for 2nd stream 

    |Setting|Description|
    |-|-|
    |tri|triangular, linear slope (default)|
    |qsin  |quarter of sine wave|
    |hsin  |half of sine wave|
    |esin  |exponential sine wave|
    |log   |logarithmic|
    |ipar  |inverted parabola|
    |qua   |quadratic|
    |cub   |cubic|
    |squ   |square root|
    |cbr   |cubic root|
    |par   |parabola|
    |exp   |exponential|
    |iqsin |inverted quarter of sine wave|
    |ihsin |inverted half of sine wave|
    |dese  |double-exponential seat|
    |desi  |double-exponential sigmoid|
    |losi  |logistic sigmoid|
    |sinc  |sine cardinal function|
    |isinc |inverted sine cardinal function|
    |nofade|no fade applied|
    #>
    [ValidateSet('tri','qsin','hsin','esin',
    'log','ipar','qua','cub','squ','cbr',
    'par','exp','iqsin','ihsin','dese','desi','losi','sinc','isinc','nofade')]
    [Alias('acrossfade_c2')]
    [string]
    $CrossfadeCurve2
)


$filterName = 'acrossfade'
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
            if ($v -is [timespan]) {
                $v = $v.TotalSeconds
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
 

