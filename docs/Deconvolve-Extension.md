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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **DeconvolvePlanes**
set planes to deconvolve

|Type     |Required|Position|PipelineInput|Aliases          |
|---------|--------|--------|-------------|-----------------|
|`[Int32]`|false   |1       |false        |deconvolve_planes|

#### **DeconvolveImpulse**
when to process impulses

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |deconvolve_impulse|

#### **DeconvolveNoise**
set noise

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Single]`|false   |2       |false        |deconvolve_noise|

---

### Syntax
```PowerShell
Extension/Deconvolve.RoughDraft.Extension.ps1 -Deconvolve [[-DeconvolvePlanes] <Int32>] [-DeconvolveImpulse] [[-DeconvolveNoise] <Single>] [<CommonParameters>]
```
