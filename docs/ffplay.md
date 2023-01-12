Use-FFPlay
----------
### Synopsis
Uses FFPlay directly.

---
### Description

Runs FFPlay.

---
### Related Links
* [Use-FFMpeg](Use-FFMpeg.md)



* [Use-FFPlay](Use-FFPlay.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
Use-FFPlay -FFPlayArgument "$home\Music\ASong.mp3"
```

---
### Parameters
#### **FFPlayArgument**

Arguments to FFPlay.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|



---
#### **FFPlayPath**

The path to FFPlay.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |



---
#### **AsJob**

If set, will run as a background job.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)




---
### Syntax
```PowerShell
Use-FFPlay [-FFPlayArgument <String[]>] [-FFPlayPath <String>] [-AsJob] [<CommonParameters>]
```
---
