
ConvertTo-WaveForm
------------------
### Synopsis
Converts audio into a waveform

---
### Description

Converts audio into a waveform visualization.

---
### Related Links
* [Get-Media](Get-Media.md)
* [Convert-Media](Convert-Media.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
ConvertTo-WaveForm -InputPath $home\Music\ASong.mp3 -OutputPath $home\Videos\ASong.mp4
```

#### EXAMPLE 2
```PowerShell
ConvertTo-WaveForm -InputPath $home\Music\ASong.mp3 -OutputPath $home\Videos\ASongScales.mp4 -Visualizer TonalScale
```

#### EXAMPLE 3
```PowerShell
ConvertTo-WaveForm -InputPath $home\Music\ASong.mp3 -OutputPath $home\Videos\ASongScales.mp4 -Visualizer Volume
```

---
### Parameters
#### **InputPath**

The input path



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |1      |true (ByPropertyName)|
---
#### **OutputPath**

The output path



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |2      |true (ByPropertyName)|
---
#### **FFMpegPath**

The path to FFMpeg.exe.  Download it from http://ffmpeg.org/



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Width**

The width of the generated file:  by default, 640



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[UInt32]```|false   |named  |false        |
---
#### **Height**

The height of the generated file:  by default, 120



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[UInt32]```|false   |named  |false        |
---
#### **Start**

The timespan to start splitting the video



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |5      |true (ByPropertyName)|
---
#### **End**

The time span to end splitting the video



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |6      |true (ByPropertyName)|
---
#### **Visualizer**

The name of the visualizer



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **Option**

Any options for the visualizer



|Type               |Requried|Postion|PipelineInput|
|-------------------|--------|-------|-------------|
|```[IDictionary]```|false   |named  |false        |
---
#### **PixelFormat**

The pixel format.  By default, yuv420p.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **AsJob**

If set, will run this in a background job



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
ConvertTo-WaveForm [-InputPath] <String> [-OutputPath] <String> [-FFMpegPath <String>] [-Width <UInt32>] [-Height <UInt32>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [-Visualizer <String>] [-Option <IDictionary>] [-PixelFormat <String>] [-AsJob] [<CommonParameters>]
```
---


