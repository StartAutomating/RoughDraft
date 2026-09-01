# RoughDraft CHANGELOG

> Like It? [Star It](https://github.com/StartAutomating/RoughDraft)
> Love It? [Support It](https://github.com/sponsors/StartAutomating)

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

## RoughDraft 0.4.3

* Fixing Rate Extension (#327)
* Adding -TargetTime to Rate extension (#328)
* Adding RGBAShift Extension (#329)

---

## RoughDraft 0.4.2

* Improvements to Media Downloader (#318)
  * Now outputting the file
  * Renaming -YouTubeUrl to -MediaUrl (keeping alias)
* New Extensions:
  * XBR (#319)
  * ColorCurves (#320)
  * Histogram Equalizer (#321)
  * SelectiveColor (#324)

---

## RoughDraft 0.4.1

* RoughDraft in Docker
  * Added Dockerfile ( #251 )
  * Publishing to https://ghcr.io/startautomating/roughdraft ( #252 )
    * `Container.init.ps1` initializes the container ( #277 )
    * `Container.start.ps1` is the entry point ( #278 )
    * `Container.stop.ps1` is the exit point ( #279 )
  * RoughDraft Docker on Kali ( #311 )

* Massive Metadata improvements!
  * Get-Media now stores Metadata within '.Metadata' ( #224 )
  * Media Formatting ( #30 )
  * Gettable / Settable properties on every `Get-Media` result:
    * RoughDraft.Media.AspectRatio ( #217 )
    * RoughDraft.Media.PixelFormat ( #218 )
    * RoughDraft.Media.Video/AudioBitrate ( #216, #219 )
    * RoughDraft.Media.FilePath/FileName ( #220, #221 )
    * RoughDraft.Media.get_MediaType ( #212 )
  * Media metadata can be set with script properties
    * RoughDraft.Media.get/set_Artist ( #249 )
    * RoughDraft.Media.get/set_Date ( #271 )
    * RoughDraft.Media.get/set_Year ( #248 )
    * RoughDraft.Media.get/set_Track ( #247 )
    * RoughDraft.Media.get/set_Synopsis ( #246 )
    * RoughDraft.Media.get/set_Subtitle ( #245 )
    * RoughDraft.Media.get/set_Publisher/Show ( #243, #244 )
    * RoughDraft.Media.get/set_Network/Producer ( #241, #242 )
    * RoughDraft.Media.get/set_Mood ( #240 )
    * RoughDraft.Media.get/set_Location ( Fixes #260 )
    * RoughDraft.Media.get/set_Lyric ( #239 )
    * RoughDraft.Media.get/set_InitialKey ( #238 )
    * RoughDraft.Media.get/set_Genre/Grouping ( #236, #237 )
    * RoughDraft.Media.get/set_EpisodeId ( #235 )
    * RoughDraft.Media.get/set_Disc ( #234 )
    * RoughDraft.Media.get/set_Description ( #233 )
    * RoughDraft.Media.get/set_CreationTime ( #232 )
    * RoughDraft.Media.get/set_Comment/Composer ( #229, #230 )
    * RoughDraft.Media.get/set_Copyright ( #231 )
    * RoughDraft.Media.get/set_Comment ( #229 )
    * RoughDraft.Media.get/set_BPM ( #228 )
    * RoughDraft.Media.get/set_Album/AlbumArtist ( #226, #227 )
    * RoughDraft.Media.get/set_Title ( #225 )

* Edit-Media -Offset ( #299 )
* Convert/Edit/New-Media -FrameCount (#303)

* New Commands:
  * Repair-Media ( #208 )
  * Mount-RoughDraft ( #288 )
  * Dismount-RoughDraft ( #289 )

* New Extensions:
  * ChromaHold ( #190 )
  * Crossfade (#18)
  * ExtractSubtitle (#186)
  * FixPlaylistPath ( #209 )
  * GdiGrab ( #313 )
  * GifPalette (#71)  
  * NoLogo (#17)
  * OffsetAudio ( #297 )
  * OffsetVideo ( #298 )
  * PseudoColor ( #305 )  
  * ShufflePixels ( #304 )
  * ShufflePlanes ( #306 )
  * SplitEqually ( #197 )  
  * SwapRect ( #191 )
  * Vibrance ( #192 )
  
* Fixes / Improvements
  * Fixing -VideoCodec (#189)
  * YouTube downloader
    * Swapping YouTube Downloader to `yt-dlp` ( #196 )
    * Adding additional options (#257)
  * Join-Media should not always transcode ( #195 )
  * Quoting Fixes
    * Set-Media quoting ( #222 )
    * Set-Media -AlbumArt quoting ( #255 )
    * Mirror Extension Overquoting ( #301 )
    * Pixelate Extension Overquoting ( #300 )
    * Rotate filter quoting fix ( #259 )
  * Get-Media -VolumeLevel ( #254 )
  * Edit-Media removing default -PixelFormat ( Fixes #302 )
  * Removing pixel format from visualizers ( #312 )
  * Workflow fixes
    * RoughDraft PublishTestResults workflow fix ( #310 )
  
* Module Features:
  * Mounting `RoughDraft:` ( #201 )
  * Exporting `$RoughDraft` ( #202 )
* Organization (#203, #204, #205, #206)
  * Moving Build definitions into /Build ( #204 )
  * Moving Functions into /Commands ( #205 )
  * Moving Formatting and Types into /Types (#206)
* Community Standards
  * Added `CODE_OF_CONDUCT.md` (#293)
  * Added `CONTRIBUTING.md` (#294)
  * Added `SECURITY.md` (#295)
* Action Improvements ( #282, #283, #284 )
  * RoughDraft action no longer uses set-output ( #281 )
  * RoughDraft action summarization ( #282 )
  * RoughDraft action refactored into internal functions ( #283 )
  * Using actorID in checkins (#284)
  * Supporting -InstallModule (#285)

---

## RoughDraft 0.4

* Enabled Sponsorship (please show your support) (#185)
* Audio Visualizations now force output of video (#176)
* ConvertTo-Gif is now an alias to Convert-Media (#71)
* Added GifPalette Extension (#71)
* Made Subtitle Extraction Easier (#186)
* New Extensions:
  * Crossfade (#18)
  * NoLogo (#17)

---

## RoughDraft 0.3.10

* Fixing -Resize (#179)
* Explaining Expressions
  * AudioExpression Documentation Improved (#180)
  * Scale Documentation Improved (#181)

---

## RoughDraft 0.3.9

* New Extensions:
  * ColorExpression ( #172 )
  * MixVideo ( #171 )
* Extension Updates:
  * BlendFrame now supports by Join-Media (#173)
* All Valid -Media Commands now support -FFMpegArgument (#75)
* Better Jobs Support
  * Join-Media and New-Media now support -AsJob (#174)
  * Job commands now support -ThrottleLimit (#175)

---

## RoughDraft 0.3.8

* New Extensions:
  * AudioFrequencyExpression (#158)
  * Erosion (#165)
  * FiniteEqualizer (#164)
  * Scale (#162)
  * Temp (#161)
  * PitchFactor (#157)
  * ZoomPan (#159)

---

## RoughDraft 0.3.7
* New Extensions:
  * AudioCrusher (#148)
  * Chorus (#20)
  * Convolve (#150)
  * Deconvolve (#151)
  * Hysteresis (#147)
  * MixAudio (#16)
  * Overlay (#145)
  * ShowFrequency (#146)
* Join-Media now has -ThreadCount, -Preset, -Tune, and -FFMpegArgument (re #75, #140, #82)
* ffmpeg, ffprobe, and ffplay are now aliased (#80)
* Extension Improvements:
  * YouTubeDL Extension (#134)
* Fixing Use-FFProbe (#144)
* Removed ConvertTo-Waveform (#50)

---

## RoughDraft 0.3.6

* Adding Visualization Extensions:
  * ShowSpectrum
  * ShowWaveform
  * ShowScale
  * ShowVectorShow
  * ShowVolume
* Adding SuperEqualizer Extension

---


## RoughDraft 0.3.5

* New Extensions:
  * AudioExpression!!! (#22)
  * BilateralSmooth (#117)
  * Colorize (#120)
  * FillBorder (#105)
  * FrameStep (#113)
  * Pulsator (#104)  
  * SubFrequencyCut (#123)
  * SuperFrequencyCut (#124)  
  * VideoExpression!!! (#116)  
* -Media commands now use Use-FFMpeg (#106)
* Use-FFMpeg:  Improved error handling (#108)
* Show-Media:
  * InputPath is now optional (#107)
  * Allowing multiple audio filters (#109)
* Auto-generating docs (#122)

---

## RoughDraft 0.3.4

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
        
## RoughDraft 0.3.3

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

## RoughDraft 0.3.2

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

## RoughDraft 0.3.1

* Adding Subtitler Extension (#73)
* Show-Media:  Safeguarding progress output (Fixing #76)
* Edit-Media:  -Codec is no longer positionally bound.
* Simplifying Resize Extension
* Convert/Edit-Media:  Support for -FFMpegArgument (#75)
* Edit-Media:  Adding -Force (fixing #77)
* Convert/Edit-Media:  Support for -Duration (#74)
* Adding DrawSubtitle Extension (#72)

---

## RoughDraft 0.3

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

## RoughDraft 0.2.9

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

## RoughDraft 0.2.8

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

## RoughDraft 0.2.7

* New Extensions:
  * DirectShow (#33)
  * VideoForLinux (#34)
* New Commands:
  * Send-Media (#9)
  * Recieve-Media (#10)
* Bugfixes:
  * Get-FFMpeg -ListCaptureDevice no longer enumerates vfwcap on Windows, because it is depracated (#36)

---

## RoughDraft 0.2.6
* New Extensions:
  * Pixelate (#28)
  * AlbumArt (#31)
* Set-Media is now extensible (#31)
* Get-Media is more stable (#29)

---

## RoughDraft 0.2.5
* New Extensions
  * ShuffleFrames (#23)
  * Echo (#21)
* Switched Extension Engine to [Piecemeal](https://github.com/StartAutomating/Piecemeal)
* Convert-Media now supports -AudioQuality/-VideoQuality (fixing #24)
* Edit-Media now allows for filters to be combined (#26)
* Updating Action (simplifying push)

---

## RoughDraft 0.2.4
* New Command: Split-Media
* New Extension: NoAudio (for Split-Media)

---

## RoughDraft 0.2.3
* New command: Show-Media (#8)
* Bugfix: Playlist extension no longer adds -Encoding (#13)
* New Extension:  Sierpinksi fractal (#14)

---

## RoughDraft 0.2.2

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

## RoughDraft 0.2.1

* Adding Mandelbrot Extension (for New-Media)
* Making Get-FFMpeg extensible
* Making -Codecs/-ListCaptureDevice extensions for Get-FFMpeg
* Adding ListFilters and FilterInput extensions for Get-FFMpeg
* Internal refactoring and minor bugfixes.

---

## RoughDraft 0.2

Publishing code on GitHub
Refactoring module with an emphasis on extensibility
Added initial GitHub action
