function Split-Media
{
    <#
    .Synopsis
        Splits media
    .Description
        Splits media files
    .Example
        # Pick out the first five seconds of a song
        Split-Media -InputPath $home\Music\ASong.mp3 -Start 00:00:00 -End 00:00:05 
    .Link
        Get-Media
    .Link
        Join-Media
    .Link
        Get-RoughDraftExtension
    #>
    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([IO.FileInfo], [Management.Automation.Job])]
    param(
    # The input path
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # One or more output paths
    [Parameter(Position=1,ValueFromPipelineByPropertyName)]
    [string[]]
    $OutputPath,

    # The path to FFMpeg.  Download it from http://ffmpeg.org/
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [string]
    $FFMpegPath,

    # The timespan to start splitting the video
    [Parameter(Mandatory,Position=1, ValueFromPipelineByPropertyName,ParameterSetName='Segment')]
    [Alias('StartTime')]
    [Timespan]
    $Start,

    # The time span to end splitting the video
    [Parameter(Position=2, ValueFromPipelineByPropertyName,ParameterSetName='Segment')]
    [Alias('EndTime')]
    [Timespan]
    $End
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    begin {
        $ffmpegProcess = {
            $line = $_
            if ($_ -like "*time=*" -and $_ -like "*bitrate=*") {
                Write-Verbose "$_"

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
        $ffMpegEnd = {
            Write-Progress "Encoding" -Status ' ' -Completed -Id $id
        }
    }

    process {
        if ($AsJob) {
            return . $StartRoughDraftJob
        }
        $ffMpeg = Get-FFMpeg -FFMpegPath $FFMpegPath
        if (-not $FFMpeg) { return }
        $ri =
            if ([IO.File]::Exists($InputPath)) {
                $InputPath
            } else {
                $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath) |
                    Get-Item -LiteralPath {$_ } |
                    Select-Object -ExpandProperty Fullname
            }

        $mediaInfo = $mi = Get-Media -InputPath $ri
        $fileInfo  = Get-Item -LiteralPath $ri

        $theDuration = $mediaInfo.Duration

        $ffArgs = @('-hide_banner', '-i', "$ri")
        $in = [Ordered]@{} + $PSBoundParameters
        if ($PSCmdlet.ParameterSetName -eq 'Segment') {
            if (-not $in.End) {
                $end = $in.End = $mediaInfo.Duration
            }
            if (-not $in.OutputPath) {
                $startTimeStr = $start.ToString() -replace '([\d\.]+)0{2,}$','$1' -replace '[:;]', '-'
                $endTimeStr   = $end.ToString() -replace '([\d\.]+)0{2,}$','$1' -replace '[:;]', '-'
                $outputPath = $in.OutputPath =
                    $fileInfo.FullName.Substring(0, $fileInfo.FullName.Length - $fileInfo.Extension.Length) +
                    '@' + $startTimeStr + '--' + $endTimeStr + $fileInfo.Extension
            }
            $theDuration = $end - $start
            $ffArgs += '-ss', "$start", '-to', "$end"
        }

        $id = Get-Random

        :nextFile foreach ($inputFile in @($InputPath)) {
            #region Handle Extensions
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Parameters from Extension '$extensionCommand'"
                        Write-Verbose "$extensionOutput"
                        $ffArgs += $inObj.extensionOutput
                    }
                    if ($inObj.Done) {
                        continue nextFile
                    }
                } }
            #endregion Handle Extensions

            if (-not $in.OutputPath -and -not ($ffargs -eq '-map')) {
                $parameterSetShortName = ($PSCmdlet.ParameterSetName -split "\$([IO.Path]::DirectorySeparatorChar)")[-1] -replace
                    '\.(rd|RoughDraft)\.(ext|extension)\.ps1$'
                $outputPath = $in.OutputPath = $fileInfo.FullName.Substring(0, $fileInfo.FullName.Length - $fileInfo.Extension.Length) +
                        "_$parameterSetShortName" + $fileInfo.Extension
            }

            if ($in.OutputPath.Count -eq 1) {
                $uro = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)
                $ffArgs += "$uro", '-y'
            }

            Use-FFMpeg -FFMpegArgument $ffArgs -FFMpegPath $FFMpegPath |
                ForEach-Object $ffmpegProcess -End $ffmpegEnd

            if ($in.OutputPath.Count -eq 1) {
                Get-item -literalPath $in.OutputPath
            } elseif ($in.OutputPath.Count -gt 1) {
                foreach ($outPath in $in.OutputPath) {
                    Get-item -literalPath $outPath
                }
            } else {
                for ($i=0; $i -lt $ffargs.Count) { # Otherwise, if we've
                    $ffArg = $ffArgs[$i]
                    if ($ffArg -like '*.*' -and
                        $ffArg -notmatch '\S+=$' -and
                        $ffargs[$i - 1] -ne '-i') {
                        Get-Item -Path $ffarg -ErrorAction SilentlyContinue
                    }
                }
                $ffargs
            }
        }


    }
}
