<#
.Synopsis
    Detects black frames.
.Description
    Detects black frames in an video stream, using the blackframe filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#blackframe
#>

[Runtime.CompilerServices.Extension()]         # It's an extension
[Management.Automation.Cmdlet("Get","Media")]  # that extends Get-Media
param(
# If set, will find black frames within a video.
[Parameter(Mandatory)]
[switch]
$BlackFrameDetect,

# The perctange of the screen blackness that constitutes a cut.  By default, 15%.
# Due to encoding and equipment, very few fades to black are actually truly black.
# They are often very dark grey instead.
[ValidateRange(0,1)]
[Double]
$BlackFrameThreshold = 0.32
)

$filterArgs = 
    @(    
    if ($BlackFrameThreshold) {
        "threshold=$([Math]::Round($BlackFrameThreshold * 100))"        
    }
    ) -ne '' -join ":"

$filterParam = "blackframe=$filterArgs" -replace '\=$'
$filterName = 'blackframe'

$ffArgs = @(
    '-i', "`"$ri`"", "-vf", $filterParam, '-f', 'null', '-'
)

Use-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $ffArgs | 
. {
    param([Parameter(Mandatory,ValueFromPipeline)][string]$line)

    process {
        if ($line -like "*_blackframe_*@*") {
            $blackDetectLine = $line
            $lineParts = $blackDetectLine -replace '\[.+?\]' -split "[ :]"  -ne ''
            $frame = $lineParts[1] -as [int]
            $percentBlack = $lineParts[3] -as [int]
            $Start = [TimeSpan]::FromSeconds(($lineParts[7] -as [double]))
            $End = [TimeSpan]::FromSeconds(($lineParts[7] -as [double]))
            [PSCustomObject][Ordered]@{
                InputPath = "$ri"
                FilterName = $filterName            
                Start = $Start
                End   = $End
                Frame = $frame
                PercentBlack = $percentBlack
            }
            if ($theDuration -and $progId) {
                $perc = $Start.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
                Write-Progress "$ri - $filterName" " " -PercentComplete $perc -Id $ProgId
            }                    
                    
            $lastBlackDetectEnd = $BlackEnd
            $null = $null
            Write-Verbose "$_"
        }
    }
}