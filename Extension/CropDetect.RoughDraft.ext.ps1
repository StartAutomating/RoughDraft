<#
.Synopsis
    Auto-detect the crop size.
.Description
    Detects silence in an audio stream, using the cropdetect filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#cropdetect
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Get-Media            
[Management.Automation.Cmdlet("Get","Media")]
param(
# If set, will find cropping information within a video.
[Parameter(Mandatory)]
[switch]
$CropDetect,

# Set higher black value threshold, which can be optionally specified from nothing (0) to everything (255 for 8-bit based formats). 
# An intensity value greater to the set value is considered non-black. 
# It defaults to 24. 
# You can also specify a value between 0.0 and 1.0 which will be scaled depending on the bitdepth of the pixel format.
[string]
$CropDetectLimit,

# The value which the width/height should be divisible by. It defaults to 16. 
# The offset is automatically adjusted to center the video. Use 2 to get only even dimensions (needed for 4:2:2 video). 
# 16 is best when encoding to most video codecs.
[string]
$CropDetectRound,

# Set the number of initial frames for which evaluation is skipped. Default is 2. Range is 0 to INT_MAX.
[int]
$CropDetectSkip,

# Set the counter that determines after how many frames cropdetect will reset the previously detected largest video area and 
# start over to detect the current optimal crop area. Default value is 0.
[int]
$CropDetectReset
)
$filterArgs = 
    @(
    if ($CropDetectLimit) {
        "limit=$CropDetectLimit"
    }
    if ($CropDetectRound) {
        "round=$CropDetectRound"
    }
    if ($CropDetectSkip) {
        "slip=$CropDetectSkip"
    }
    ) -ne '' -join ":"

$filterParam = "cropdetect=$filterArgs" -replace '\=$'

$filterName = 'cropdetect'
$ffArgs = @(
    '-i', "`"$ri`"", "-vf", $filterParam, '-f', 'null', '-'
)

Use-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $ffArgs |
& {
param([Parameter(Mandatory,ValueFromPipeline)][string]$line)

process {
    if ($line -like "*_cropdetect_*@*") {
        $blackDetectLine = $line
        $lineParts = @($blackDetectLine -replace '\[.+?\]' -split "[ :]"  -ne '')
        $ht = [Ordered]@{
            InputPath = "$ri"
            FilterName = $filterName
        }
        
        $ht.Crop = $lineParts[-4..-1] -join ':'
        for ($pc = 0 ; $pc -lt $lineParts.Length - 5;  $pc+=2) {
            $ht[$lineParts[$pc]] = $lineParts[$pc + 1]
        }
        
        
        $frame = $lineParts[1] -as [int]
        $percentBlack = $lineParts[3] -as [int]
        $Start = [TimeSpan]::FromSeconds(($ht.t -as [double]))
        $End = [TimeSpan]::FromSeconds(($ht.t -as [double]))
        $ht.Remove('t')
        [PSCustomObject]$ht
        if ($theDuration -and $progId) {
            $perc = $Start.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
            Write-Progress "$ri - $filterName" " " -PercentComplete $perc -Id $ProgId
        }                    
                    
        $lastBlackDetectEnd = $BlackEnd        
        Write-Verbose "$_"
    }
}
}