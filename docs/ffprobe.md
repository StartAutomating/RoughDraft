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






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|



---
#### **FFProbePath**

The path to FFProbe






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |



---
#### **AsJob**

If set, will launch in a background job.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)




---
### Syntax
```PowerShell
Use-FFProbe [-FFProbeArgument <String[]>] [-FFProbePath <String>] [-AsJob] [<CommonParameters>]
```
---
