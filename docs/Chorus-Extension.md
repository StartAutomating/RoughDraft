
Extension/Chorus.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
chorus

---
### Description

Add a chorus effect to the audio.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#chorus](https://ffmpeg.org/ffmpeg-filters.html#chorus)



---
### Parameters
#### **Chorus**

Add a chorus effect to the audio.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ChorusInGain**

set input gain



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ChorusOutGain**

set output gain



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ChorusDelay**

set delays



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ChorusDecay**

set decays



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ChorusSpeed**

set speeds



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **ChorusDepth**

set depths



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Chorus.RoughDraft.Extension.ps1 -Chorus [[-ChorusInGain] <Single>] [[-ChorusOutGain] <Single>] [[-ChorusDelay] <String[]>] [[-ChorusDecay] <String[]>] [[-ChorusSpeed] <String[]>] [[-ChorusDepth] <String[]>] [<CommonParameters>]
```
---



