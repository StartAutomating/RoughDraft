---

title: RoughDraft 0.3.5
sourceURL: https://github.com/StartAutomating/RoughDraft/releases/tag/v0.3.5
tag: release
---
## 0.3.5:
* New Extensions:
  * AudioExpression!!! (Fixes #22)
  * BilateralSmooth (Fixes #117)
  * Colorize (Fixes #120)
  * FillBorder (Fixes #105)
  * FrameStep (Fixes #113)
  * Pulsator (Fixes #104)  
  * SubFrequencyCut (Fixes #123)
  * SuperFrequencyCut (Fixes #124)  
  * VideoExpression!!! (Fixes #116)  
* -Media commands now use Use-FFMpeg (Fixes #106)
* Use-FFMpeg:  Improved error handling (Fixes #108)
* Show-Media:
  * InputPath is now optional (Fixes #107)
  * Allowing multiple audio filters (Fixes #109)
* Auto-generating docs (Fixes #122)
---

## 0.3.4:
* Adding Flanger Extension (#100)
* Show-Media:
  * Fixing looping behavior (#102)
  * Enabling filters on inputfiles (#101)
* Get-RoughDraftExtension:  Updating Piecemeal Version
* Join-Media:  Fixing multidirectory issue (#99)
* Edit-Media:  Attempting to fix Progress Issues (#85)
* Fixing Rate Extension (#98)
* Get-Media:  Fixing #97 (allowing data streams that have no codec)
---
        
## 0.3.3:
* New Extensions:
  * Adding Exposure Extension (#87)      
  * Adding FlipVertical Extension (#91)
  * Adding FlipHorizontal Extension (#90)
  * Adding LimitPixel Extension (#93)
  * Adding TimeMix Extension (#95)
* Adding RoughDraft.HelpOut.ps1
* Updating RoughDraft Action:
  * Fixing #88. 
  * Adding -FFMpegInstallArgument (#89)
* Adding additional extension examples, fixing help
* Making various extensions apply to Show-Media
---

## 0.3.2:
* Updating RoughDraft Tests (adding test for image->video, re #83)
* Convert-Media:  Adding .EXAMPLE for Image Conversion (#83)
* Adding ColorScope Extension (#79)
* Show-Media:  Fixing output errors (#76)
* Updating Subtitler Extension (removing -OutputPath)
* Convert-Media:  Implying -Loop when -Duration is greater than input duration (#81)
* Edit-Media:  Support for -Tune and -Preset (#82)
* Convert-Media:  Support for -Tune and -Preset (#82)
* Get-RoughDraftExtension:  Updating Piecemeal Version [0.2.1]
---

## 0.3.1:
* Adding Subtitler Extension (#73)
* Show-Media:  Safeguarding progress output (Fixing #76)
* Edit-Media:  -Codec is no longer positionally bound.
* Simplifying Resize Extension
* Convert/Edit-Media:  Support for -FFMpegArgument (#75)
* Edit-Media:  Adding -Force (fixing #77)
* Convert/Edit-Media:  Support for -Duration (#74)
* Adding DrawSubtitle Extension (#72)
---

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

## 0.2.8:
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
