
Extension/Watermark.RoughDraft.ext.ps1
--------------------------------------
### Synopsis
Watermarks a video

---
### Description

Watermarks a video, using the overlay filter.

---
### Parameters
#### **WatermarkPath**

The path to the watermark file.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **WatermarkX**

The X coordinate for the watermark.  
If the coordinate is positive, then it will be relative to the top.  
If the coordinate is negative, it will be relative to the bottom.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **WatermarkY**

The Y coordinate for the watermark
If the coordinate is positive, then it will be relative to the top.  
If the coordinate is negative, it will be relative to the bottom.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **CenterWatermark**

If set, will put the watermark at the center of the video.  X and Y will be ignored



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Watermark.RoughDraft.ext.ps1 [-WatermarkPath] <String> [[-WatermarkX] <Int32>] [[-WatermarkY] <Int32>] [-CenterWatermark] [<CommonParameters>]
```
---




