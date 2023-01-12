
Extension/Tremolo.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
Tremolo effect

---
### Description

Sinusoidal phase modulation.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#tremolo](https://ffmpeg.org/ffmpeg-filters.html#tremolo)



---
### Parameters
#### **Tremolo**

If set, will use the Tremolo effect






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **TremoloFrequency**

Modulation frequency in Hertz. Range is 0.1 - 20000.0. Default value is 5.0 Hz.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
#### **TremoloDepth**

Depth of modulation as a percentage. Range is 0.0 - 1.0. Default value is 0.5.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/Tremolo.RoughDraft.Extension.ps1 -Tremolo [[-TremoloFrequency] <Single>] [[-TremoloDepth] <Single>] [<CommonParameters>]
```
---




