<#
.Synopsis
    Splits Media Equally
.Description
    Splits a file into a number of equal parts.
#>
[Runtime.CompilerServices.Extension()]           # It's an extension
[Management.Automation.Cmdlet("Split","Media")]  # that extends Split-Media            
[ComponentModel.Inheritance("NotInherited")]        # that is not inherited
param(
[Parameter(Mandatory)]
[int]
$EqualSegmentCount
)

$MediaInfo = Get-Media -InputPath $InputPath
if (-not $MediaInfo.Duration) {
    Write-Error "'$inputPath' type does not have duration"
    return
}

$outputPath = @(if ($in.OutputPath) {
    $in.OutputPath
} else {
    $InputPath
})

$secondsPerSegment = $MediaInfo.Duration.TotalSeconds / $EqualSegmentCount

$startTime = [timespan]::FromMilliseconds(0)
$totalLength = $EqualSegmentCount.ToString().Length
for ($sampleNumber = 1; $sampleNumber -le $EqualSegmentCount; $sampleNumber++) {
    $endTime = $startTime + [timespan]::FromSeconds($secondsPerSegment)
    $null = $outputPath[0] -match '\.[^.]+$'
    $outputExtension = $Matches.0
    $sampleName = ($outputPath[0] -replace '\.[^.]+$') + 
        (".{0:d$($totalLength)}" -f $sampleNumber) + 
        ".$([Math]::Round($startTime.TotalSeconds,2))-$([Math]::Round($endTime.TotalSeconds,2))" +
        "$outputExtension"
    
    Split-Media -InputPath $InputPath -OutputPath $sampleName -Start $startTime -end $endTime
    $startTime = $endTime
}

continue nextFile







