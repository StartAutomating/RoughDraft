
Extension/LimitPixel.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Limits Pixel values

---
### Description

Limits the pixel components values to the specified range [min, max].

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#limiter](https://ffmpeg.org/ffmpeg-filters.html#limiter)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\TestSource.gif -LimitPixel -LimitPixelMin 50 -LimitPixelMax 200
```

---
### Parameters
#### **LimitPixel**

If set, will limit pixels between a range of values.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **LimitPixelMin**

Lower bound. Defaults to the lowest allowed value for the input.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **LimitPixelMax**

Upper bound. Defaults to the highest allowed value for the input.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **LimitPixelPlane**

Specify which planes will be processed. Defaults to all available.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/LimitPixel.RoughDraft.Extension.ps1 -LimitPixel [[-LimitPixelMin] <String>] [[-LimitPixelMax] <String>] [[-LimitPixelPlane] <String>] [<CommonParameters>]
```
---



