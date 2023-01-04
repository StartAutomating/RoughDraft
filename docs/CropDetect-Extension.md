
Extension/CropDetect.RoughDraft.ext.ps1
---------------------------------------
### Synopsis
Auto-detect the crop size.

---
### Description

Detects silence in an audio stream, using the cropdetect filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#cropdetect](https://ffmpeg.org/ffmpeg-filters.html#cropdetect)



---
### Parameters
#### **CropDetect**

If set, will find cropping information within a video.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **CropDetectLimit**

Set higher black value threshold, which can be optionally specified from nothing (0) to everything (255 for 8-bit based formats). 
An intensity value greater to the set value is considered non-black. 
It defaults to 24. 
You can also specify a value between 0.0 and 1.0 which will be scaled depending on the bitdepth of the pixel format.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **CropDetectRound**

The value which the width/height should be divisible by. It defaults to 16. 
The offset is automatically adjusted to center the video. Use 2 to get only even dimensions (needed for 4:2:2 video). 
16 is best when encoding to most video codecs.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **CropDetectSkip**

Set the number of initial frames for which evaluation is skipped. Default is 2. Range is 0 to INT_MAX.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **CropDetectReset**

Set the counter that determines after how many frames cropdetect will reset the previously detected largest video area and 
start over to detect the current optimal crop area. Default value is 0.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/CropDetect.RoughDraft.ext.ps1 -CropDetect [[-CropDetectLimit] <String>] [[-CropDetectRound] <String>] [[-CropDetectSkip] <Int32>] [[-CropDetectReset] <Int32>] [<CommonParameters>]
```
---




