---

title: RoughDraft 0.4
sourceURL: https://github.com/StartAutomating/RoughDraft/releases/tag/v0.4
tag: release
---
## 0.4:

* Enabled Sponsorship (please show your support) ([#185](https://github.com/StartAutomating/RoughDraft/issues/185))
* Audio Visualizations now force output of video ([#176](https://github.com/StartAutomating/RoughDraft/issues/176))
* ConvertTo-Gif is now an alias to Convert-Media ([#71](https://github.com/StartAutomating/RoughDraft/issues/71))
* Added GifPalette Extension ([#71](https://github.com/StartAutomating/RoughDraft/issues/71))
* Made Subtitle Extraction Easier ([#186](https://github.com/StartAutomating/RoughDraft/issues/186))
* New Extensions:
  * Crossfade ([#18](https://github.com/StartAutomating/RoughDraft/issues/18))
  * NoLogo ([#17](https://github.com/StartAutomating/RoughDraft/issues/17))

---

## 0.3.10:

* Fixing -Resize (Fixes [#179](https://github.com/StartAutomating/RoughDraft/issues/179))
* Explaining Expressions
  * AudioExpression Documentation Improved (Fixes [#180](https://github.com/StartAutomating/RoughDraft/issues/180))
  * Scale Documentation Improved (Fixes [#181](https://github.com/StartAutomating/RoughDraft/issues/181))

---

## 0.3.9:

* New Extensions:
  * ColorExpression ( Fixes [#172](https://github.com/StartAutomating/RoughDraft/issues/172) )
  * MixVideo ( Fixes [#171](https://github.com/StartAutomating/RoughDraft/issues/171) )
* Extension Updates:
  * BlendFrame now supports by Join-Media (Fixes [#173](https://github.com/StartAutomating/RoughDraft/issues/173))
* All Valid -Media Commands now support -FFMpegArgument (Fixes [#75](https://github.com/StartAutomating/RoughDraft/issues/75))
* Better Jobs Support
  * Join-Media and New-Media now support -AsJob (Fixes [#174](https://github.com/StartAutomating/RoughDraft/issues/174))
  * Job commands now support -ThrottleLimit (Fixes [#175](https://github.com/StartAutomating/RoughDraft/issues/175))

---

## 0.3.8:

* New Extensions:
  * AudioFrequencyExpression (Fixes [#158](https://github.com/StartAutomating/RoughDraft/issues/158))
  * Erosion (Fixes [#165](https://github.com/StartAutomating/RoughDraft/issues/165))
  * FiniteEqualizer (Fixes [#164](https://github.com/StartAutomating/RoughDraft/issues/164))
  * Scale (Fixes [#162](https://github.com/StartAutomating/RoughDraft/issues/162))
  * Temp (Fixes [#161](https://github.com/StartAutomating/RoughDraft/issues/161))
  * PitchFactor (Fixes [#157](https://github.com/StartAutomating/RoughDraft/issues/157))
  * ZoomPan (Fixes [#159](https://github.com/StartAutomating/RoughDraft/issues/159))

---
  
## 0.3.7:
* New Extensions:
  * AudioCrusher (Fixes [#148](https://github.com/StartAutomating/RoughDraft/issues/148))
  * Chorus (Fixes [#20](https://github.com/StartAutomating/RoughDraft/issues/20))
  * Convolve (Fixes [#150](https://github.com/StartAutomating/RoughDraft/issues/150))
  * Deconvolve (Fixes [#151](https://github.com/StartAutomating/RoughDraft/issues/151))
  * Hysteresis (Fixes [#147](https://github.com/StartAutomating/RoughDraft/issues/147))
  * MixAudio (Fixes [#16](https://github.com/StartAutomating/RoughDraft/issues/16))
  * Overlay (Fixes [#145](https://github.com/StartAutomating/RoughDraft/issues/145))
  * ShowFrequency (Fixes [#146](https://github.com/StartAutomating/RoughDraft/issues/146))
* Join-Media now has -ThreadCount, -Preset, -Tune, and -FFMpegArgument (re [#75](https://github.com/StartAutomating/RoughDraft/issues/75), [#140](https://github.com/StartAutomating/RoughDraft/issues/140), [#82](https://github.com/StartAutomating/RoughDraft/issues/82))
* ffmpeg, ffprobe, and ffplay are now aliased (Fixes [#80](https://github.com/StartAutomating/RoughDraft/issues/80))
* Extension Improvements:
  * YouTubeDL Extension (Fixes [#134](https://github.com/StartAutomating/RoughDraft/issues/134))
* Fixing Use-FFProbe (Fixes [#144](https://github.com/StartAutomating/RoughDraft/issues/144))
* Removed ConvertTo-Waveform (Fixes [#50](https://github.com/StartAutomating/RoughDraft/issues/50))

---

## 0.3.6:
* Adding Visualization Extensions:
  * ShowSpectrum
  * ShowWaveform
  * ShowScale
  * ShowVectorShow
  * ShowVolume
* Adding SuperEqualizer Extension

---


## 0.3.5:
* New Extensions:
  * AudioExpression!!! (Fixes [#22](https://github.com/StartAutomating/RoughDraft/issues/22))
  * BilateralSmooth (Fixes [#117](https://github.com/StartAutomating/RoughDraft/issues/117))
  * Colorize (Fixes [#120](https://github.com/StartAutomating/RoughDraft/issues/120))
  * FillBorder (Fixes [#105](https://github.com/StartAutomating/RoughDraft/issues/105))
  * FrameStep (Fixes [#113](https://github.com/StartAutomating/RoughDraft/issues/113))
  * Pulsator (Fixes [#104](https://github.com/StartAutomating/RoughDraft/issues/104))  
  * SubFrequencyCut (Fixes [#123](https://github.com/StartAutomating/RoughDraft/issues/123))
  * SuperFrequencyCut (Fixes [#124](https://github.com/StartAutomating/RoughDraft/issues/124))  
  * VideoExpression!!! (Fixes [#116](https://github.com/StartAutomating/RoughDraft/issues/116))  
* -Media commands now use Use-FFMpeg (Fixes [#106](https://github.com/StartAutomating/RoughDraft/issues/106))
* Use-FFMpeg:  Improved error handling (Fixes [#108](https://github.com/StartAutomating/RoughDraft/issues/108))
* Show-Media:
  * InputPath is now optional (Fixes [#107](https://github.com/StartAutomating/RoughDraft/issues/107))
  * Allowing multiple audio filters (Fixes [#109](https://github.com/StartAutomating/RoughDraft/issues/109))
* Auto-generating docs (Fixes [#122](https://github.com/StartAutomating/RoughDraft/issues/122))

---

## 0.3.4:
* Adding Flanger Extension ([#100](https://github.com/StartAutomating/RoughDraft/issues/100))
* Show-Media:
  * Fixing looping behavior ([#102](https://github.com/StartAutomating/RoughDraft/issues/102))
  * Enabling filters on inputfiles ([#101](https://github.com/StartAutomating/RoughDraft/issues/101))
* Get-RoughDraftExtension:  Updating Piecemeal Version
* Join-Media:  Fixing multidirectory issue ([#99](https://github.com/StartAutomating/RoughDraft/issues/99))
* Edit-Media:  Attempting to fix Progress Issues ([#85](https://github.com/StartAutomating/RoughDraft/issues/85))
* Fixing Rate Extension ([#98](https://github.com/StartAutomating/RoughDraft/issues/98))
* Get-Media:  Fixing [#97](https://github.com/StartAutomating/RoughDraft/issues/97) (allowing data streams that have no codec)

---
        
## 0.3.3:
* New Extensions:
  * Adding Exposure Extension ([#87](https://github.com/StartAutomating/RoughDraft/issues/87))      
  * Adding FlipVertical Extension ([#91](https://github.com/StartAutomating/RoughDraft/issues/91))
  * Adding FlipHorizontal Extension ([#90](https://github.com/StartAutomating/RoughDraft/issues/90))
  * Adding LimitPixel Extension ([#93](https://github.com/StartAutomating/RoughDraft/issues/93))
  * Adding TimeMix Extension ([#95](https://github.com/StartAutomating/RoughDraft/issues/95))
* Adding RoughDraft.HelpOut.ps1
* Updating RoughDraft Action:
  * Fixing [#88](https://github.com/StartAutomating/RoughDraft/issues/88). 
  * Adding -FFMpegInstallArgument ([#89](https://github.com/StartAutomating/RoughDraft/issues/89))
* Adding additional extension examples, fixing help
* Making various extensions apply to Show-Media

---

## 0.3.2:
* Updating RoughDraft Tests (adding test for image->video, re [#83](https://github.com/StartAutomating/RoughDraft/issues/83))
* Convert-Media:  Adding .EXAMPLE for Image Conversion ([#83](https://github.com/StartAutomating/RoughDraft/issues/83))
* Adding ColorScope Extension ([#79](https://github.com/StartAutomating/RoughDraft/issues/79))
* Show-Media:  Fixing output errors ([#76](https://github.com/StartAutomating/RoughDraft/issues/76))
* Updating Subtitler Extension (removing -OutputPath)
* Convert-Media:  Implying -Loop when -Duration is greater than input duration ([#81](https://github.com/StartAutomating/RoughDraft/issues/81))
* Edit-Media:  Support for -Tune and -Preset ([#82](https://github.com/StartAutomating/RoughDraft/issues/82))
* Convert-Media:  Support for -Tune and -Preset ([#82](https://github.com/StartAutomating/RoughDraft/issues/82))
* Get-RoughDraftExtension:  Updating Piecemeal Version [0.2.1]

---

## 0.3.1:
* Adding Subtitler Extension ([#73](https://github.com/StartAutomating/RoughDraft/issues/73))
* Show-Media:  Safeguarding progress output (Fixing [#76](https://github.com/StartAutomating/RoughDraft/issues/76))
* Edit-Media:  -Codec is no longer positionally bound.
* Simplifying Resize Extension
* Convert/Edit-Media:  Support for -FFMpegArgument ([#75](https://github.com/StartAutomating/RoughDraft/issues/75))
* Edit-Media:  Adding -Force (fixing [#77](https://github.com/StartAutomating/RoughDraft/issues/77))
* Convert/Edit-Media:  Support for -Duration ([#74](https://github.com/StartAutomating/RoughDraft/issues/74))
* Adding DrawSubtitle Extension ([#72](https://github.com/StartAutomating/RoughDraft/issues/72))

---

## 0.3:
* Adding LagFun Extension ([#69](https://github.com/StartAutomating/RoughDraft/issues/69))
* Get-Media:  Returning at the beginning of end if -AsJob was passed
* Adding ColorContrast Extension ([#68](https://github.com/StartAutomating/RoughDraft/issues/68))
* Adding ColorHold Extension ([#67](https://github.com/StartAutomating/RoughDraft/issues/67))
* MedianPixel extension:  Support for -MedianPixelTimeBlend
* Adding Vibrato Extension ([#65](https://github.com/StartAutomating/RoughDraft/issues/65))
* Adding Tremolo Extension ([#64](https://github.com/StartAutomating/RoughDraft/issues/64))
* Adding Blur Extension ([#63](https://github.com/StartAutomating/RoughDraft/issues/63)).  Adding Histogram Extension ([#62](https://github.com/StartAutomating/RoughDraft/issues/62))
* Edit-Media:  Adding Logging to Avoid Reprocessing ([#49](https://github.com/StartAutomating/RoughDraft/issues/49))

---

## 0.2.9:
* Adding AmplifyPixel Extension ([#61](https://github.com/StartAutomating/RoughDraft/issues/61))
* Adding MedianPixel Extension ([#59](https://github.com/StartAutomating/RoughDraft/issues/59))
* Updating GitHub Jobs/Steps Defintions
* Adding Hue Extension ([#58](https://github.com/StartAutomating/RoughDraft/issues/58))
* Get-RoughDraftExtension:  Upgrading Piecemeal [0.1.9]
* CropDetect Extension:  Returning timeframe of crop intervals, making more pipeline friendly.
* Adding Tile Extension ([#54](https://github.com/StartAutomating/RoughDraft/issues/54))
* Adding Skew Extension ([#57](https://github.com/StartAutomating/RoughDraft/issues/57))
* Adding Crop Extension ([#46](https://github.com/StartAutomating/RoughDraft/issues/46))
* Rotate Extension:  Adding -OutputWidth and -OutputHeight.  Enabling Show-Media ([#56](https://github.com/StartAutomating/RoughDraft/issues/56))
* Show-Media:  Allowing for filtering ([#56](https://github.com/StartAutomating/RoughDraft/issues/56))
* Join-Media:  Quoting input Files
* Get-Media:  No longer collecting files if an extension could be run
* Adding BlendVideo Extension ([#51](https://github.com/StartAutomating/RoughDraft/issues/51))
* Adding YouTubeDL Extension ([#42](https://github.com/StartAutomating/RoughDraft/issues/42))
* Adding RandomizeFrame extension ([#52](https://github.com/StartAutomating/RoughDraft/issues/52))
* Adding EdgeDetect Extension ([#53](https://github.com/StartAutomating/RoughDraft/issues/53))
* Rotate extension:  Allowing arbitrary rotation ([#47](https://github.com/StartAutomating/RoughDraft/issues/47))
* Adding BlendFrame Extension ([#48](https://github.com/StartAutomating/RoughDraft/issues/48))
* Adding Mirror Extension ([#35](https://github.com/StartAutomating/RoughDraft/issues/35))
* AudioGain Extension: Fixing [#55](https://github.com/StartAutomating/RoughDraft/issues/55)
* Updating Action Source
* Updating DirectShow extension:  Extending Send-Media
* Updating VideoForLinux extension:  Extending Send-Media

---

## 0.2.8:
* New Extensions:
  * Adding ListProtocols Extension ([#38](https://github.com/StartAutomating/RoughDraft/issues/38))
  * Initial FrameBuffer Extension ([#40](https://github.com/StartAutomating/RoughDraft/issues/40))

* Fixes:
  * Fixing video4Linux Extension ([#34](https://github.com/StartAutomating/RoughDraft/issues/34))
  * CaptureDevice extension fix for Core ([#44](https://github.com/StartAutomating/RoughDraft/issues/44))

* Command Changes:
  * Receive-Media now supports -PixelFormat/-FrameRate/-FrameCount ([#41](https://github.com/StartAutomating/RoughDraft/issues/41))
  * Show-Media now supports -Loop/-LoopCount, and autoloops a single image ([#43](https://github.com/StartAutomating/RoughDraft/issues/43))

---

## 0.2.7:
* New Extensions:
  * DirectShow ([#33](https://github.com/StartAutomating/RoughDraft/issues/33))
  * VideoForLinux ([#34](https://github.com/StartAutomating/RoughDraft/issues/34))
* New Commands:
  * Send-Media ([#9](https://github.com/StartAutomating/RoughDraft/issues/9))
  * Recieve-Media ([#10](https://github.com/StartAutomating/RoughDraft/issues/10))
* Bugfixes:
  * Get-FFMpeg -ListCaptureDevice no longer enumerates vfwcap on Windows, because it is depracated ([#36](https://github.com/StartAutomating/RoughDraft/issues/36))

---

## 0.2.6
* New Extensions:
  * Pixelate ([#28](https://github.com/StartAutomating/RoughDraft/issues/28))
  * AlbumArt ([#31](https://github.com/StartAutomating/RoughDraft/issues/31))
* Set-Media is now extensible ([#31](https://github.com/StartAutomating/RoughDraft/issues/31))
* Get-Media is more stable ([#29](https://github.com/StartAutomating/RoughDraft/issues/29))

---

## 0.2.5
* New Extensions
  * ShuffleFrames ([#23](https://github.com/StartAutomating/RoughDraft/issues/23))
  * Echo ([#21](https://github.com/StartAutomating/RoughDraft/issues/21))
* Switched Extension Engine to [Piecemeal](https://github.com/StartAutomating/Piecemeal)
* Convert-Media now supports -AudioQuality/-VideoQuality (fixing [#24](https://github.com/StartAutomating/RoughDraft/issues/24))
* Edit-Media now allows for filters to be combined ([#26](https://github.com/StartAutomating/RoughDraft/issues/26))
* Updating Action (simplifying push)

---

## 0.2.4
* New Command: Split-Media
* New Extension: NoAudio (for Split-Media)
---
## 0.2.3:
* New command: Show-Media ([#8](https://github.com/StartAutomating/RoughDraft/issues/8))
* Bugfix: Playlist extension no longer adds -Encoding ([#13](https://github.com/StartAutomating/RoughDraft/issues/13))
* New Extension:  Sierpinksi fractal ([#14](https://github.com/StartAutomating/RoughDraft/issues/14))

---

## 0.2.2:
* Enhancing support for Progress Bars (Fixing [#3](https://github.com/StartAutomating/RoughDraft/issues/3))
* Making Join-Media extensible (Fixing [#4](https://github.com/StartAutomating/RoughDraft/issues/4))
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

---

## 0.2:
Publishing code on GitHub
Refactoring module with an emphasis on extensibility
Added initial GitHub action
