@{
    CompanyName='Start-Automating'
    ModuleVersion='0.2.3'
    ModuleToProcess='RoughDraft.psm1'
    GUID='c192ebbf-57a3-493e-bc82-da7553038794'
    Description='A Fun PowerShell Module for Multimedia'
    Copyright='2011-2021 Start-Automating'
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
## 0.2.3:
---
* New command: Show-Media (#8)
* Bugfix: Playlist extension no longer adds -Encoding (#13)
* New Extension:  Sierpinksi fractal (#14)

## 0.2.2:
---
* Enhancing support for Progress Bars (Fixing #3)
* Making Join-Media extensible (Fixing #4)
* New Extensions:
|Extension   |Commands   |
|------------|-----------|
|DataScope   |Edit-Media |
|Emboss      |Edit-Media |
|Monochrome  |Edit-Media |
|Playlist    |Join-Media |
|ReverseAudio|Edit-Media |
|ReverseVideo|Edit-Media |
|ScrollVideo |Edit-Media |
|Vignette    |Edit-Media |

---
## 0.2.1:
---
* Adding Mandelbrot Extension (for New-Media)
* Making Get-FFMpeg extensible
* Making -Codecs/-ListCaptureDevice extensions for Get-FFMpeg
* Adding ListFilters and FilterInput extensions for Get-FFMpeg
* Internal refactoring and minor bugfixes.
---
## 0.2:
---
Publishing code on GitHub
Refactoring module with an emphasis on extensibility
Added initial GitHub action
'@
    }
}
