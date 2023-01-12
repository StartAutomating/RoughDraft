
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **VideoDevice**

The name of the video device.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
### Syntax
```PowerShell
Extension/VideoForLinux.RoughDraft.Extension.ps1 -VideoForLinux [[-VideoDevice] <String>] [<CommonParameters>]
```
---




