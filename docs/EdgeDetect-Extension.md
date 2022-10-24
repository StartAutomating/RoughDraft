
Extension/EdgeDetect.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
EdgeDetect Extension

---
### Description

Uses the edgedetect filter to outline edges found in a video.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#edgedetect](https://ffmpeg.org/ffmpeg-filters.html#edgedetect)



---
### Parameters
#### **EdgeDetect**

If set, will detect edges



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **EdgeLowThreshold**

The low threshold.  By default, ~0.86



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **EdgeHighThreshold**

The high threshold.  By default ~.196



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **EdgeDetectMode**

The edge detection mode.  By default, wires.



Valid Values:

* wires
* colormix
* canny



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/EdgeDetect.RoughDraft.Extension.ps1 -EdgeDetect [[-EdgeLowThreshold] <Single>] [[-EdgeHighThreshold] <Single>] [[-EdgeDetectMode] <String>] [<CommonParameters>]
```
---



