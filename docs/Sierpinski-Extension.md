
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **SierpinksiSeed**

Set seed which is used for random panning






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **SierpinksiJump**

Set max jump for single pan destination. Allowed range is from 1 to 10000.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **SierpinksiType**

Set fractal type, can be default carpet or triangle



Valid Values:

* carpet
* triangle






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
### Syntax
```PowerShell
Extension/Sierpinski.rd.ext.ps1 -Sierpinski [[-SierpinksiSeed] <Int32>] [[-SierpinksiJump] <Double>] [[-SierpinksiType] <String>] [<CommonParameters>]
```
---




