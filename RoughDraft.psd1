@{
    CompanyName='Start-Automating'
    ModuleVersion='0.4.4'
    ModuleToProcess='RoughDraft.psm1'
    GUID='c192ebbf-57a3-493e-bc82-da7553038794'
    Description='A Fun PowerShell Module for Multimedia'
    Copyright='2011-2026 Start-Automating'
    Author='James Brundage'
    FormatsToProcess  = 'RoughDraft.format.ps1xml'
    TypesToProcess = 'RoughDraft.types.ps1xml'
    PrivateData = @{
        PSData = @{
            Tags = 'Media', 'Multimedia','Audio', 'Video', 'FFMpeg', 'mp3','mp4','jpg','png'
            ProjectURI = 'https://github.com/StartAutomating/RoughDraft'
            LicenseURI = 'https://github.com/StartAutomating/RoughDraft/blob/main/LICENSE'
            IconURI    = 'https://github.com/StartAutomating/RoughDraft/blob/main/Assets/RoughDraft.png'
            ReleaseNotes = @'
## RoughDraft 0.4.4

* New Filters
  * `Trim` (#334)
  * `TrimAudio` (#335)
  * `Compressor` (#339)
  * `Interlace` (#340)
  * `Deinterlace` (#341)
  * `Biquad` (#342)
* Improvements
  * `Convert-Media` progress fix (#336)
  * `Convert-Media` binding improvement (#337)
  * `Edit-Media` caches to memory not disk (#343)
    * No more littered history files
  * Fixed documentation over-generation (#338)
---

Additional Changes in [CHANGELOG](https://github.com/StartAutomating/RoughDraft/blob/main/CHANGELOG.md)
'@
        }
        Taglines = @(
            'A Fun PowerShell Module for Multimedia',
            'FFMpeg made easier with PowerShell',
            'Manipulate Audio and Video with PowerShell',
            'PowerShell and FFMpeg, together at last'
        )
        
    }
}
