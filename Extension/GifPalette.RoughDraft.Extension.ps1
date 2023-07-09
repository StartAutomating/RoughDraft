<#
.SYNOPSIS
    Gif Palette Extension
.DESCRIPTION
    The Gif Palette Extension generates a palette for high quality gif creation.
    
    It will be automatically called when converting .gif files.
.EXAMPLE
    Convert-Media -InputPath .\a.mp4 -OutputPath .gif 
#>
[Management.Automation.Cmdlet("Convert","Media")]
param(
# If set, will use a difference-based palette.  These put more focus on the motion than the background.
[Switch]
$DifferenceBasedPalette
)

process {
    if ($outputPath -notlike '*.gif') { return }
    $PalettePath = Join-Path ([IO.Path]::GetTempPath()) "palette$(Get-Random).png"

    $ProgId = Get-Random

    if (-not $psBoundParameters.Start) {
        $start = [TimeSpan]::FromMilliseconds(0)
    }
    if (-not $PSBoundParameters.End) {
        $end = $mi.duration
    }

    $duration = $end - $start

    $FilterList = @()
    if ($FrameRate) {
        $FilterList+="fps=$FrameRate"
    }

    if ($NewWidth) {
        $FilterList+="scale=$($NewWidth):-1:flags=lanczos"
    }

    if ($FilterList) {
        $PaletteFilters = "`"$($FilterList -join ','),palettegen=stats_mode=$(if ($DifferenceBasedPalette) { 'diff'} else {'full'})`""
        $paletteParams = @("-vf", $paletteFilters)
        $PaletteUseFilters = "`"$($FilterList -join ',') [x]; [x][1:v] paletteuse`""
        $lavFiParams = @("-lavfi", $paletteUseFilters)
    } else {

        $PaletteFilters = 'palettegen'
        $PaletteUseFilters = 'paletteuse'
        $paletteParams = @("-vf", $paletteFilters)

        $lavFiParams = @("-lavfi", $paletteUseFilters)

    }

    #region Generate the palette
    Write-Progress "Generating Palette" " " -Id $ProgId 
    & $ffmpeg -ss "$start" -t "$($duration.TotalSeconds)" -i $ri @paletteParams "$palettePath"  -y 2>&1 |
        ForEach-Object {
            Write-Verbose $_
        }
    Write-Progress "Generating Palette" "Completed " -Id $ProgId -Completed
    #endregion Generate the palette

    '-i'
    "$palettePath"
    "-lavfi"
    $paletteUseFilters
}


