
Extension/PitchFactor.RoughDraft.Extension.ps1
----------------------------------------------
### Synopsis
Adjust Pitch by a factor

---
### Description

Adjust audit pitch by a factor.

This is done by:
* Resampling the audio
* Resetting the sample rate
* Adjusting the tempo.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#asetrate](https://ffmpeg.org/ffmpeg-filters.html#asetrate)



* [https://ffmpeg.org/ffmpeg-filters.html#aresample](https://ffmpeg.org/ffmpeg-filters.html#aresample)



* [https://ffmpeg.org/ffmpeg-filters.html#atempo](https://ffmpeg.org/ffmpeg-filters.html#atempo)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp3 -PitchFactor 1.25 # Adjust pitch by 125% (making audio more high pitched)
```

#### EXAMPLE 2
```PowerShell
Edit-Media -InputPath .\a.mp3 -PitchFactor 0.9 # Adjust pitch by 90% (making audio lower pitched)
```

---
### Parameters
#### **PitchFactor**

The Pitch Factor.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|true    |1       |false        |



---
#### **PitchFactorSampleRate**

The pitch factor sample rate.
When using Edit-Media, this will be automatically be detected from the first audio stream.
When using Show-Media, this defaults to 44100






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/PitchFactor.RoughDraft.Extension.ps1 [-PitchFactor] <Double> [[-PitchFactorSampleRate] <Int32>] [<CommonParameters>]
```
---




