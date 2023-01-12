
Extension/BlackDetect.RoughDraft.Extension.ps1
----------------------------------------------
### Synopsis
Detect black periods in a video.

---
### Description

Detects black periods within a video, using the blackdetect filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#blackdetect](https://ffmpeg.org/ffmpeg-filters.html#blackdetect)



---
### Parameters
#### **BlackDetect**

If set, will find black within a video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **BlackDetectDuration**

The duration of darkness this is considered black.  By default, a half second.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |1       |false        |



---
#### **BlackDetectThreshold**

The perctange of the screen blackness that constitutes a cut.  By default, 15%.
Due to encoding and equipment, very few fades to black are actually truly black.
They are often very dark grey instead.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/BlackDetect.RoughDraft.Extension.ps1 -BlackDetect [[-BlackDetectDuration] <TimeSpan>] [[-BlackDetectThreshold] <Double>] [<CommonParameters>]
```
---




