<#
.SYNOPSIS
    Cut subwoofer frequencies
.DESCRIPTION
    Cut subwoofer frequencies.

    This filter allows to set custom, steeper roll off than highpass filter, and thus is able to more attenuate frequency content in stop-band.
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -SubFrequencyCut -SubFrequencyCut
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#asubcut
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, will Cut subwoofer frequencies.
[Parameter(Mandatory)]
[Alias('asubcut')]
[switch]
$SubFrequencyCut,

# Set cutoff frequency in Hertz. Allowed range is 2 to 200. Default value is 20.
[Alias('asubcut_cutoff', 'SubFrequencyCutoff')]
[ValidateRange(2, 200)]
[int]
$SubFrequencyCutFrequency,

# Set filter order. Available values are from 3 to 20. Default value is 10.
[Alias('asubcut_order')]
[ValidateRange(3, 20)]
[int]
$SubFrequencyCutOrder,

# Set input gain level. Allowed range is from 0 to 1. Default value is 1.
[Alias('asubcut_level')]
[ValidateRange(0,1)]
[double]
$SubFrequencyCutLevel
)

$myCmd = $MyInvocation.MyCommand
$filterArgs = @(
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        $match=  @([Regex]::Match($myCmd.Parameters[$kv.Key].Aliases, '_(?<p>.+)$'))
        if ($match.Success) {
            $v = $kv.Value
            $p = $match.Value -replace '^_'
            if ($v -is [switch]) {
                $v = ($v -as [bool]).ToString().ToLower()
            }
            "$p=$($kv.Value)"
        }
    }
) -join ':'

'-af'
"asubcut=$FilterArgs" -replace '=$'