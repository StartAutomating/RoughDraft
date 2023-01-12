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






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|



---
#### **OutputPath**

One or more output paths






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|



---
#### **FFMpegPath**

The path to FFMpeg.  Download it from http://ffmpeg.org/






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **Start**

The timespan to start splitting the video






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|true    |2       |true (ByPropertyName)|



---
#### **End**

The time span to end splitting the video






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |3       |true (ByPropertyName)|



---
#### **FFMpegArgument**

A list of additional arguments to FFMpeg.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |



---
#### **AsJob**

If set, will run as a background job.






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
|`[Int32]`|false   |named   |false        |



---
### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)


* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)




---
### Syntax
```PowerShell
Split-Media -InputPath <String> [[-OutputPath] <String[]>] [-FFMpegPath <String>] [-Start] <TimeSpan> [[-End] <TimeSpan>] [-FFMpegArgument <String[]>] [-AsJob] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
---
