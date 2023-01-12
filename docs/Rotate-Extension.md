
Extension/Rotate.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
Rotates a video

---
### Description

Applies the rotate filter to rotate a video.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#rotate](https://ffmpeg.org/ffmpeg-filters.html#rotate)



* [https://ffmpeg.org/ffmpeg-filters.html#transpose-1](https://ffmpeg.org/ffmpeg-filters.html#transpose-1)



---
### Parameters
#### **Rotate**

If provided, the video file will be rotated






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |



---
#### **RotateFillColor**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **OutputWidth**

The Output Width






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **OutputHeight**

The Output Height






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/Rotate.RoughDraft.Extension.ps1 [-Rotate] <String> [[-RotateFillColor] <String>] [[-OutputWidth] <String>] [[-OutputHeight] <String>] [<CommonParameters>]
```
---




