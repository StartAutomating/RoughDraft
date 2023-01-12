
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **EdgeLowThreshold**

The low threshold.  By default, ~0.86






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
#### **EdgeHighThreshold**

The high threshold.  By default ~.196






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
#### **EdgeDetectMode**

The edge detection mode.  By default, wires.



Valid Values:

* wires
* colormix
* canny






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
### Syntax
```PowerShell
Extension/EdgeDetect.RoughDraft.Extension.ps1 -EdgeDetect [[-EdgeLowThreshold] <Single>] [[-EdgeHighThreshold] <Single>] [[-EdgeDetectMode] <String>] [<CommonParameters>]
```
---




