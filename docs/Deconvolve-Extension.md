
Extension/Deconvolve.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
deconvolve

---
### Description

Deconvolve first video stream with second video stream.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#deconvolve](https://ffmpeg.org/ffmpeg-filters.html#deconvolve)



---
### Parameters
#### **Deconvolve**

Deconvolve first video stream with second video stream.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **DeconvolvePlanes**

set planes to deconvolve



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **DeconvolveImpulse**

when to process impulses



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **DeconvolveNoise**

set noise



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Deconvolve.RoughDraft.Extension.ps1 -Deconvolve [[-DeconvolvePlanes] <Int32>] [-DeconvolveImpulse] [[-DeconvolveNoise] <Single>] [<CommonParameters>]
```
---




