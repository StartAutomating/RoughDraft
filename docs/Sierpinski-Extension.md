
Extension/Sierpinski.rd.ext.ps1
-------------------------------
### Synopsis
Generates a Sierpinski fractal

---
### Description

Generates a Sierpinski fractal, using the sierpinski filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#sierpinski

It's an extension](https://ffmpeg.org/ffmpeg-filters.html#sierpinski

It's an extension)



* [https://ffmpeg.org/ffmpeg-filters.html#sierpinski

It's an extension](https://ffmpeg.org/ffmpeg-filters.html#sierpinski

It's an extension.md)



---
### Parameters
#### **Sierpinski**

If set, will generate a Sierpinksi fractal



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **SierpinksiSeed**

Set seed which is used for random panning



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **SierpinksiJump**

Set max jump for single pan destination. Allowed range is from 1 to 10000.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **SierpinksiType**

Set fractal type, can be default carpet or triangle



Valid Values:

* carpet
* triangle



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Sierpinski.rd.ext.ps1 -Sierpinski [[-SierpinksiSeed] <Int32>] [[-SierpinksiJump] <Double>] [[-SierpinksiType] <String>] [<CommonParameters>]
```
---



