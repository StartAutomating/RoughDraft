
Extension/Overlay.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
overlay

---
### Description

Overlay a video source on top of the input.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#overlay](https://ffmpeg.org/ffmpeg-filters.html#overlay)



---
### Parameters
#### **Overlay**

Overlay a video source on top of the input.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **OverlayX**

set the x expression



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **OverlayY**

set the y expression



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **OverlayEof_action**

Action to take when encountering EOF from secondary input



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **OverlayEval**

specify when to evaluate expressions



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **OverlayShortest**

force termination when the shortest input terminates



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **OverlayFormat**

set output format



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **OverlayRepeatlast**

repeat overlay of the last overlay frame



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **OverlayAlpha**

alpha format



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Overlay.RoughDraft.Extension.ps1 -Overlay [[-OverlayX] <String>] [[-OverlayY] <String>] [-OverlayEof_action] [-OverlayEval] [-OverlayShortest] [-OverlayFormat] [-OverlayRepeatlast] [-OverlayAlpha] [<CommonParameters>]
```
---



