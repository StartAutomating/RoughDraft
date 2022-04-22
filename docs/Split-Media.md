
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



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **OutputPath**

One or more output paths



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[String[]]```|false   |2      |true (ByPropertyName)|
---
#### **FFMpegPath**

The path to FFMpeg.  Download it from http://ffmpeg.org/



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Start**

The timespan to start splitting the video



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|true    |2      |true (ByPropertyName)|
---
#### **End**

The time span to end splitting the video



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |3      |true (ByPropertyName)|
---
### Outputs
System.IO.FileInfo


System.Management.Automation.Job


---
### Syntax
```PowerShell
Split-Media -InputPath <String> [[-OutputPath] <String[]>] [-FFMpegPath <String>] [-Start] <TimeSpan> [[-End] <TimeSpan>] [<CommonParameters>]
```
---


