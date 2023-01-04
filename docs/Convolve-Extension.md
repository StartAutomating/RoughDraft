
Extension/Convolve.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
convolve

---
### Description

Convolve first video stream with second video stream.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#convolve](https://ffmpeg.org/ffmpeg-filters.html#convolve)



---
### Parameters
#### **Convolve**

Convolve first video stream with second video stream.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ConvolvePlanes**

set planes to convolve



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ConvolveImpulse**

when to process impulses



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ConvolveNoise**

set noise



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Convolve.RoughDraft.Extension.ps1 -Convolve [[-ConvolvePlanes] <Int32>] [-ConvolveImpulse] [[-ConvolveNoise] <Single>] [<CommonParameters>]
```
---




