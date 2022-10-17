
Extension/FillBorder.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Fill Borders.

---
### Description

Fill Borders of a video.

Borders can be filled with a -FillBorderMode and a -FillBorderColor.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#fillborders](https://ffmpeg.org/ffmpeg-filters.html#fillborders)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "a.mp4" -FillBorder -FillBorderLeft 50 -FillBorderRight 50 -FillBorderTop 40 -FillBorderBottom 40 -FillBorderMode Reflect
```

---
### Parameters
#### **FillBorder**

If set, will fill borders.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **FillBorderWidth**

> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **FillBorderHeight**

> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **FillBorderLeft**

> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **FillBorderRight**

> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **FillBorderTop**

> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **FillBorderBottom**

> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **FillBorderMode**

Valid Values:

* smear
* mirror
* fixed
* reflect
* wrap
* fade
* margins



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **FillBorderColor**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/FillBorder.RoughDraft.Extension.ps1 -FillBorder [[-FillBorderWidth] <Int32>] [[-FillBorderHeight] <Int32>] [[-FillBorderLeft] <Int32>] [[-FillBorderRight] <Int32>] [[-FillBorderTop] <Int32>] [[-FillBorderBottom] <Int32>] [[-FillBorderMode] <String>] [[-FillBorderColor] <String>] [<CommonParameters>]
```
---




