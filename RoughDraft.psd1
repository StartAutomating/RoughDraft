@{
    CompanyName='Start-Automating'
    ModuleVersion='0.2'
    ModuleToProcess='RoughDraft.psm1'
    GUID='c192ebbf-57a3-493e-bc82-da7553038794'
    Description='A Fun PowerShell Module for Multimedia'
    Copyright='2011-2012 Start-Automating'
    Author='James Brundage'
    FormatsToProcess  ='RoughDraft.format.ps1xml'
    TypesToProcess   = 'RoughDraft.types.ps1xml'
PrivateData = @{
        PSData = @{
            Tags = 'FFMpeg', 'Media', 'Multimedia','Audio', 'Video', 'mp3','mp4'
            ProjectURI = 'https://github.com/StartAutomating/RoughDraft'
            LicenseURI = 'https://github.com/StartAutomating/RoughDraft/blob/main/LICENSE'
            IconURI    = 'https://github.com/StartAutomating/RoughDraft/blob/main/Assets/RoughDraft.png'
        }
        ReleaseNotes = @'
0.0.2:
---
Publishing code on GitHub
Refactoring module with an emphasis on extensibility
Added initial GitHub action
'@
    }
}
