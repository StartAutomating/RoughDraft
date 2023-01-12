
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **CaptureDeviceType**

The type of capture device.
If not specified, this will be defaulted based off of the operating system.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |



---
### Syntax
```PowerShell
Extension/CaptureDevice.rd.ext.ps1 -ListCaptureDevice [[-CaptureDeviceType] <String[]>] [<CommonParameters>]
```
---




