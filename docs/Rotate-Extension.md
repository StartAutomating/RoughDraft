
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



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
#### **RotateFillColor**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **OutputWidth**

The Output Width



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **OutputHeight**

The Output Height



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Rotate.RoughDraft.Extension.ps1 [-Rotate] <String> [[-RotateFillColor] <String>] [[-OutputWidth] <String>] [[-OutputHeight] <String>] [<CommonParameters>]
```
---




