if ($PSVersionTable.Platform -eq 'Unix') {
    $ffMpegInPath =  $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffmpeg', 'Application')
    if (-not $ffMpegInPath -and $env:GITHUB_WORKFLOW) {
        "::group::Installing FFMpeg" | Out-Host
        sudo apt update | Out-Host
        sudo apt install ffmpeg | Out-Host
        "::endgroup::" | Out-Host
    }
}

describe Convert-Media {
    it 'Can convert media between formats' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "testsrc$(Get-Random).mp4"
        $converted  = New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05" |
            Convert-Media -OutputPath mkv
        $converted |
            Select-Object -ExpandProperty Extension |
            Should -Be .mkv
        $converted |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -Be "00:00:05"

        Remove-Item $tmpOutPath
        Remove-Item $converted.Fullname
    }

    it 'Can use an extension to -Resize while converting' {
        $tmpOutPath  = Join-Path ([IO.Path]::GetTempPath()) "testsrc$(Get-Random).mp4"
        $tmpOutPath2 = Join-Path ([IO.Path]::GetTempPath()) "testsrc$(Get-Random).mp4"
        $converted   = New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05" |
            Convert-Media -OutputPath $tmpOutPath2 -Resize '1024x720'
        $converted | Get-Media | Select-Object -ExpandProperty Resolution | Should -Be '1024x720'
        Remove-Item $tmpOutPath
        Remove-Item $tmpOutPath2
    }

    context "Error Handling" {
        it 'Will complain when no codec is found' {
            $tmpOutPath  = Join-Path ([IO.Path]::GetTempPath()) "testsrc$(Get-Random).png"
            New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05"
            $err = @()
            Get-Item $tmpOutPath | Convert-Media -Codec askljska -ErrorAction SilentlyContinue -OutputPath .\test.mp4  -ErrorVariable err

            $err[-1] | Should -BeLike '*codec*fullname*'
            Remove-Item $tmpOutPath
        }
    }
}

describe ConvertTo-Waveform {
    it 'Can make waveforms' {
        $tmpOutPath  = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp3"
        $tmpOutPath2 = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp4"
        $waveform    = New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            ConvertTo-WaveForm -Visualizer LineWaveform -OutputPath $tmpOutPath2
        $waveform |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -BeLike "00:00:05*"
        Remove-Item $tmpOutPath
        Remove-Item $tmpOutPath2
    }
}


describe ConvertTo-GIF {
    it 'Can make gifs' {
        $tmpOutPath  = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp3"
        $tmpOutPath2 = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp4"
        $tmpOutPath3 = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).gif"
        $waveform    = New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            ConvertTo-WaveForm -Visualizer LineWaveform -OutputPath $tmpOutPath2
        $waveform |
            ConvertTo-Gif -OutputPath $tmpOutPath3 |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -BeLike "00:00:05*"
        Remove-Item $tmpOutPath
        Remove-Item $tmpOutPath2
        Remove-Item $tmpOutPath3
    }
}

describe Edit-Media {
    it 'Can edit media' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "colorspectrum$(Get-Random).mp4"
        $edited = New-Media -TestSource rgbtestsrc -OutputPath $tmpOutPath -Duration "00:00:05" |
            Edit-media -Sepia

        $edited.Name | should -belike *_Sepia*
        $edited |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -BeLike '00:00:05*'
        Remove-Item $edited.FullName
        Remove-Item $tmpOutPath
    }

    context "Error Handling" {
        it 'Will complain when no codec is found' {
            $tmpOutPath  = Join-Path ([IO.Path]::GetTempPath()) "testsrc$(Get-Random).png"
            New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05"
            $err = @()
            Get-Item $tmpOutPath | Edit-Media -Codec askljska -ErrorAction SilentlyContinue -OutputPath .\test.mp4  -ErrorVariable err -FadeIn

            $err[-1] | Should -BeLike '*codec*fullname*'
            Remove-Item $tmpOutPath
        }
    }
}

describe Get-Media {
    it 'Can detect volume' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp3"
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Get-Media -VolumeLevel |
            Out-String  |
            Should -BeLike *mean_volume*

        Remove-Item $tmpOutPath
    }
}

describe Join-Media {
    it 'Can combine an audio file and a video file' {
        $videoTmpPath = Join-Path ([IO.Path]::GetTempPath()) "Video$(Get-Random).mp4"
        $audioTmpPath = Join-Path ([IO.Path]::GetTempPath()) "Audio$(Get-Random).mp3"
        $avTmpPath    = Join-Path ([IO.Path]::GetTempPath()) "AV$(Get-Random).mp4"
        @(
            New-Media -TestSource rgbtestsrc -Duration "00:00:30" -OutputPath $videoTmpPath
            New-Media -Sine -Duration "00:00:15" -OutputPath $audioTmpPath
        ) | Join-Media -OutputPath $avTmpPath -Shortest | 
            Get-Media | 
            Select-Object -ExpandProperty Duration |
            Select-Object -ExpandProperty Seconds | 
            Should -Be 15

        
        Remove-Item $avTmpPath
        Remove-Item $audioTmpPath
        Remove-Item $videoTmpPath

    }
    it 'Can make a timelapse from a series of images' {
        $tmpOutPaths =
            foreach ($n in 1..30) {
                Join-Path ([IO.Path]::GetTempPath()) "lapsePart$(Get-Random).jpg"
            }

        $newImages = $tmpOutPaths | New-Media -OutputPath { $_ } -TestSource rgbtestsrc

        $lapseOutPath = Join-Path ([IO.Path]::GetTempPath()) "lapse$(Get-Random).mp4"
        $lapseFile = $newImages | Join-Media -OutputPath $lapseOutPath -TimeLapse
        $lapseFile | Get-Media | Select-Object -ExpandProperty Duration | Should -BeLike '00:00:01*'

        $tmpOutPaths | Remove-Item
        $lapseFile | Remove-Item
    }
}

describe New-Media {
    it 'Can create A test source' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "testsrc$(Get-Random).mp4"
        New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05" |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -Be "00:00:05"

        Remove-Item $tmpOutPath
    }

    it 'Can create audio' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp3"
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -BeLike "00:00:05*"
        Remove-Item $tmpOutPath
    }
}


describe Set-Media {
    it 'Can set media metadata' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp3"
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Set-Media -Property @{title='sine'}

        Get-Item $tmpOutPath | Get-Media | Select-Object -ExpandProperty title | should -BeLike sine*

        Remove-Item $tmpOutPath
    }

    it 'Can set album artwork' {
        $tmpOutPath = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).mp3"
        $tmpOutPath2 = Join-Path ([IO.Path]::GetTempPath()) "sine$(Get-Random).jpg"
        New-Media -TestSource rgbtestsrc -OutputPath $tmpOutPath2
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Set-Media -AlbumArt $tmpOutPath2

        $metadata = Get-Media -InputPath $tmpOutPath
        $metadata.Codecs[-1] | Should -Be mjpeg

        Remove-Item $tmpOutPath
        Remove-Item $tmpOutPath2
    }
}