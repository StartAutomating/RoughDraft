
Extension/Hysteresis.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Hysteresis

---
### Description

Grow first stream into second stream by connecting components.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#hysteresis](https://ffmpeg.org/ffmpeg-filters.html#hysteresis)



---
### Parameters
#### **Hysteresis**

Grow first stream into second stream by connecting components.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **HysteresisPlanes**

set planes



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **HysteresisThreshold**

set threshold



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Hysteresis.RoughDraft.Extension.ps1 -Hysteresis [[-HysteresisPlanes] <Int32>] [[-HysteresisThreshold] <Int32>] [<CommonParameters>]
```
---




