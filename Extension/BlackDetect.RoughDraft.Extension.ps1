<#
.Synopsis
    Detect black periods in a video.
.Description
    Detects black periods within a video, using the blackdetect filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#blackdetect
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Get-Media            
[Management.Automation.Cmdlet("Get","Media")]
# that is not inherited.
[ComponentModel.Inheritance("NotInherited")]
param(
# If set, will find black within a video.
[Parameter(Mandatory)]
[switch]
$BlackDetect,

# The duration of darkness this is considered black.  By default, a half second.
[Timespan]
$BlackDetectDuration = '00:00:00.50',

# The perctange of the screen blackness that constitutes a cut.  By default, 15%.
# Due to encoding and equipment, very few fades to black are actually truly black.
# They are often very dark grey instead.
[ValidateRange(0,1)]
[Double]
$BlackDetectThreshold = 0.32
)

$filterArgs = 
    @(
    if ($BlackDetectDuration) {
        "d=$($BlackDetectDuration.TotalSeconds)"
    }
    if ($BlackDetectThreshold) {
        "pix_th=$BlackDetectThreshold"
    }    
    ) -ne '' -join ":"

$filterParam = "blackdetect=$filterArgs" -replace '\=$'
$filterName = 'blackdetect'

$ffArgs = @(
    '-i', "`"$ri`"", "-vf", $filterParam, '-f', 'null', '-'
)

Invoke-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $ffArgs | 
. {
    param([Parameter(Mandatory,ValueFromPipeline)][string]$line)

    process {
        if ($line -like "*black_start*") {
            $blackDetectLine = $line
            $lineParts = $blackDetectLine -replace '\[.+?\]' -split "[ :]"  -ne ''
            $blackStart = [TimeSpan]::FromSeconds(($lineParts[1] -as [double]))
            $BlackEnd = [TimeSpan]::FromSeconds(($lineParts[3] -as [double]))
            [PSCustomObject][Ordered]@{
                InputPath = "$ri"
                FilterName = $filterName
                Start = $blackStart
                End   = $BlackEnd            
            }
            if ($theDuration -and $progId) {
                $perc = $blackStart.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
                Write-Progress "$ri - $filterName" " " -PercentComplete $perc -Id $ProgId
            }                    
                    
            $lastBlackDetectEnd = $BlackEnd
            $null = $null
            Write-Verbose "$_"
        }
    }
}