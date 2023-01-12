
Extension/AudioGain.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
Increases audio volume

---
### Description

Increases audio volume, using the volume filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#volume](https://ffmpeg.org/ffmpeg-filters.html#volume)



---
### Parameters
#### **AudioGain**

The audio gain, either in decibals (i.e. 12db) or as a ratio (i.e. 1.5)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |



---
### Syntax
```PowerShell
Extension/AudioGain.RoughDraft.Extension.ps1 [-AudioGain] <String> [<CommonParameters>]
```
---




