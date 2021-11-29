if ($PSVersionTable.Platform -eq 'Unix') {
    $ffMpegInPath =  $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffmpeg', 'Application')
    if (-not $ffMpegInPath -and $env:GITHUB_WORKFLOW) {
        "::group::Installing FFMpeg" | Out-Host
        sudo apt update | Out-Host
        sudo apt install ffmpeg | Out-Host
        "::endgroup::" | Out-Host
    }
}

describe New-Media {
    it 'Can create A test source' {
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "testsrc$(Get-Random).mp4"
        New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05" | 
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -Be "00:00:05"

        Remove-Item $tmpOutPath
    }

    it 'Can create audio' {
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp3"
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Get-Media |
            Select-Object -ExpandProperty Duration |
            Should -BeLike "00:00:05*"
        Remove-Item $tmpOutPath
    }
}

describe Convert-Media {
    it 'Can convert media between formats' {
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "testsrc$(Get-Random).mp4"
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
        $tmpOutPath  = Join-Path ([io.pATH]::GetTempPath()) "testsrc$(Get-Random).mp4"
        $tmpOutPath2 = Join-Path ([io.pATH]::GetTempPath()) "testsrc$(Get-Random).mp4" 
        $converted   = New-Media -TestSource testsrc -OutputPath $tmpOutPath -Duration "00:00:05" | 
            Convert-Media -OutputPath $tmpOutPath2 -Resize '1024x720'
        $converted | Get-Media | Select-Object -ExpandProperty Resolution | Should -Be '1024x720'
    }
}

describe ConvertTo-Waveform {
    it 'Can make waveforms' {
        $tmpOutPath  = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp3"
        $tmpOutPath2 = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp4"
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
        $tmpOutPath  = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp3"
        $tmpOutPath2 = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp4"
        $tmpOutPath3 = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).gif"
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
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "colorspectrum$(Get-Random).mp4"
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
}

describe Measure-Media {
    it 'Can detect volume' {
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp3"
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Measure-Media -VolumeLevel | 
            Out-String  |
            Should -BeLike *mean_volume*

        Remove-Item $tmpOutPath        
    }
}

describe Set-Media {
    it 'Can set media metadata' {
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp3"
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Set-Media -Property @{title='sine'}

        Get-Item $tmpOutPath | Get-Media | Select-Object -ExpandProperty title | should -BeLike sine*

        Remove-Item $tmpOutPath        
    }

    it 'Can set album artwork' {
        $tmpOutPath = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).mp3"
        $tmpOutPath2 = Join-Path ([io.pATH]::GetTempPath()) "sine$(Get-Random).jpg"
        New-Media -TestSource rgbtestsrc -OutputPath $tmpOutPath2
        New-Media -Sine -OutputPath $tmpOutPath -Duration "00:00:05" |
            Set-Media -AlbumArt $tmpOutPath2

        $metadata = Get-Media -InputPath $tmpOutPath
        $metadata.Codecs[-1] | Should -Be mjpeg

        Remove-Item $tmpOutPath
        Remove-Item $tmpOutPath2
    }
}