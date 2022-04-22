
New-Media
---------
### Synopsis
Creates media files

---
### Description

Creates audio and video files using ffmpeg

---
### Related Links
* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
New-Media -OutputPath ".\RGBTestSource.mp4" -TestSource "RGBTestSrc"
```

---
### Parameters
#### **OutputPath**

The output path



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |1      |true (ByPropertyName)|
---
#### **Duration**

The duration.  By default, one second.



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[TimeSpan]```|false   |2      |false        |
---
#### **Resolution**

The resolution.  This can be independently handled by an extension.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |3      |false        |
---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |4      |true (ByPropertyName)|
---
#### **AsJob**

If set, will create the media in a background job.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
### Outputs
System.IO.FileInfo


System.Management.Automation.Job


---
### Syntax
```PowerShell
New-Media [-OutputPath] <String> [[-Duration] <TimeSpan>] [[-Resolution] <String>] [[-PixelFormat] <String>] [-AsJob] [<CommonParameters>]
```
---


