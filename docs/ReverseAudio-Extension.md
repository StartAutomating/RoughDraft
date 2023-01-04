
Extension/ReverseAudio.RoughDraft.Extension.ps1
-----------------------------------------------
### Synopsis
Reverses audio

---
### Description

Reverses audio, using the areverse filter.

Warning: This filter requires memory to buffer the entire clip.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#areverse](https://ffmpeg.org/ffmpeg-filters.html#areverse)



---
### Parameters
#### **ReverseAudio**

If set, will reverse audio



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ReverseAudio.RoughDraft.Extension.ps1 -ReverseAudio [<CommonParameters>]
```
---



