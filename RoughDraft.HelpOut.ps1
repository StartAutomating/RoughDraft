#require -Module HelpOut
Push-Location $PSScriptRoot
$parentPath = $PSScriptRoot | Split-Path
$wikiPath = $parentPath | Get-ChildItem | Where-Object { $_.Name -eq "RoughDraft.wiki" -or $_.Name -eq 'wiki'}

Save-MarkdownHelp -Module RoughDraft -OutputPath $wikiPath -Wiki -ScriptPath Extension -ReplaceScriptName '\.(rd|RoughDraft)\.(ext|Extension)\.ps1$' -ReplaceScriptNameWith "-Extension"

Push-Location $wikiPath
git add .
git commit -m "Updating wiki"
git push
Pop-Location
Pop-Location