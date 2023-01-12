
Extension/Crop.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Crop Extension

---
### Description

Crops Video, using the ffmpeg crop filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#crop](https://ffmpeg.org/ffmpeg-filters.html#crop)



---
### Parameters
#### **CropVideo**

If set, will crop video






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **CropWidth**

The crop width






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **CropHeight**

The crop height






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **CropTop**

The crop top coordinate






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **CropLeft**

The crop left coordinate






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **CropExpression**

A crop expression, consisting of width/height/left/top.  This value is returned from CropDetect






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|



---
#### **ExactCrop**

If set, subsampled videos will be cropped at exact width/height/x/y as specified and will not be rounded to nearest smaller value.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **KeepAspectRatio**

If set, will keep the aspect ratio.  Defaults to false.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/Crop.RoughDraft.Extension.ps1 -CropVideo [[-CropWidth] <String>] [[-CropHeight] <String>] [[-CropTop] <String>] [[-CropLeft] <String>] [[-CropExpression] <String>] [-ExactCrop] [-KeepAspectRatio] [<CommonParameters>]
```
---




