## 0.3:
* Adding LagFun Extension (#69)
* Get-Media:  Returning at the beginning of end if -AsJob was passed
* Adding ColorContrast Extension (#68)
* Adding ColorHold Extension (#67)
* MedianPixel extension:  Support for -MedianPixelTimeBlend
* Adding Vibrato Extension (#65)
* Adding Tremolo Extension (#64)
* Adding Blur Extension (#63).  Adding Histogram Extension (#62)
* Edit-Media:  Adding Logging to Avoid Reprocessing (#49)
---

## 0.2.9:
* Adding AmplifyPixel Extension (#61)
* Adding MedianPixel Extension (#59)
* Updating GitHub Jobs/Steps Defintions
* Adding Hue Extension (#58)
* Get-RoughDraftExtension:  Upgrading Piecemeal [0.1.9]
* CropDetect Extension:  Returning timeframe of crop intervals, making more pipeline friendly.
* Adding Tile Extension (#54)
* Adding Skew Extension (#57)
* Adding Crop Extension (#46)
* Rotate Extension:  Adding -OutputWidth and -OutputHeight.  Enabling Show-Media (#56)
* Show-Media:  Allowing for filtering (#56)
* Join-Media:  Quoting input Files
* Get-Media:  No longer collecting files if an extension could be run
* Adding BlendVideo Extension (#51)
* Adding YouTubeDL Extension (#42)
* Adding RandomizeFrame extension (#52)
* Adding EdgeDetect Extension (#53)
* Rotate extension:  Allowing arbitrary rotation (#47)
* Adding BlendFrame Extension (#48)
* Adding Mirror Extension (#35)
* AudioGain Extension: Fixing #55
* Updating Action Source
* Updating DirectShow extension:  Extending Send-Media
* Updating VideoForLinux extension:  Extending Send-Media
---

## 0.2.8
* New Extensions:
  * Adding ListProtocols Extension (#38)
  * Initial FrameBuffer Extension (#40)

* Fixes:
  * Fixing video4Linux Extension (#34)
  * CaptureDevice extension fix for Core (#44)

* Command Changes:
  * Receive-Media now supports -PixelFormat/-FrameRate/-FrameCount (#41)
  * Show-Media now supports -Loop/-LoopCount, and autoloops a single image (#43)
---

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
