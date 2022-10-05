This directory contains RoughDraft extensions.


~~~PipeScript{
    Import-Module ../RoughDraft.psd1 -Global
    [PSCustomObject]@{
        Table = Get-RoughDraftExtension |
            Sort-Object DisplayName |            
            .DisplayName {
                "[$($_.DisplayName)](../docs/$($_.DisplayName + '-Extension.md'))"
            } .Synopsis .Extends {
                $_.Extends -join ','
            } .Source {
                "[$($_.Name)]($($_.Name))"
            }
    }
}
~~~