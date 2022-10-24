
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **CropWidth**

The crop width



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **CropHeight**

The crop height



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **CropTop**

The crop top coordinate



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **CropLeft**

The crop left coordinate



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **CropExpression**

A crop expression, consisting of width/height/left/top.  This value is returned from CropDetect



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:true (ByPropertyName)



---
#### **ExactCrop**

If set, subsampled videos will be cropped at exact width/height/x/y as specified and will not be rounded to nearest smaller value.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **KeepAspectRatio**

If set, will keep the aspect ratio.  Defaults to false.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Crop.RoughDraft.Extension.ps1 -CropVideo [[-CropWidth] <String>] [[-CropHeight] <String>] [[-CropTop] <String>] [[-CropLeft] <String>] [[-CropExpression] <String>] [-ExactCrop] [-KeepAspectRatio] [<CommonParameters>]
```
---



