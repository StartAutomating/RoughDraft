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
    .Link
        Get-RoughDraftExtension
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
    [Parameter(Mandatory,ParameterSetName='TimeLapse')]
    [Alias('StopMotion','IsStopMotion','IsTimeLapse')]
    [Switch]
    $TimeLapse,

    # The number of threads to use for decoding and filtering.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $ThreadCount,

    # If provided, will use an ffmpeg preset to encode.
    # This maps to the --preset parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Preset,

    # If provided, will use a set of encoder settings to "tune" the video encoder.
    # Not supported by all codecs.  This maps to the --tune parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Tune,

    # The pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg. By default, yuv420p.    
    [Alias('pix_fmt')]
    [string]
    $PixelFormat = 'yuv420p'
    )
    
    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    begin {
        $inputPaths = @()
        $inputList = @()
        $inputMedia = [Ordered]@{}

        $perfArgs = @(
            if ($ThreadCount) {
                "-threads"
                $ThreadCount
                "-filter_threads"
                $ThreadCount            
            }
            if ($tune) { # If -Tune was provided
                '-tune', $tune # add the -tune parameter.
            }
    
            if ($Preset) { # If -Preset was provied
                '-preset', $Preset # add the -preset parameter.
            }
        )
        $ffmpegConvertProcess = {
            $line = $_
            if ($_ -like "*time=*" -and $_ -like "*bitrate=*") {
                Write-Verbose "$_"

                if (-not $theDuration) {
                    $theDuration = $inputMedia.Values | 
                        Where-Object Duration |
                        Sort-Object Duration -Descending:$Shortest |
                        Select-Object -ExpandProperty Duration -First 1                    
                }
                
                $progress = $line | & ${?<FFMpeg_Progress>} -Extract                        
                if ($progress -and 
                    $progress.Time.Totalmilliseconds -and 
                    $theDuration.TotalMilliseconds
                ) {
                    $perc = $progress.Time.TotalMilliseconds * 100 / $theDuration.TotalMilliseconds
                    $frame, $speed, $bitrate  = $progress.FrameNumber, $progress.Speed, $progress.Bitrate
                    if ($perc -gt 100) { $perc = 100 }
                    $progressMessage = 
                        @("$($progress.Time)".Substring(0,8), "$theDuration".Substring(0,8) -join '/'
                            "Frame: $frame","Speed $speed","Bitrate $bitrate" -join ' - '
                        ) -join ' '                        
                    $timeLeft = $theDuration - $progress.Time                            
                    Write-Progress "Encoding $uro" $progressMessage -PercentComplete $perc -Id $Id -SecondsRemaining $timeLeft.TotalSeconds
                }
            } else {
                Write-Verbose "$_"
            }
        }
        $ffMpegConvertEnd = {
            Write-Progress "Encoding" -Status ' ' -Completed -Id $id
        }
    }
    process {        
        $inputPaths+=$InputPath
    }

    end  {
        #region Find FFMpeg
        $ffMpeg = Get-FFMpeg -ffMpegPath $ffmpegPath
        if (-not $ffmpeg) { return }
        #endregion Find FFMpeg

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

        $ranExtension = $false
        $doneJoining  = $false
        $extensionParams = @()
        $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($outputPath)

        :nextFile do {
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter (@{} + $PSBoundParameters) |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $ranExtension = $true
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Filter Parameters from Extension '$extensionCommand'"
                        Write-Verbose "$($inObj.extensionOutput)"
                        $extensionParams += $inObj.ExtensionOutput
                    }
                    if ($inObj.Done) {
                        $inObj.ExtensionOutput
                        $doneJoining = $true
                        continue nextFile
                    }
                } }
        } while (0)

        if ($doneJoining) { return }

        if ($extensionParams) {
            
            $inputKeys = @(
                foreach ($in in $inputMedia.Keys) {
                    '-i'
                    "`"$in`""
                }
            )
            if ($extensionParams -ne '-map') {                
                $extensionParams += '-y', $uro
            }
            Use-FFMpeg -FFMpegArgument @(
                $inputKeys
                $extensionParams
                $perfArgs
            ) -FFMpegPath $ffmpegPath |
                ForEach-Object $ffmpegConvertProcess -End $ffmpegConvertEnd

            if (Test-Path $uro) {
                Get-Item $uro
            } else {
                for ($epi =0 ; $epi -lt $extensionParams.Count; $epi++) {
                    if ($epi -gt 2 -and 
                        $extensionParams[$epi] -eq '-map' -and 
                        (Test-Path $extensionParams[$epi])) {
                        Get-Item $extensionParams[$epi]
                    }
                }
            }
        } elseif ($isAllVideo -or $isAllAudio) {
            if (@($inputMedia.Values | Select-Object -ExpandProperty codecs -Unique).Count -gt 1) {
                $Transcode = $true
            }
            $tempFiles = foreach ($in in $inputList) {
                if ($Transcode) {
                    if ($isAllVideo) {
                        $tempFile = [IO.Path]::GetTempPath() + "$(Get-Random).mp4"
                        $theDuration = $inputMedia[$in].Duration
                        & $ffmpeg -i $in "-qscale:v" 1 $tempFile -y 2>&1 |
                            ForEach-Object $ffmpegConvertProcess -End $ffmpegConvertEnd
                    } else {
                        $tempFile = [IO.Path]::GetTempPath() + "$(Get-Random).mp3"
                        $theDuration = $inputMedia[$in].Duration
                        & $ffmpeg -i $in $tempFile -y 2>&1 |
                            ForEach-Object $ffmpegConvertProcess -End $ffmpegConvertEnd
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
                        Select-Object -Unique -First 1

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

            $totalDuration =0
            foreach ($inputMediaItem in $inputMedia[$inputList]) {
                $totalDuration += $inputMediaItem.Duration.TotalMilliseconds
            }
            $theDuration = [Timespan]::FromMilliseconds($totalDuration)


            Use-FFMpeg -FFMpegArgument @(
                $ffmpegParams
                $uro
                '-y'
                $perfArgs
            ) -FFMpegPath $ffmpegPath |
                ForEach-Object $ffmpegConvertProcess -End $ffmpegConvertEnd

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
            $ffmpegParams += $perfArgs
            Use-FFMpeg -FFMpegArgument $ffmpegParams -FFMpegPath $ffmpegPath |
                ForEach-Object $ffmpegConvertProcess -End $ffmpegConvertEnd

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

            Use-FFMpeg -FFMpegArgument @(
                '-framerate'
                $FrameRate
                '-i'
                "$temproot$([IO.Path]::DirectorySeparatorChar)image-%d.$extension"
                '-pix_fmt'
                $PixelFormat
                '-y'
                $uro
                $perfArgs
            ) -FFMpegPath $ffmpegPath |
                ForEach-Object $ffmpegConvertProcess -End $ffmpegConvertEnd

            Get-Item -Path $uro -ErrorAction SilentlyContinue

            Remove-Item -Path $tempRoot -Force -ErrorAction SilentlyContinue -Recurse
        }
    }
}
