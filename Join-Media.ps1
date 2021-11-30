function Join-Media
{
    <#
    .Synopsis
        Joins media files
    .Description
        Joins multiple media files together into a single file.
    .Link
        Get-Media
    .Link
        Convert-Media
    .Notes
        Join-Media has a variety of uses:

        * Creating a Time Lapse or Stop Motion from a series of images
        * Mixing audio into an existing video file
        * Joining multiple videos or audio files into a single long file
    #>
    [CmdletBinding(DefaultParameterSetName='Auto')]
    [OutputType([IO.FileInfo])]
    param(
    # The input path
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName,ValueFromPipeline)]
    [Alias('Fullname')]
    [string[]]
    $InputPath,

    # The output path
    [Parameter(Mandatory,Position=1)]
    [string]
    $OutputPath,

    # If set, will transcode input files before concatinating them together.
    [switch]
    $Transcode,

    # If inputs are mixed together, instead of concatenated, then the shortest input file will be preferred
    [Switch]
    $Shortest,

    # The frame rate.  If joining images, this determines how long each image takes.
    [Alias('FPS','FramesPerSecond')]
    [uint32]
    $FrameRate = 30,

    # If set, will generate a time lapse.
    # This will assume all inputs are images (skipping individual analysis)
    [Parameter(Mandatory=$true,ParameterSetName='TimeLapse')]
    [Alias('StopMotion','IsStopMotion','IsTimeLapse')]
    [Switch]
    $TimeLapse,

    # The pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg. By default, yuv420p.
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('pix_fmt')]
    [string]
    $PixelFormat = 'yuv420p'
    )

    begin {
        $inputPaths = @()
        $inputList = @()
        $inputMedia = @{}
        $ffMpegConvertStart = { $progSplat= @{Activity='Encoding'}}
        $ffmpegConvertProcess = {
            if ($_ -like "*time=*" -and $_ -like "*bitrate=*") {
                Write-Verbose "$_"
                $lineChunks = $_.Tostring() -split "[ =]" -ne '' | Where-Object { $_.Trim() }
                $lineData = New-Object PSObject
                for ($i =0; $i -lt $lineChunks.Count; $i+=2) {
                    $lineData |Add-Member NoteProperty $lineChunks[$i].TrimEnd("=") $lineChunks[$i + 1] -Force
                }

                $time = $lineData.Time -as [Timespan]
                if ($theDuration) {
                    $progSplat.PercentComplete = $time.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
                } else {
                    $progSplat.Remove('PercentComplete')
                }

                Write-Progress @progSplat "$lineData".TrimStart("@{").TrimEnd("}") -Id $id

            } else {
                Write-Verbose "$_"
            }
        }
        $ffMpegConvertEnd = {
            Write-Progress @progsplat -Status ' ' -Completed -Id $id
        }
    }
    process {
        #region Find FFMpeg
        $ffMpeg = & $findFFMpeg -ffMpegPath $ffmpegPath
        #endregion Find FFMpeg

        $inputPaths+=$InputPath


    }

    end  {
        $id = Get-Random
        $t = $inputPaths.Count
        $c = 0
        foreach ($i in $InputPaths) {
            $c++
            $p = $c * 100 / $t
            $skipAnalysis = $TimeLapse

            $fileStr = "$($ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($i))"
            $inputList += "$fileStr"
            if (-not $skipAnalysis ) {
                Write-Progress "Analyzing Files" "$i" -PercentComplete $p -Id $id
                $mediaInfo = Get-Media -InputPath $i
                $inputMedia["$fileStr"] = $mediaInfo
            }
        }

        $videoFiles = @($inputMedia.Values| Where-Object { $_.Resolution  -and $_.Duration -and $_.Duration -gt '00:00:00.5'})
        $audioFiles = @($inputMedia.Values| Where-Object { $_.CodecTypes -and @($_.CodecTypes)[0] -eq 'Audio' })
        $imageFiles = @($inputMedia.Values|
            Where-Object {
                $_.Resolution -and (-not $_.Duration -or ($_.Duration -lt '00:00:00.5'))
            })

        $isAllVideo = $videoFiles.Count -eq $inputMedia.Count -and $inputMedia.Count -gt 0
        $isAllAudio = $audioFiles.Count -eq $inputMedia.Count -and $inputMedia.Count -gt 0
        $isAllImages = $imageFiles.Count -eq $inputMedia.Count -and $inputMedia.Count -gt 0

        if ($isAllVideo -or $isAllAudio) {
            $tempFiles = foreach ($in in $inputList) {
                if ($Transcode) {
                    if ($isAllVideo) {
                        $tempFile = [IO.Path]::GetTempPath() + "$(Get-Random).mp4"
                        & $ffmpeg -i $in "-qscale:v" 1 $tempFile -y 2>&1 |
                            ForEach-Object -Begin $ffMpegConvertStart $ffmpegConvertProcess -End $ffmpegConvertEnd
                    } else {
                        $tempFile = [IO.Path]::GetTempPath() + "$(Get-Random).mp3"
                        & $ffmpeg -i $in $tempFile -y 2>&1 |
                            ForEach-Object -Begin $ffMpegConvertStart $ffmpegConvertProcess -End $ffmpegConvertEnd
                    }
                    $tempFile
                } else {
                    "$in"
                }
            }

            $ffmpegParams = @(
                if (-not $Transcode) {
                    $tempFilesroot = $tempfiles |
                        Split-Path |
                        Select-Object -Unique

                    [IO.Directory]::SetCurrentDirectory($tempFilesRoot)
                    $tmpFile = Join-Path $tempfilesRoot "fileList.txt"
                    $tmpfileContent = @($tempFiles | Foreach-Object { "file '$_'"  })
                    $tmpfileContent | Set-Content -Path $tmpFile
                    "-f", "concat", "-safe", "0", "-i", $tmpFile, "-c", "copy"
                } else {
                    "-i", "concat:$($tempFiles -join '|')"

                }
            )

            $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($outputPath)

            

            & $ffmpeg @ffMpegParams $uro -y 2>&1 |
                ForEach-Object -Begin $ffMpegConvertStart $ffmpegConvertProcess -End $ffmpegConvertEnd

            Get-Item -Path $uro -ErrorAction SilentlyContinue

            if ($Transcode) {
                foreach ($tmp in $tempFiles) {
                    Remove-Item -LiteralPath $tmp -Force
                }
            }

        }
        elseif ($inputList.Count -eq 2 -and $videoFiles -and $audioFiles)
        {
            # In this case, we're mixing an audio and a video input
            $ffMpegParams = @()
            $c = 0
            $longestDuration = 0
            $shortestDuration = 0
            foreach ($i in $inputList) {
                $ffMpegParams += '-i'
                $ffMpegParams += "$i"

                if ($inputMedia[$i].Duration -and $inputMedia[$i].Resolution) {
                    $videoStreamNumber = $c
                } else {
                    $audioStreamNumber = $c
                }
                if ($inputMedia[$i].Duration.TotalMilliseconds -gt $longestDuration) {
                    $longestDuration = $inputMedia[$i].Duration.TotalMilliseconds
                }
                if ($inputMedia[$i].Duration.TotalMilliseconds -lt $shortestDuration -or $shortestDuration -eq 0) {
                    $shortestDuration= $inputMedia[$i].Duration.TotalMilliseconds
                }
                $C++
            }
            $ffMpegParams += '-map'
            $ffMpegParams += "${VideoStreamNumber}:v"
            $ffMpegParams += '-map'
            $ffMpegParams += "${AudioStreamNumber}:a"
            if ($AudioCodec -or $VideoCodec) {
                if ($AudioCodec) {
                    $ffMpegParams += '-c:a'
                    $ffMpegParams += $AudioCodec
                }  else {
                    $ffMpegParams += '-c:a'
                    $ffMpegParams += 'copy'
                }

                if ($VideoCodec) {
                    $ffMpegParams += '-c:v'
                    $ffMpegParams += $VideoCodec
                }  else {
                    $ffMpegParams += '-c:v'
                    $ffMpegParams += 'copy'
                }
            } else {
                $ffMpegParams += '-codec'
                $ffMpegParams += 'copy'
            }

            $theDuration =
                if ($Shortest) {
                    $ffMpegParams += '-shortest'
                    [Timespan]::FromMilliseconds($shortestDuration)
                } else {
                    [Timespan]::FromMilliseconds($longestDuration)
                }


            $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($outputPath)
            $ffMpegParams += $uro
            $ffMpegParams += '-y'
            & $ffmpeg @ffmpegParams 2>&1 |
                ForEach-Object -Begin $ffMpegConvertStart $ffmpegConvertProcess -End $ffmpegConvertEnd

            Get-Item -Path $uro -ErrorAction SilentlyContinue
        }
        elseif ($isAllImages -or $TimeLapse) {
            $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($outputPath)
            $tmpDir = [io.pATH]::GetTempPath()

            $tempRoot = New-Item -ItemType Directory -Path (Join-Path $tmpDir $(Get-Random))
            $script:c = 0

            $extension = $inputList | Select-Object -First 1 | Get-Item | Select-Object -ExpandProperty Extension

            $inputList|
                Copy-Item -Destination {
                    $script:C++

                    Join-Path $tempRoot ("image-{0}.$extension" -f $script:c)
                } -PassThru |
                ForEach-Object {
                    Write-Progress "Copying Files" "$script:c of $($inputList.Count)" -PercentComplete ($script:c * 100 / $inputList.Length) -Id $id
                }

            $theDuration = [TimeSpan]::FromSeconds($inputList.Count / $frameRate)

           # $tBlend = @('-filter:v', 'tblend')

            & $FFMpeg -framerate $FrameRate -i "$temproot$([IO.Path]::DirectorySeparatorChar)image-%d.$extension" -pix_fmt $PixelFormat -y $uro 2>&1  |
                ForEach-Object -Begin $ffMpegConvertStart $ffmpegConvertProcess -End $ffmpegConvertEnd

            Get-Item -Path $uro -ErrorAction SilentlyContinue

            Remove-Item -Path $tempRoot -Force -ErrorAction SilentlyContinue -Recurse
        }
    }
}
