
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ConvolvePlanes**

set planes to convolve






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **ConvolveImpulse**

when to process impulses






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ConvolveNoise**

set noise






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/Convolve.RoughDraft.Extension.ps1 -Convolve [[-ConvolvePlanes] <Int32>] [-ConvolveImpulse] [[-ConvolveNoise] <Single>] [<CommonParameters>]
```
---




