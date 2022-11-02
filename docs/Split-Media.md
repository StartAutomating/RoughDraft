Split-Media
-----------
### Synopsis
Splits media

---
### Description

Splits media files

---
### Related Links
* [Get-Media](Get-Media.md)



* [Join-Media](Join-Media.md)



* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
# Pick out the first five seconds of a song
Split-Media -InputPath $home\Music\ASong.mp3 -Start 00:00:00 -End 00:00:05
```

---
### Parameters
#### **InputPath**

The input path



> **Type**: ```[String]```

> **Required**: true

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputPath**

One or more output paths



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **FFMpegPath**

The path to FFMpeg.  Download it from http://ffmpeg.org/



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Start**

The timespan to start splitting the video



> **Type**: ```[TimeSpan]```

> **Required**: true

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **End**

The time span to end splitting the video



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:true (ByPropertyName)



---
### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)


* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)




---
### Syntax
```PowerShell
Split-Media -InputPath <String> [[-OutputPath] <String[]>] [-FFMpegPath <String>] [-Start] <TimeSpan> [[-End] <TimeSpan>] [<CommonParameters>]
```
---
