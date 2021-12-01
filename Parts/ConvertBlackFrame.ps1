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