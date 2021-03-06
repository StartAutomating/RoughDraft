function ConvertTo-Gif
{
    <#
    .Synopsis
        Converts an input video into an animated GIF
    .Description
        Converts an input video into a high-quality animated GIF
    .Example
        dir "$env:UserProfile\Videos\Too Many Cooks.mp4" |
            ConvertTo-Gif -Start "00:00:04.65" -End "00:00:06" -OutputPath "$env:UserProfile\Videos\Too Many Cooks.gif"
    .Link
        Get-Media
    .Link
        Join-Media
    .Link
        Convert-Media
    .Notes
        This really wouldn't have been possible without the great programmers who make ffmpeg.
        It was also greatly helped by a very diligent blogger who took the time to write down a detailed explanation of how FFMpeg works with animated GIFs.
        You can find that explanation here - http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html.
    #>
    [OutputType([IO.FileInfo], [Management.Automation.Job])]
    param(
    # The input path
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName=$true,ValueFromPipeline=$true)]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # The output path
    [Parameter(Mandatory,Position=1,ValueFromPipelineByPropertyName=$true)]
    [string]
    $OutputPath,

    # The path to FFMpeg.exe.  Download it from http://ffmpeg.org/
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [string]
    $FFMpegPath,

    # The timespan to start splitting the video
    [Parameter(Position=2, ValueFromPipelineByPropertyName=$true)]
    [Timespan]
    $Start,

    # The time span to end splitting the video
    [Parameter(Position=3, ValueFromPipelineByPropertyName=$true)]
    [Timespan]
    $End,

    # If set, will run this in a background job
    [Switch]
    $AsJob,

    # The number of frames per second.  If not specified, this will match the existing framerate.
    [Uint32]
    $FrameRate,

    # The new width of the .gif
    [Uint32]
    $NewWidth,

    # If set, will use a difference-based palette.  These put more focus on the motion than the background.
    [Switch]
    $DifferenceBasedPalette

    )

    begin {
        $accumulatedArgs = [Collections.ArrayList]::new()


    }

    process {
        if ($AsJob) {
            . $StartRoughDraftJob
            return
        }

        $accumulatedArgs.AddRange(@(@{}+$PSBoundParameters))

    }

    end {
        $c, $t, $id =0, $accumulatedArgs.Count, [Random]::new().Next()
        $ffMpeg = Get-FFMpeg -ffMpegPath $ffmpegPath
        if (-not $ffMpeg) { return }
        foreach ($accumulated in $accumulatedArgs) {
            foreach ($kv in $accumulated.GetEnumerator()) {
                $ExecutionContext.SessionState.PSVariable.Set($kv.Key, $kv.Value)
            }

            $ri =
                if ([IO.File]::Exists($InputPath)) {
                    $InputPath
                } else {
                    $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath) |
                        Get-Item -LiteralPath {$_ } |
                        Select-Object -ExpandProperty Fullname
                }

            Write-Progress "Converting GIFs" "$ri " -PercentComplete ($c * 100 / $t) -Id $id
            $C++

            $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)

            $mi = Get-Media -InputPath $ri

            $ProgId = Get-Random

            if (-not $psBoundParameters.Start) {
                $start = [TimeSpan]::FromMilliseconds(0)
            }
            if (-not $PSBoundParameters.End) {
                $end = $mi.duration
            }

            $duration = $end - $start

            $PalettePath = Join-Path ([IO.Path]::GetTempPath()) "palette$(Get-Random).png"

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

                $PaletteFilters = '"palettegen"'
                $PaletteUseFilters = '"paletteuse"'
                $paletteParams = @("-vf", $paletteFilters)

                $lavFiParams = @("-lavfi", $paletteUseFilters)

            }


            #region Generate the palette
            Write-Progress "Generating Palette" " " -Id $ProgId -ParentId $id
            & $ffmpeg -ss "$start" -t "$($duration.TotalSeconds)" -i $ri @paletteParams "$palettePath"  -y 2>&1 |
                ForEach-Object {
                    Write-Verbose $_
                }
            #endregion Generate the palette

            #region Convert to GIF
            & $ffmpeg -ss "$start" -t "$($duration.TotalSeconds)" -i $ri -i "$palettePath" @lavFiParams $uro -y 2>&1 |
                ForEach-Object {
                    if ($_ -like "*time=*" -and $_ -like "*bitrate=*") {
                        $lineChunks = $_.Tostring() -split "[ =]" -ne '' | Where-Object { $_.Trim() }
                        $lineData = New-Object PSObject
                        for ($i =0; $i -lt $lineChunks.Count; $i+=2) {
                            $lineData |Add-Member NoteProperty $lineChunks[$i].TrimEnd("=") $lineChunks[$i + 1] -force
                        }

                        $time = $lineData.Time -as [Timespan]
                        $perc = $time.TotalMilliseconds * 100 / $duration.TotalMilliseconds

                        if ($perc -gt 100) {
                            $perc = 100
                        }

                        Write-Progress "Encoding" "$lineData".TrimStart("@{").TrimEnd("}") -PercentComplete $perc -id $progid -ParentId $id
                    } else {
                        Write-Verbose "$_"
                    }
                }

            Write-Progress "Encoding Completed" " " -id $progid -Completed -ParentId $id

            Get-Item -Path $uro -ErrorAction SilentlyContinue
            #endregion Convert to GIF
        }
        Write-Progress "Converting GIFs" "Completed" -Completed -Id $id


    }
}

