Push-Location ($PSScriptRoot | Split-Path)
Install-Piecemeal -ExtensionModule 'RoughDraft' -ExtensionModuleAlias 'rd' -ExtensionTypeName 'RoughDraft.Extension' -OutputPath '.\Get-RoughDraftExtension.ps1'
Pop-Location