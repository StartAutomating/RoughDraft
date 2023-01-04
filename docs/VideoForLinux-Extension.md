
Extension/VideoForLinux.RoughDraft.Extension.ps1
------------------------------------------------
### Synopsis
VideoForLinux Extension

---
### Description

The VideoForLinux Extension lets you use linux video devices (i.e. as /dev/video0)

---
### Parameters
#### **VideoForLinux**

If set, will use video4linux2 as the input type



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **VideoDevice**

The name of the video device.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/VideoForLinux.RoughDraft.Extension.ps1 -VideoForLinux [[-VideoDevice] <String>] [<CommonParameters>]
```
---




