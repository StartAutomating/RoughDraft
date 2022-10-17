<#
.SYNOPSIS
    Audio 18 band Superequalizer
.DESCRIPTION
    Modify audio with an 18 band superequalizer, courtesy of the superequalizer filter.
.EXAMPLE
    # Make everything much more quiet
    Show-Media -InputPath .\test.mp3 -SuperEqualizer @{(1..18)=-50} 
.EXAMPLE
    # Make everything much more quiet
    Show-Media -InputPath .\test.mp3 -SuperEqualizer @{
        (7..18) = 3 
    } # Turn up the volume
.EXAMPLE
    Show-Media -InputPath .\test.mp3 -SuperEqualizer @{
        1=1
        2=2
        3=3
        4=4
        5=5
        6=6        
    } # Turn up the bass
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#superequalizer
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, apply 18 band equalizer.
# The key can either by a number of a digit range.
# The value will be interpreted as the change in decibals for that band.
[Parameter(Mandatory)]
[Collections.IDictionary]
$SuperEqualizer
)

if ($SuperEqualizer.Count -gt 18) {
    Write-Error "-SuperEqualizerBand may have up to 18 values"
    return
}

$myCmd = $MyInvocation.MyCommand
$filterArgs = @(
    if ($SuperEqualizer) {
        foreach ($bandNumber in 1..18) {    
            if ($SuperEqualizer.$bandNumber -or $SuperEqualizer."$bandNumber") {
                $bandValue = @($SuperEqualizer.$bandNumber, $SuperEqualizer."$bandNumber" -ne $null)[0]
                $bandValue = $bandValue -replace '(?>db){0,1}$', 'dB'
                "${bandNumber}b=$bandValue"
            }
            else {
                foreach ($k in $SuperEqualizer.Keys) {
                    if ($k -contains $bandNumber) {
                        $bandValue = $SuperEqualizer.($k)
                        $bandValue = $bandValue -replace '(?>db){0,1}$', 'dB'
                        "${bandNumber}b=$bandValue"
                        break
                    }
                }
            }        
        }        
    }
) -join ':'

'-af'
"superequalizer=$FilterArgs" -replace '=$'