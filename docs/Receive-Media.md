
Receive-Media
-------------
### Synopsis
Receives Media from an Input

---
### Description

Receives media from inputs.

---
### Related Links
* [Send-Media](Send-Media.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
Receive-Media -DirectShow -VideoDevice "OBS Virtual Camera" -OutputPath .\Desktop.mpg
```

#### EXAMPLE 2
```PowerShell
Receive-Media -DirectShow -VideoDevice "OBS Virtual Camera" -OutputPath .\Desktop.mkv -AsJob
```

---
### Parameters
#### **InputType**

The input device type.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **InputDevice**

The input device identifier.  This will be specific to a given input type.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **FrameRate**

The frame rate of the outputted video



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **FrameCount**

The number of frames to output.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Duration**

The duration to record.  If not provided, will record indefinitely.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |named  |true (ByPropertyName)|
---
#### **ArgumentList**

A list of additional arguments to FFMpeg.



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **OutputPath**

If set, will save output to a file



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **AsJob**

If set, will run as a background job.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in the path.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
### Syntax
```PowerShell
Receive-Media [-InputType <String>] [-InputDevice <String>] [-PixelFormat <String>] [-FrameRate <String>] [-FrameCount <String>] [-Duration <TimeSpan>] [-ArgumentList <String[]>] [-OutputPath <String>] [-AsJob] [-FFMpegPath <String>] [<CommonParameters>]
```
---
### Notes
Stopping a script that is receiving media with CTRL+C may prevent certain filetypes from being finalized.

For best results, use a filetype designed for streaming, such as .wav for audio or .mpg for video.

Alternatively, if you run Receive-Media -AsJob, stopping the job will normally allow FFMpeg to finalize.



