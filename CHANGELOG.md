## 0.2.7:
* New Extensions:
  * DirectShow (#33)
  * VideoForLinux (#34)
* New Commands:
  * Send-Media (#9)
  * Recieve-Media (#10)
* Bugfixes:
  * Get-FFMpeg -ListCaptureDevice no longer enumerates vfwcap on Windows, because it is depracated (#36)
---
## 0.2.6
* New Extensions:
  * Pixelate (#28)
  * AlbumArt (#31)
* Set-Media is now extensible (#31)
* Get-Media is more stable (#29)
---
## 0.2.5
* New Extensions
  * ShuffleFrames (#23)
  * Echo (#21)
* Switched Extension Engine to [Piecemeal](https://github.com/StartAutomating/Piecemeal)
* Convert-Media now supports -AudioQuality/-VideoQuality (fixing #24)
* Edit-Media now allows for filters to be combined (#26)
* Updating Action (simplifying push)
---
## 0.2.4
* New Command: Split-Media
* New Extension: NoAudio (for Split-Media)
---
## 0.2.3:
* New command: Show-Media (#8)
* Bugfix: Playlist extension no longer adds -Encoding (#13)
* New Extension:  Sierpinksi fractal (#14)
---
## 0.2.2:
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
* Adding Mandelbrot Extension (for New-Media)
* Making Get-FFMpeg extensible
* Making -Codecs/-ListCaptureDevice extensions for Get-FFMpeg
* Adding ListFilters and FilterInput extensions for Get-FFMpeg
* Internal refactoring and minor bugfixes.
## 0.2:
---
Publishing code on GitHub
Refactoring module with an emphasis on extensibility
Added initial GitHub action
