
Extension/Erosion.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
Erode Video

---
### Description

Apply erosion effect to the video.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#erosion](https://ffmpeg.org/ffmpeg-filters.html#erosion)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp4 -Erosion
```

---
### Parameters
#### **Erosion**

If set, apply Apply bilateral filter, spatial smoothing while preserving edges






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ErosionThreshold**

Limit the maximum change for each plane, default is 65535. If 0, plane will remain unchanged.






|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |1       |false        |



---
#### **ErosionCoordinate**

Set sigma of gaussian function to calculate range weight. Allowed range is 0 to 1. Default is 0.1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/Erosion.RoughDraft.Extension.ps1 -Erosion [[-ErosionThreshold] <Int32[]>] [[-ErosionCoordinate] <String>] [<CommonParameters>]
```
---




