
Extension/MedianPixel.RoughDraft.Extension.ps1
----------------------------------------------
### Synopsis
Picks median pixels

---
### Description

Pick median pixel from certain rectangle defined by radius.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#median](https://ffmpeg.org/ffmpeg-filters.html#median)



* [https://ffmpeg.org/ffmpeg-filters.html#tmedian](https://ffmpeg.org/ffmpeg-filters.html#tmedian)



---
### Parameters
#### **MedianPixel**

If set, will pick median pixels.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **MedianPixelTimeBlend**

If set, will pick median pixels from successive frames.  This will ignore -MediaPixelRadiusV.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **MedianPixelRadius**

Set horizontal radius size. Default value is 1. Allowed range is integer from 1 to 127.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **MedianPixelPlanes**

Set which planes to process. Default is 15, which is all available planes.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **MedianPixelRadiusV**

Set vertical radius size. Default value is 0. 
Allowed range is integer from 0 to 127. 
If it is 0, value will be picked from horizontal radius option.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **MedianPixelPercentile**

Set median percentile. 
Default value is 0.5.
Default value of 0.5  will pick always median values, 
while 0 will pick minimum values and 1 maximum values.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/MedianPixel.RoughDraft.Extension.ps1 -MedianPixel -MedianPixelTimeBlend [[-MedianPixelRadius] <Int32>] [[-MedianPixelPlanes] <String>] [[-MedianPixelRadiusV] <Int32>] [[-MedianPixelPercentile] <Double>] [<CommonParameters>]
```
---



