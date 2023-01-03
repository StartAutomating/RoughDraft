
Extension/Skew.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Skew Extension

---
### Description

Skews video, using the shear filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#shear](https://ffmpeg.org/ffmpeg-filters.html#shear)



---
### Parameters
#### **Skew**

If set, will skew video



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **SkewX**

Skew factor in X-direction. Default value is 0. Allowed range is from -2 to 2.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **SkewY**

Skew factor in Y-direction. Default value is 0. Allowed range is from -2 to 2.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **SkewFillColor**

Set the color used to fill the output area not covered by the transformed video.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **SkewInteropolation**

Set interpolation type.  Default is 'bilinear'



Valid Values:

* bilinear
* nearest



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Skew.RoughDraft.Extension.ps1 -Skew [[-SkewX] <Single>] [[-SkewY] <Single>] [[-SkewFillColor] <String>] [[-SkewInteropolation] <String>] [<CommonParameters>]
```
---




