
Extension/Vibrato.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
Vibrato effect

---
### Description

Sinusoidal phase modulation.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#vibrato](https://ffmpeg.org/ffmpeg-filters.html#vibrato)



---
### Parameters
#### **Vibrato**

If set, will use the vibrato effect






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **VibratoFrequency**

Modulation frequency in Hertz. Range is 0.1 - 20000.0. Default value is 5.0 Hz.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
#### **VibratoDepth**

Depth of modulation as a percentage. Range is 0.0 - 1.0. Default value is 0.5.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/Vibrato.RoughDraft.Extension.ps1 -Vibrato [[-VibratoFrequency] <Single>] [[-VibratoDepth] <Single>] [<CommonParameters>]
```
---




