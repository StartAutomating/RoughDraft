
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **VideoDevice**

The name of a DirectShow video device



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **AudioDevice**

The name of a DirectShow audio device



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/DirectShow.RoughDraft.Extension.ps1 -DirectShow [[-VideoDevice] <String>] [[-AudioDevice] <String>] [<CommonParameters>]
```
---



