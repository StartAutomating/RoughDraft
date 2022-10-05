
Extension/FadeIn.rd.ext.ps1
---------------------------
### Synopsis
Fades in video

---
### Description

Fades in video, using the fade filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#fade](https://ffmpeg.org/ffmpeg-filters.html#fade)



---
### Parameters
#### **FadeIn**

If provided, the video will be faded in



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **StartFadeAt**

The frame the fade-in will start (by default, 0)



> **Type**: ```[UInt32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **EndFadeAt**

The frame the fade-in will end (by default, 30)



> **Type**: ```[UInt32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **FadeColor**

The fade color



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/FadeIn.rd.ext.ps1 -FadeIn [[-StartFadeAt] <UInt32>] [[-EndFadeAt] <UInt32>] [[-FadeColor] <String>] [<CommonParameters>]
```
---




