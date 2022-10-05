
Extension/CaptureDevice.rd.ext.ps1
----------------------------------
### Synopsis
Gets capture devices

---
### Description

Gets capture device information

---
### Parameters
#### **ListCaptureDevice**

If set, will list capture devices



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **CaptureDeviceType**

The type of capture device.
If not specified, this will be defaulted based off of the operating system.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/CaptureDevice.rd.ext.ps1 -ListCaptureDevice [[-CaptureDeviceType] <String[]>] [<CommonParameters>]
```
---




