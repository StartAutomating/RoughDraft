
ConvertTo-Gif
-------------
### Synopsis
Converts an input video into an animated GIF

---
### Description

Converts an input video into a high-quality animated GIF

---
### Related Links
* [Get-Media](Get-Media.md)
* [Join-Media](Join-Media.md)
* [Convert-Media](Convert-Media.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
dir "$env:UserProfile\Videos\Too Many Cooks.mp4" |
    ConvertTo-Gif -Start "00:00:04.65" -End "00:00:06" -OutputPath "$env:UserProfile\Videos\Too Many Cooks.gif"
```

---
### Parameters
#### **InputPath**

The input path



|Type          |Requried|Postion|PipelineInput                 |
|--------------|--------|-------|------------------------------|
|```[String]```|true    |1      |true (ByValue, ByPropertyName)|
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
#### **Start**

The timespan to start splitting the video



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |3      |true (ByPropertyName)|
---
#### **End**

The time span to end splitting the video



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |4      |true (ByPropertyName)|
---
#### **AsJob**

If set, will run this in a background job



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **FrameRate**

The number of frames per second.  If not specified, this will match the existing framerate.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[UInt32]```|false   |named  |false        |
---
#### **NewWidth**

The new width of the .gif



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[UInt32]```|false   |named  |false        |
---
#### **DifferenceBasedPalette**

If set, will use a difference-based palette.  These put more focus on the motion than the background.



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
ConvertTo-Gif [-InputPath] <String> [-OutputPath] <String> [-FFMpegPath <String>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [-AsJob] [-FrameRate <UInt32>] [-NewWidth <UInt32>] [-DifferenceBasedPalette] [<CommonParameters>]
```
---
### Notes
This really wouldn't have been possible without the great programmers who make ffmpeg.
It was also greatly helped by a very diligent blogger who took the time to write down a detailed explanation of how FFMpeg works with animated GIFs.
You can find that explanation here - http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html.



