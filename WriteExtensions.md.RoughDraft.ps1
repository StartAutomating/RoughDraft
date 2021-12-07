git pull 2>&1 | Out-Host

$extensionList = Get-RoughDraftExtension 

$extensionsMarkdown = @(
    '|' + ("DisplayName","Synopsis","Extends" -join '|') + '|'
    '|' + (':-','-','-:' -join '|') +'|'
    foreach ($ext in $extensionList) {
        $extendsList = $ext.Extends -join ','
        '|' + (
            $ext.DisplayName, ($ext.Synopsis -replace '[\r\n]'), $extendsList -join '|'
        ) + '|'        
    }
) -join [Environment]::NewLine


$extensionsMarkdown | Set-Content .\RoughDraftExtensions.md -Encoding UTF8
Get-Item .\RoughDraftExtensions.md |
    Add-Member NoteProperty CommitMessage "Updating Extensions.md [skip ci]" -Force -PassThru