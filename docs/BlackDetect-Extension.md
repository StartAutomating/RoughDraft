
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **BlackDetectDuration**

The duration of darkness this is considered black.  By default, a half second.



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **BlackDetectThreshold**

The perctange of the screen blackness that constitutes a cut.  By default, 15%.
Due to encoding and equipment, very few fades to black are actually truly black.
They are often very dark grey instead.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/BlackDetect.RoughDraft.Extension.ps1 -BlackDetect [[-BlackDetectDuration] <TimeSpan>] [[-BlackDetectThreshold] <Double>] [<CommonParameters>]
```
---




