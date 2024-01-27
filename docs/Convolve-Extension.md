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

#### **ConvolvePlanes**
set planes to convolve

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |1       |false        |convolve_planes|

#### **ConvolveImpulse**
when to process impulses

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |convolve_impulse|

#### **ConvolveNoise**
set noise

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Single]`|false   |2       |false        |convolve_noise|

---

### Syntax
```PowerShell
Extension/Convolve.RoughDraft.Extension.ps1 -Convolve [[-ConvolvePlanes] <Int32>] [-ConvolveImpulse] [[-ConvolveNoise] <Single>] [<CommonParameters>]
```
