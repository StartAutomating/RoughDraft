<#
.SYNOPSIS
    Creates subtitles.
.DESCRIPTION
    Creates VTT and SRT subtitles.
.EXAMPLE
    New-Media -SubtitleContent "a", "b" -SubtitleStartTime "00:00:01","00:01:01" -SubtitleEndTime "00:01:00", "00:02:00" -OutputPath .\test.srt
#>
[Management.Automation.Cmdlet("New", "Media")]
[ComponentModel.Inheritance("NotInherited")]
param(
# An array of subtitles.
# Each element represents a single subtitle
[Parameter(Mandatory)]
[string[]]
$SubtitleContent,

# An array of subtitle start times.
# Each element represents the starting time of each subtitle.
[Parameter(Mandatory)]
[Timespan[]]
$SubtitleStartTime,

# An array of subtitle end times.
# Each element represents the end time of each subtitle.
[Parameter(Mandatory)]
[Timespan[]]
$SubtitleEndTime,

# The subtitle locale.  Only valid when the -OutputPath is a VTT
# If not provided, this will be automatically detected.
[string]
$SubtitleLocale
)

begin {
    $subtitleFileContent = [Text.StringBuilder]::new()
    $subtitleCount = 0
}

process {
    $validSubtitleExtensions = "srt", "vtt"
    if ($outputPath -and $OutputPath -notmatch "\.(?<ext>$($validSubtitleExtensions -join '|'))$") {
        Write-Error "-OutputPath '$OutputPath' must be one of the following extensions: $validSubtitleExtensions "
        return
    }

    $subtitleExtensionType = $Matches.ext
    if (-not $subtitleExtensionType) { $subtitleExtensionType -eq 'srt'}


    if ($subtitleExtensionType -eq 'vtt') {
        if (-not $SubtitleLocale) {
            $SubtitleLocale = Get-Culture | 
                Select-Object -ExpandProperty TwoLetterISOLanguageName
        }

        $null = $subtitleFileContent.AppendLine("WEBVTT")
        $null = $subtitleFileContent.AppendLine("Kind: captions")
        $null = $subtitleFileContent.AppendLine("Language: $subtitleLocale")
        $null = $subtitleFileContent.AppendLine()
    }

    for ($index = 0 ; $index -lt $SubtitleContent.Length; $index++) {
        $subtitleCount++
        $subtitleStart = $SubtitleStartTime[$index]
        if (-not $subtitleStart) { continue }
        $subtitleEnd = $SubtitleEndTime[$index]
        if (-not $subtitleEnd) { continue }
        $subStart = $subtitleStart.ToString()
        if (-not $subStart.Contains('.')) { 
            $subStart += '.000'
        }             
        if ($subStart.Length -lt 12) {
            $subStart = $subStart.PadRight(12 - $subStart.Length, '0')
        }
        $subEnd = $subtitleStart.ToString()
        if (-not $subEnd.Contains('.')) { 
            $subEnd += '.000'
        }             
        if ($subEnd.Length -lt 12) {
            $subEnd = $subStart.PadRight(12 - $subStart.Length, '0')
        }
        switch ($subtitleExtensionType) {
            vtt {
                $null = $subtitleFileContent.AppendLine("$subStart --> $subEnd")
                $null = $subtitleFileContent.AppendLine($SubtitleContent[$index])
                $subtitleFileContent.AppendLine()
            }
            srt {    
                $null = $subtitleFileContent.AppendLine($subtitleCount)
                $null = $subtitleFileContent.AppendLine("$($subStart.Replace('.', ',')) --> $($subEnd.Replace('.', ','))")
                $null = $subtitleFileContent.AppendLine($SubtitleContent[$index])
                $subtitleFileContent.AppendLine()
            }
        }        
    }
}

end {
    if ($outputPath) {
        "$subtitleFileContent" | Set-Content -Path $OutputPath
    } else {
        "$subtitleFileContent"
    }
}
