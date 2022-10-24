
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

The Border Width.  This value will be used for both left and right.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **FillBorderHeight**

The Border Height.  This value will be used for both top and bottom.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **FillBorderLeft**

The Border Left Coordinate.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **FillBorderRight**

The Border Right Coordinate.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **FillBorderTop**

The Border Top Coordinate.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **FillBorderBottom**

The Border Bottom Coordinate.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **FillBorderMode**

The Border Fill mode Coordinate.



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

The color used to fill the border.



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




