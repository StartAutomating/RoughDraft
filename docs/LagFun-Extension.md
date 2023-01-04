
Extension/LagFun.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
Slowly update darker pixels.

---
### Description

This filter makes short flashes of light appear longer.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#lagfun](https://ffmpeg.org/ffmpeg-filters.html#lagfun)



---
### Parameters
#### **LagFun**

If set, will use the lagfun filter



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **LagFunDecay**

Set factor for decaying. Default is .95. Allowed range is from 0 to 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/LagFun.RoughDraft.Extension.ps1 -LagFun [[-LagFunDecay] <Single>] [<CommonParameters>]
```
---




