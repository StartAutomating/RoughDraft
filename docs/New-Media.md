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



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **Duration**

The duration.  By default, one second.



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **Resolution**

The resolution.  This can be independently handled by an extension.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:true (ByPropertyName)



---
#### **AsJob**

If set, will create the media in a background job.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)


* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)




---
### Syntax
```PowerShell
New-Media [-OutputPath] <String> [[-Duration] <TimeSpan>] [[-Resolution] <String>] [[-PixelFormat] <String>] [-AsJob] [<CommonParameters>]
```
---
