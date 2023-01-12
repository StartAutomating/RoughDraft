Use-FFMpeg
----------
### Synopsis
Uses ffmpeg directly.

---
### Description

Runs ffmpeg directly.

---
### Related Links
* [Use-FFProbe](Use-FFProbe.md)



* [Use-FFPlay](Use-FFPlay.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
Use-FFMpeg -FFMpegArgument '-i', "`"$home\Video\A.mp4`"", "`"$home\Music\A.mp3`""
```

---
### Parameters
#### **FFMpegArgument**

Arguments to FFMpeg.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|



---
#### **FFMpegPath**

The path to FFMpeg.






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
Use-FFMpeg [-FFMpegArgument <String[]>] [-FFMpegPath <String>] [-AsJob] [<CommonParameters>]
```
---
