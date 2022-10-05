
Extension/FrameStep.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
FrameStep Effect

---
### Description

Select one frame every N-th frame.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#framestep](https://ffmpeg.org/ffmpeg-filters.html#framestep)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp4 -FrameStep 2
```

---
### Parameters
#### **FrameStep**

Select frame after every step frames.
Allowed values are positive integers higher than 0.



> **Type**: ```[Int32]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/FrameStep.RoughDraft.Extension.ps1 [-FrameStep] <Int32> [<CommonParameters>]
```
---



