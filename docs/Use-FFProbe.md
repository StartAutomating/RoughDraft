
Use-FFProbe
-----------
### Synopsis
Uses ffprobe directly.

---
### Description

Runs ffprobe.

---
### Related Links
* [Use-FFMpeg](Use-FFMpeg.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
Use-FFProbe -FFProbeArgument "$home\Music\ASong.mp3"
```

---
### Parameters
#### **FFProbeArgument**

Arguments to ffprobe.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **FFProbePath**

The path to FFProbe



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AsJob**

If set, will launch in a background job.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)




---
### Syntax
```PowerShell
Use-FFProbe [-FFProbeArgument <String[]>] [-FFProbePath <String>] [-AsJob] [<CommonParameters>]
```
---


