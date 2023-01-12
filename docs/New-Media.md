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






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|



---
#### **Duration**

The duration.  By default, one second.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |2       |false        |



---
#### **Resolution**

The resolution.  This can be independently handled by an extension.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|



---
#### **FFMpegArgument**

A list of additional arguments to FFMpeg.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |



---
#### **AsJob**

If set, will create the media in a background job.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ThrottleLimit**

If set, will limit the number of background jobs to a throttle limit.
By default 5.
Throttling is only available if running on PowerShell Core.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |



---
### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)


* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)




---
### Syntax
```PowerShell
New-Media [-OutputPath] <String> [[-Duration] <TimeSpan>] [[-Resolution] <String>] [[-PixelFormat] <String>] [[-FFMpegArgument] <String[]>] [-AsJob] [[-ThrottleLimit] <Int32>] [<CommonParameters>]
```
---
