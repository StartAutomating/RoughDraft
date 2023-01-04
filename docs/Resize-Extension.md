
Extension/Resize.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
Simple video resize.

---
### Description

Simply resizes a video using the scale filter.

To control scaling with more precision, use the Scale extension.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#scale-1](https://ffmpeg.org/ffmpeg-filters.html#scale-1)



---
### Examples
#### EXAMPLE 1
```PowerShell
Convert-Media
```

---
### Parameters
#### **Resize**

The width and height used to resize the video.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Resize.RoughDraft.Extension.ps1 [-Resize] <String> [<CommonParameters>]
```
---




