function Convert-Media
{
    <#
    .Synopsis
        Converts media from one format to another
    .Description
        Converts media from one format to another, using ffmpeg
    .Example
        Convert-Media "a.mov" "a.mp4"
    .Example
        Convert-Media "a.jpg" ".mp4" -Duration "00:15:00" -Tune stillimage -Preset ultrafast
    .Link
        Get-Media
    .Link
        Get-RoughDraftExtension
    #>
    [OutputType([IO.FileInfo], [Management.Automation.Job])]
    [CmdletBinding(DefaultParameterSetName='Convert-Media')]
    param(
    # The input path
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # The output path
    [Parameter(Mandatory,Position=1,ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath,

    # The codec used for the conversion.  If the file is a video or image file, then this will be treated as a the video codec.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Codec,    

    # The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.
    [string]
    $FFMpegPath,

    # The frame rate of the outputted video
    [string]
    $FrameRate,

    # If set, will copy the audio streams and will not re-encode them.
    [switch]
    $CopyAudio,

    # If provided, will re-encode the audio using the given codec
    [string]
    $AudioCodec,

    # If provided, will apply audio filters to the file
    [CmdletBinding(DefaultParameterSetName='Convert-Media')]
    [string[]]
    $AudioFilter,

    # If provided, will apply video filters to the file
    [CmdletBinding(DefaultParameterSetName='Convert-Media')]
    [string[]]
    $VideoFilter,

    # If provided, will attempt to encode the audio at a variable quality level. Values differ per encoder.
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $AudioQuality,
       
    # If provided, will encode the audio at a given bitrate
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $AudioBitrate,

    # Used to specify the audio stream.  If more than one audio stream is found and this parameter is not supplied, Convert-Media will attempt to find an audio stream that matches the current culture language.
    [int]
    $AudioStreamIndex = -1,

    # The audio channel count.  This can be used to force 5.1 channel audio (which is supported by only a few codecs) into stereo audio (which is supported by almost all codecs)
    [uint32]
    $AudioChannelCount,

    # The metadata to put in the converted file
    [Collections.IDictionary]
    $MetaData,

    # The start time within the media. 
    # This maps to the ffmpeg parameter -ss.
    [Parameter(Position=2, ValueFromPipelineByPropertyName)]
    [Alias('StartTime')]
    [Timespan]
    $Start,

    # The end time within the media. 
    # This maps to the ffmpeg parameter -to.
    [Parameter(Position=3, ValueFromPipelineByPropertyName)]
    [Alias('EndTime')]
    [Timespan]
    $End,

    # The duration of the media.
    # This maps to the ffmpeg parameter -t.
    [Parameter(Position=4, ValueFromPipelineByPropertyName)]
    [Timespan]
    $Duration,

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

    # If provided, will attempt to encode the video at a variable quality level, between 1 (highest) and 31 (lowest).
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateRange(1,31)]
    [int]
    $VideoQuality,

    # If provided, will re-encode the file with a given video codec.  This affects the input files, where -Codec affects the final output.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $VideoCodec,

    # If provided, will output a specified number of frames from the video file
    [Parameter(ValueFromPipelineByPropertyName)]
    [Uint32]
    $VideoFrameCount,

    # If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Pix_Fmt')]
    [string]
    $PixelFormat,

    # If set, will run inside of a background job
    [Switch]
    $AsJob,

    # Any additional arguments to FFMpeg
    [Parameter(ValueFromRemainingArguments)]
    [string[]]
    $FFMpegArgument,

    # If set, this will loop the input source.
    [Switch]
    $Loop,

    # If set, this will loop the input source any number of times.
    [int]
    $LoopCount
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    begin {
        # Create an array to accumulate piped in objects.
        $accumulate = [Collections.ArrayList]::new()

        $culture = Get-Culture
    }

    process {
        if ($AsJob) { # If -AsJob was passed,
            return & $StartRoughDraftJob # start a background job.
        }
        $null = $accumulate.Add(@{} + $PSBoundParameters)        
    }

    end {
        #region Find FFMpeg
        $ffMpeg = Get-FFMpeg -FFMpegPath $FFMpegPath
        if (-not $ffMpeg) { return }
        #endregion Find FFMpeg
        $t = $accumulate.Count
        $c = 0
        $TopProgId  = Get-Random
        :nextFile foreach ($in in $accumulate) {
            foreach ($kv in $in.GetEnumerator()) {
                $ExecutionContext.SessionState.PSVariable.Set($kv.Key, $kv.Value)
            }

            $c++
            $p = $c * 100 / $t

            Write-Progress "Converting Media" "$InputPath -> $OutputPath" -PercentComplete $p -Id $TopProgId


            $ri = if ([IO.File]::Exists($InputPath)) {
                $InputPath
            } else {
                $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath) |
                    Get-Item -LiteralPath {$_ } |
                    Select-Object -ExpandProperty Fullname
            }

            if ($OutputPath -match '^\.(?<extension>[^\.]+)$' -or
                $OutputPath -match '^(?<extension>[^\.]+)$') {
                $fi = [IO.FileInfo]$ri
                $OutputPath = $ri.Substring(0, $ri.Length - $fi.Extension.Length) + $(
                    ('.' + $Matches.extension) -replace '\.+', '.'
                )
            }

            $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)

            $mi = Get-Media -InputPath $ri
            $ffmpegParams = @()
            $filterParams = @()

            $audioStreams = @($mi.Streams | Where-Object Codec_Type -eq 'Audio')

            $theDuration = $mi.Duration

            if ($Start -or $end){
                if (-not $Start) {
                    $start = [TimeSpan]::FromMilliseconds(0)
                }
                if (-not $end) {
                    $end = $theduration
                }
                $theduration = $end - $Start
            }
            elseif ($Duration.TotalMilliseconds) {
                $theDuration = $Duration
            }

            if ($Duration -and (-not $mi.Duration -or $duration -gt $mi.Duration)) { # If the duration is larger than the media duration
                $Loop = $true # imply -Loop (#81)
            }

            #region Handle Extensions
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Filter Parameters from Extension '$($inObj.ExtensionCommand)'"
                        Write-Verbose "$($inObj.extensionOutput)"
                        $FilterParams += $inObj.extensionOutput
                    }
                    if ($inObj.Done) {
                        continue nextFile
                    }
                } }
            #endregion Handle Extensions



            $myAudioStreamIndex = -1
            for ($i = 0; $i -lt $audioStreams.Count; $I++) {
                if ($audioStreams[$i].Tags.language -and $audioStreams[$i].Tags.language.Contains($culture.ThreeLetterISOLanguageName.ToLower())) {

                    $myAudioStreamIndex = $i + 1
                }
            }

            if ($AudioStreamIndex -ge 0) {
                $myAudioStreamIndex = $audioStreamIndex
            } elseif ($myAudioStreamIndex -ge 0) {
                $AudioStreamIndex = $myAudioStreamIndex
            }

            if ($myAudioStreamIndex -eq -1 -and
                $audioStreams.Count -gt 1 -and
                $AudioStreamIndex -lt 0) {
                Write-Warning "More than one audio stream was found, and a default could not be selected based off of the current culture.  Use -AudioStreamIndex"
                return
            } elseif ($AudioStreamIndex -ge 0) {
                $filterParams += "-map", "0:0" # Use default video stream
                $filterParams += "-map", "0:$AudioStreamIndex"
            }


            if ($codec -or $audioCodec -or $VideoCodec) { # If we supplied codecs,
                if (-not $script:CachedCodecList) { # cache a list of available codec if we have not done this already.
                    $script:CachedCodecList = Get-FFMpeg -ListCodec
                }

                $codecList =  $script:CachedCodecList
            }
            if ($Codec) { # If we've supplied a -Codec
                $matchingCodec = $codecList |
                    Where-Object {$_.Codec -like $codec -or $_.FullName -like $codec } |
                    Select-Object -First 1 # find it in the codec list.

                if (-not $matchingCodec) { # If we didn't find it, error out.
                    Write-Error "Codec not found.  Try one of the following items $($codecList | Where-Object {$_.CanEncode } | Select-Object Codec, Fullname | Out-String)"
                    return
                }

                $ffmpegParams += "-c"  # If we did find the codec, add '-c' and the name of  the codec to the ffmpeg parameters.
                $ffmpegParams += "$($matchingCodec.Codec)"
            }            


            $TimeFrame =@()
            if ($Start -and $start.TotalMilliseconds -ge 0) { # If we were provided a start time
                $TimeFrame += '-ss' # Use -ss.
                $TimeFrame += "$Start"
            }

            if ($End -and $end.TotalMilliseconds -ge 0) { # If we were provided an end
                if (-not $PSBoundParameters.Start -and -not ($Loop -or $LoopCount)) { # if we didn't get a start and we're not looping
                    $TimeFrame += '-ss'
                    $TimeFrame += "$([Timespan]::FromMilliseconds(0))" # set start to 0
                }
                $TimeFrame += '-to' # then use '-to' to set the end time.
                $TimeFrame += "$End"
            }

            if ($Duration) {
                $TimeFrame += '-t'
                $TimeFrame += "$($Duration.TotalSeconds)"
            }

            if ($PSBoundParameters.VideoFrameCount) { # If we were provided a frame count
                $timeFrame += "-vframes" # Use -vframes.
                $timeFrame += "$VideoFrameCount"
            }

            if ($PixelFormat) { # If we were provided a -PixelFormat
                # use the -pix_fmt parameter.
                $filterParams += '-pix_fmt', $PixelFormat
            }

            if ($tune) { # If -Tune was provided
                $filterParams += '-tune', $tune # add the -tune parameter.
            }

            if ($Preset) { # If -Preset was provied
                $filterParams += '-preset', $Preset # add the -preset parameter.
            }

            if ($VideoFilter) { # If any other video filters were passed
                foreach ($vf in $VideoFilter) {
                    $filterParams += '-vf' # add them to '-vf'
                    $filterParams += "`"$($vf.Trim('"'))`""
                }
            }

            if ($MetaData) { # If -MetaData was passed
                foreach ($kv in $metaData.GetEnumerator()) {
                    $filterParams += "-metadata" # set it with the -metadata parameter.
                    $filterParams+= "`"$($kv.Key)`"=`"$($kv.Value)`""
                }
            }

            if ($FrameRate) { # If -FrameRate was passed
                $ffmpegParams += "-r" # use '-r' to set it.
                $ffmpegParams += "$FrameRate"
            }

            if ($CopyAudio) { # If we indicated we were going to copy audio
                $ffmpegParams += "-c" # pass '-c' 'a:copy'
                $ffmpegParams += "a:copy"
            }

            if ($AudioFilter) { # If any additional audio filters were passed
                foreach ($af in $AudioFilter) {
                    $filterParams += '-af' # pass them to -af
                    $filterParams += "`"$($af.Trim('"'))`""
                }
            }

            if ($audioCodec) { # If we provided an audio codec try to find a match
                $matchingCodec = $codecList | Where-Object {$_.Codec -like $AudioCodec -or $_.FullName -like $AudioCodec } | Select-Object -First 1
                if ($matchingCodec) { # If we did, pass the short name to -acodec
                    $filterParams += "-acodec"
                    $filterParams += "$($matchingCodec.Codec)"
                } else {
                    $filterParams += "-acodec"  # otherwise, pass whatever the user put in.
                    $filterParams += "$audioCodec"
                }
            }

            if ($VideoCodec) { # If we provided an video codec try to find a match
                $matchingCodec = $codecList | Where-Object {$_.Codec -like $AudioCodec -or $_.FullName -like $AudioCodec } | Select-Object -First 1
                if ($matchingCodec) { # If we did, pass the short name to -vcodec
                    $filterParams += "-c:v"
                    $filterParams += "$($matchingCodec.Codec)"
                } else {
                    $filterParams += "-c:v" # otherwise, pass whatever the user put in.
                    $filterParams += "$VideoCodec"
                }
            }

            if ($AudioBitrate) { # If we provided an audio bitrate
                $filterParams += "-b:a"  # don't forget to add that.
                $filterParams += "$audioBitrate"
            }


            if ($AudioChannelCount) { # If we have provided an audio channel count
                $filterParams += "-ac" # use -ac to pass it along.
                $filterParams += "$AudioChannelCount"
            }

            if ($AudioQuality) {
                $filterParams += "-qscale:a"
                $filterParams += $AudioQuality
            }

            if ($VideoQuality) {
                $filterParams += "-qscale:v"
                $filterParams += $VideoQuality
            }

            $filterParams += "-threads" # Add threads 0
            $filterParams += "0"

            $FirstParams = @()



            if ($Loop -or $LoopCount) { # If we're going to loop it.
                $firstParams += "-stream_loop"
                $firstParams += if ($LoopCount -gt 0) {
                    $LoopCount
                } else { -1 }
            }


            if ($uro -like "*.mp4") { # If we're encoding .mp4, use -movflags faststart.
                $filterParams += '-movflags', 'faststart'
            }


            $ProgId = Get-Random
            Write-Verbose "FFMpeg Arguments: $FirstParams -i $ri $TimeFrame $filterParams $ffMpegArgument $uro -y $ffmpegParams"
            $lines =@()

            $allFFMpegArgs = @(
                $FirstParams
                '-i'
                $ri
                $TimeFrame
                $filterParams
                $FFMpegArgument
                $uro
                '-y'
                $ffmpegParams
            )

            Use-FFMpeg -FFMpegPath $FFMpegPath -FFMpegArgument $allFFMpegArgs |
                . {
                    process {
                        $line = $_
                        $lines += $line
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
                            Write-Progress "$ri -> $uro" $progressMessage -PercentComplete $perc -Id $ProgId -SecondsRemaining $timeLeft.TotalSeconds
                        }
                        Write-Verbose "$line"
                    }
                    end {
                        Write-Progress "$ri -> $uro" " " -Completed -Id $progId
                    }
                }

            Get-Item -ErrorAction SilentlyContinue -Path $uro
        }

        Write-Progress "Converting Media" " " -Completed -Id $TopProgId
    }
}
