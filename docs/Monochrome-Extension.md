
Extension/Monochrome.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Make video monochrome

---
### Description

Make video monochrome, using the monochrome filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#monochrome](https://ffmpeg.org/ffmpeg-filters.html#monochrome)



---
### Parameters
#### **Monochrome**

> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **MonochromeChromaBlueSpot**

Set the chroma blue spot. Allowed range is from -1 to 1. Default value is 0.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **MonochromeChromaRedSpot**

Set the chroma red spot. Allowed range is from -1 to 1. Default value is 0.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **MonochromeColorFilterSize**

Set the color filter size. Allowed range is from .1 to 10. Default value is 1.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **MonochromeHighlightStrength**

Set the highlights strength. Allowed range is from 0 to 1. Default value is 0.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Monochrome.RoughDraft.Extension.ps1 -Monochrome [[-MonochromeChromaBlueSpot] <Double>] [[-MonochromeChromaRedSpot] <Double>] [[-MonochromeColorFilterSize] <Double>] [[-MonochromeHighlightStrength] <Double>] [<CommonParameters>]
```
---



