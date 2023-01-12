
Extension/DirectShow.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
DirectShow Extension

---
### Description

The DirectShow extension lets you used DirectShow input devices

---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -DirectShow -VideoDevice $myWebCam
```

---
### Parameters
#### **DirectShow**

If set, will use DirectShow as the input type






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **VideoDevice**

The name of a DirectShow video device






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **AudioDevice**

The name of a DirectShow audio device






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/DirectShow.RoughDraft.Extension.ps1 -DirectShow [[-VideoDevice] <String>] [[-AudioDevice] <String>] [<CommonParameters>]
```
---




