
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






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|



---
#### **WatermarkX**

The X coordinate for the watermark.  
If the coordinate is positive, then it will be relative to the top.  
If the coordinate is negative, it will be relative to the bottom.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **WatermarkY**

The Y coordinate for the watermark
If the coordinate is positive, then it will be relative to the top.  
If the coordinate is negative, it will be relative to the bottom.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **CenterWatermark**

If set, will put the watermark at the center of the video.  X and Y will be ignored






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/Watermark.RoughDraft.ext.ps1 [-WatermarkPath] <String> [[-WatermarkX] <Int32>] [[-WatermarkY] <Int32>] [-CenterWatermark] [<CommonParameters>]
```
---




