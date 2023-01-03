
<#
.Synopsis
     Apply expressions to audio frequencies
.Description
    Apply arbitrary expressions to samples in frequency domain.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#afftfilt
.EXAMPLE
    Edit-Media .\a.mp3 -FrequencyExpression -FrequencyExpressionReal "hypot(re,im)*sin(0)" -FrequencyExpressionImaginary "hypot(re,im)*cos(0)" -FrequencyExpressionWindowSize 512 -FrequencyExpressionOverlap 0.75
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Apply arbitrary expressions to samples in frequency domain.
    [Parameter(Mandatory)]
    [switch]
    $FrequencyExpression,

    <#
    Set channels real expressions.

    Each expression in real and imag can contain the following constants and functions:
    
    |Value|Description|
    |-|-|
    |sr|sample rate|
    |b|current frequency bin number|
    |nb|number of available bins|
    |ch|channel number of the current expression|
    |chs|number of channels|
    |pts|current frame pts|
    |re|current real part of frequency bin of current channel|
    |im|current imaginary part of frequency bin of current channel|
    |real(b, ch)|Return the value of real part of frequency bin at location (bin,channel)|
    |imag(b, ch)|Return the value of imaginary part of frequency bin at location (bin,channel)|
    #>
    [Alias('afftfilt_real')]
    [string[]]
    $FrequencyExpressionReal,
    
    <#
    Set channels imaginary expressions.

    Each expression in real and imag can contain the following constants and functions:
    
    |Value|Description|
    |-|-|
    |sr|sample rate|
    |b|current frequency bin number|
    |nb|number of available bins|
    |ch|channel number of the current expression|
    |chs|number of channels|
    |pts|current frame pts|
    |re|current real part of frequency bin of current channel|
    |im|current imaginary part of frequency bin of current channel|
    |real(b, ch)|Return the value of real part of frequency bin at location (bin,channel)|
    |imag(b, ch)|Return the value of imaginary part of frequency bin at location (bin,channel)|
    #>
    [Alias('afftfilt_imag')]
    [string[]]
    $FrequencyExpressionImaginary,
    # set window size 
    [Alias('afftfilt_win_size')]
    [ValidateRange(16, 131072)]
    [int]
    $FrequencyExpressionWindowSize,
    # set window function 
    [Alias('afftfilt_win_func')]
    [ValidateSet(
        'rect','bartlett','hann', 'hanning','hamming','blackman','welch','flattop',
        'bharris','bnuttall','bhann','sine','nuttall','lanczos','gauss''tukey',
        'dolph','cauchy','parzen','poisson','bohman','kaiser'
    )]
    $FrequencyExpressionWindowFunction,
    # set window overlap 
    [Alias('afftfilt_overlap')]
    [ValidateRange(0, 1)]
    [float]
    $FrequencyExpressionOverlap
)



$filterName = 'afftfilt'
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
            if ($v -is [string[]]) {
                $v = $v -join '|'
                $v = "'$v'"
            }
            "$p=$($v)"
        }
    }
) -join ':'
'-af'


"$filterName=$filterArgs" -replace "=$"
 

