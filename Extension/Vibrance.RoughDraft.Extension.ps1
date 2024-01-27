
<#
.Synopsis
    vibrance
.Description
    Boost or alter saturation.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#vibrance
#>

[Management.Automation.Cmdlet('Edit', 'Media')]
param(
# Boost or alter saturation.
[Parameter(Mandatory)]
[switch]
$Vibrance,
    # set the intensity value 
    [Alias('vibrance_intensity')]
    [float]
    $VibranceIntensity,
    # set the red balance value 
    [Alias('vibrance_rbal')]
    [float]
    $VibranceRedBalance,
    # set the green balance value 
    [Alias('vibrance_gbal')]
    [float]
    $VibranceGreenBalance,
    # set the blue balance value 
    [Alias('vibrance_bbal')]
    [float]
    $VibranceBlueBalance,
    # set the red luma coefficient 
    [Alias('vibrance_rlum')]
    [ValidateRange(0, 1)]
    [float]
    $VibranceRedLuma,
    # set the green luma coefficient 
    [Alias('vibrance_glum')]
    [ValidateRange(0, 1)]
    [float]
    $VibranceGreenLuma,
    # set the blue luma coefficient 
    [Alias('vibrance_blum')]
    [ValidateRange(0, 1)]
    [float]
    $VibranceBlueLuma,
    # use alternate colors 
    [Alias('vibrance_alternate')]
    [switch]
    $VibranceAlternate
)



$filterName = 'vibrance'
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
 

