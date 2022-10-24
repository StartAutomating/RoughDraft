
Extension/Sine.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Generates a sine wave

---
### Description

Generates an audio sine wave

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#sine](https://ffmpeg.org/ffmpeg-filters.html#sine)



---
### Parameters
#### **Sine**

If set, will generate a sine tone



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **SineFrequency**

The frequency of the sine tone.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Sine.RoughDraft.Extension.ps1 -Sine [[-SineFrequency] <String>] [<CommonParameters>]
```
---




