
Extension/RandomizeFrame.RoughDraft.Extension.ps1
-------------------------------------------------
### Synopsis
RandomizeFrame extensions

---
### Description

Flush video frames from internal cache of frames into a random order. No frame is discarded.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#random](https://ffmpeg.org/ffmpeg-filters.html#random)



---
### Parameters
#### **RandomizeFrame**

If set, will randomize frames



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **RandomizedFrameCount**

The number of frames to be randomized.  Default is 30.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **RandomizedFrameSeed**

The seet for the random number generator.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/RandomizeFrame.RoughDraft.Extension.ps1 -RandomizeFrame [[-RandomizedFrameCount] <Int32>] [[-RandomizedFrameSeed] <Int32>] [<CommonParameters>]
```
---



