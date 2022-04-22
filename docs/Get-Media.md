
Get-Media
---------
### Synopsis
Gets media metadata

---
### Description

Gets metadata about a media file, using FFProbe.

---
### Related Links
* [Set-Media](Set-Media.md)
* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
Get-Media -InputPath $home\Music\ASong.mp3
```

#### EXAMPLE 2
```PowerShell
Get-Media -InputPath $home\Video\AVideo.mp4
```

---
### Parameters
#### **InputPath**

One or more input paths.
If none are provided, all files in the current directory will be passed to Get-Media.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[String[]]```|false   |1      |true (ByPropertyName)|
---
#### **FFProbePath**

The path to FFProbe.exe.  Download it from http://ffmpeg.org/



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **FFMpegPath**

The path to FFMpeg.exe.  Download it from http://ffmpeg.org/



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **Stream**

A list of streams .
For example, to show only audio streams, use 'a'



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **Entry**

A list of entries.
By default, shows information about streams and formats.
For more information about sections, visit [FFMpeg.org](https://ffmpeg.org/ffprobe.html#Main-options)



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **OutputPacket**

If set, will output packets



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **OutputData**

If set, will output data



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **OutputFrame**

If set, will output frames



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **ProbeTryCount**

The number of times to retry reading the file.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
#### **AsJob**

If set, will run this in a background job



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
### Outputs
RoughDraft.Media


System.Management.Automation.Job


psobject


---
### Syntax
```PowerShell
Get-Media [[-InputPath] <String[]>] [-FFProbePath <String>] [-FFMpegPath <String>] [-Stream <String[]>] [-Entry <String[]>] [-OutputPacket] [-OutputData] [-OutputFrame] [-ProbeTryCount <Int32>] [-AsJob] [<CommonParameters>]
```
---


