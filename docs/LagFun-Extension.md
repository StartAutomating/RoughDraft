
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **LagFunDecay**

Set factor for decaying. Default is .95. Allowed range is from 0 to 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
### Syntax
```PowerShell
Extension/LagFun.RoughDraft.Extension.ps1 -LagFun [[-LagFunDecay] <Single>] [<CommonParameters>]
```
---




