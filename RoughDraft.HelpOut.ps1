#require -Module HelpOut
Push-Location $PSScriptRoot

Import-Module .\RoughDraft.psd1

Save-MarkdownHelp -Module RoughDraft -ScriptPath Extension -ReplaceScriptName '\.(rd|RoughDraft)\.(ext|Extension)\.ps1$' -ReplaceScriptNameWith "-Extension" -PassThru

Pop-Location