function ConvertTo-WaveForm
{
    <#
    .Synopsis
        Converts audio into a waveform
    .Description
        Converts audio into a waveform visualization.
    .Example
        ConvertTo-WaveForm -InputPath $home\Music\ASong.mp3 -OutputPath $home\Videos\ASong.mp4
    .Example
        ConvertTo-WaveForm -InputPath $home\Music\ASong.mp3 -OutputPath $home\Videos\ASongScales.mp4 -Visualizer TonalScale
    .Example
        ConvertTo-WaveForm -InputPath $home\Music\ASong.mp3 -OutputPath $home\Videos\ASongScales.mp4 -Visualizer Volume
    .Link
        Get-Media
    .Link
        Convert-Media
    #>
    [OutputType([IO.FileInfo], [Management.Automation.Job])]
    param(
    # The input path
    [Parameter(Mandatory=$true,Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # The output path
    [Parameter(Mandatory=$true,Position=1,ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath,

    # The path to FFMpeg.exe.  Download it from http://ffmpeg.org/
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FFMpegPath,

    # The width of the generated file:  by default, 640
    [Uint32]
    $Width = 640,

    # The height of the generated file:  by default, 120
    [Uint32]
    $Height = 120,

    # The timespan to start splitting the video
    [Parameter(Position=4, ValueFromPipelineByPropertyName)]
    [Timespan]
    $Start,

    # The time span to end splitting the video
    [Parameter(Position=5, ValueFromPipelineByPropertyName)]
    [Timespan]
    $End,

    # The name of the visualizer
    [ValidateSet('LineWaveform', 'Spectrum', 'TonalScale', 'PhaseMeter', 'VectorScope', 'Volume')]
    [string]
    $Visualizer = 'LineWaveform',

    # Any options for the visualizer
    [Collections.IDictionary]
    [Alias('Options')]
    $Option = @{},

    # The pixel format.  By default, yuv420p.
    [string]
    $PixelFormat = "yuv420p",

    # If set, will run this in a background job
    [Switch]
    $AsJob
    )

    process {
        if ($AsJob) {
            return (& $StartRoughDraftJob)
        }
        #region Find FFMpeg
        $ffMpeg = Get-FFMpeg -ffmpegPath $FFMpegPath
        if (-not $ffmpeg) { return }
        #endregion Find FFMpeg

        $ri = $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath)
        $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)

        $startEndParams = @()

        $duration =
            if ($Start -and $end) {
                if ($end -gt $Start) {
                    $end - $Start
                } else {
                    $Start - $end
                }
                $startEndParams += "-ss","$start","-t", "$($duration.TotalSeconds)"
            } else {
                $mi = Get-Media -InputPath $ri
                $mi.Duration
            }

        $Resolution = "${Width}x${Height}"

        $filterParams = @()

        $optionStr = if ($Option) {
            (@(foreach ($_ in $option.GetEnumerator()) {
                "$($_.Key)=$($_.Value)"
            }) -join ':') + ':'
        } else {
            ''
        }

        if ($optionStr -eq ':') {
            $optionStr = ''
        }

        if ($Visualizer -eq 'LineWaveform') {
             $FilterParams +=
                "-filter_complex",
                "[0:a]showwaves=${OptionStr}s=${Resolution}:mode=line,format=$pixelFormat[v]",
                "-map",
                "[v]",
                "-map",
                '0:a',
                '-c:v',
                'libx264',
                '-c:a',
                'copy'

        } elseif ($Visualizer -eq 'Spectrum') {
            $FilterParams +=
                "-filter_complex",
                "[0:a]showspectrum=${OptionStr}s=${Resolution},format=$PixelFormat[v]",
                "-map",
                "[v]",
                "-map",
                '0:a',
                '-c:v',
                'libx264',
                '-c:a',
                'copy'

        } elseif ($Visualizer -eq 'Volume') {
            $FilterParams +=
                "-filter_complex",
                "[0:a]showvolume=${OptionStr},format=$PixelFormat[v]",
                "-map",
                "[v]",
                "-map",
                '0:a',
                '-c:v',
                'libx264',
                '-c:a',
                'copy'

        } elseif ($Visualizer -eq 'PhaseMeter') {
            $FilterParams +=
                "-filter_complex",
                "[0:a]aphasemeter=${optionStr}s=${Resolution}:mpc=cyan,format=$PixelFormat[v]",
                "-map",
                "[v]",
                "-map",
                '0:a',
                '-c:v',
                'libx264',
                '-c:a',
                'copy'

        } elseif ($Visualizer -eq 'VectorScope') {
            $FilterParams +=
                "-filter_complex",
                "[0:a]avectorscope=${optionStr}s=${Resolution},format=yuv420p[v]",
                "-map",
                "[v]",
                "-map",
                '0:a',
                '-c:v',
                'libx264',
                '-c:a',
                'copy'

        } elseif ($Visualizer -eq 'TonalScale') {
            $FilterParams +=
                "-filter_complex",
                "[0:a]showcqt=${optionStr}s=${Resolution},format=yuv420p[v]",
                "-map",
                "[v]",
                "-map",
                '0:a',
                '-c:v',
                'libx264',
                '-c:a',
                'copy'

        }
        $progId = Get-Random

        & $ffmpeg -i $ri @FilterParams @startEndParams $uro -y 2>&1 |
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

                    Write-Progress "Encoding" "$lineData".TrimStart("@{").TrimEnd("}") -PercentComplete $perc -id $ProgId
                } else {
                    Write-Verbose "$_"
                }

            } -End {
                Write-Progress "Encoding" "Complete"  -id $ProgId -Completed
                Get-Item -LiteralPath $uro
            }

    }
}

