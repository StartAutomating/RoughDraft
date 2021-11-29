if ($PSVersionTable.Platform -eq 'Unix') {
    $ffMpegInPath =  $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffmpeg', 'Application')
    if (-not $ffMpegInPath -and $env:GITHUB_WORKFLOW) {
        sudo apt update | Out-Host
        sudo apt install ffmpeg | Out-Host
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
}

