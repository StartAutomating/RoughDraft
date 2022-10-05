
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **TremoloFrequency**

Modulation frequency in Hertz. Range is 0.1 - 20000.0. Default value is 5.0 Hz.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **TremoloDepth**

Depth of modulation as a percentage. Range is 0.0 - 1.0. Default value is 0.5.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Tremolo.RoughDraft.Extension.ps1 -Tremolo [[-TremoloFrequency] <Single>] [[-TremoloDepth] <Single>] [<CommonParameters>]
```
---




