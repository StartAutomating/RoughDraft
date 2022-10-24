
Extension/MixAudio.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Mix Audio

---
### Description

Audio mixing.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#amix](https://ffmpeg.org/ffmpeg-filters.html#amix)



---
### Parameters
#### **MixAudio**

Audio mixing.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **MixAudioInputs**

Number of inputs.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **MixAudioDuration**

How to determine the end-of-stream.



Valid Values:

* longest
* shortest
* first



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **MixAudioDropoutTransition**

Transition time, in seconds, for volume renormalization when an input stream ends.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **MixAudioWeight**

Set weight for each input.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/MixAudio.RoughDraft.Extension.ps1 -MixAudio [[-MixAudioInputs] <Int32>] [[-MixAudioDuration] <String>] [[-MixAudioDropoutTransition] <Single>] [[-MixAudioWeight] <String[]>] [<CommonParameters>]
```
---




