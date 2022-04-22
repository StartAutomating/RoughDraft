#require -Module HelpOut
Push-Location $PSScriptRoot
$parentPath = $PSScriptRoot | Split-Path
$wikiPath = $parentPath | Get-ChildItem | Where-Object { $_.Name -eq "RoughDraft.wiki" -or $_.Name -eq 'wiki'}

Save-MarkdownHelp -Module RoughDraft -OutputPath $wikiPath -Wiki -ScriptPath Extension -ReplaceScriptName '\.rd\.Extension\.ps1$',
'\.rd\.ext\.ps1$',
'\.RoughDraft\.Extension\.ps1$' -ReplaceScriptNameWith @(@("-Extension") * 10)

git add .
git commit -m "Updating wiki"
git push
Pop-Location