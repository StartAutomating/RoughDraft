Write-FormatView -TypeName RoughDraft.Media -Property FileName, FileSize, MediaType -VirtualProperty @{
    FileSize = {
        if ($_.FileSize) {
            if ($_.FileSize / 1gb -eq 1) {
                '' + $([Math]::Round($_.FileSize / 1gb, 2)) + 'gb'
            }
            elseif ($_.FileSize / 1mb -ge 1) {
                '' + $([Math]::Round($_.FileSize / 1mb, 2)) + 'mb'
            }
            elseif ($_.FileSize -gt 1kb) {
                '' + $([Math]::Round($_.FileSize / 1kb, 2)) + 'kb'
            } else {
                $_.FileSize
            }
        }
    }
}