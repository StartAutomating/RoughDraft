<#
.SYNOPSIS
    Cut super frequencies.
.DESCRIPTION
    Cut super frequencies (frequencies at an extremely high range).
.EXAMPLE
    Edit-Media -InputPath .\a.mp3 -SuperFrequencyCut
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#asupercut
#>
[Management.Automation.Cmdlet("(?>Edit|Show)", "Media")]
param(
# If set, will apply a Super frequency cut to the audio.
[Parameter(Mandatory)]
[Alias('asupercut')]
[switch]
$SuperFrequencyCut,

# Set cutoff frequency in Hertz. Allowed range is 20000 to 192000. Default value is 20000.
[Alias('asupercut_cutoff','SuperFrequencyCutoff')]
[ValidateRange(20000 , 192000)]
[int]
$SuperFrequencyCutFrequency,

# Set filter order. Available values are from 3 to 20. Default value is 10.
[Alias('asupercut_order')]
[ValidateRange(3, 20)]
[int]
$SuperFrequencyCutOrder,

# Set input gain level. Allowed range is from 0 to 1. Default value is 1.
[Alias('asupercut_level')]
[ValidateRange(0,1)]
[double]
$SuperFrequencyCutLevel
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
"asupercut=$FilterArgs" -replace '=$'