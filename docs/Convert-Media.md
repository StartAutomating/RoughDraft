
Convert-Media
-------------
### Synopsis
Converts media from one format to another

---
### Description

Converts media from one format to another, using ffmpeg

---
### Related Links
* [Get-Media](Get-Media.md)
* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
Convert-Media "a.mov" "a.mp4"
```

#### EXAMPLE 2
```PowerShell
Convert-Media "a.jpg" ".mp4" -Duration "00:15:00" -Tune stillimage -Preset ultrafast
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
#### **Codec**

The codec used for the conversion.  If the file is a video or image file, then this will be treated as a the video codec.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **FrameRate**

The frame rate of the outputted video



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **CopyAudio**

If set, will copy the audio streams and will not re-encode them.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **AudioCodec**

If provided, will re-encode the audio using the given codec



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **AudioFilter**

If provided, will apply audio filters to the file



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **VideoFilter**

If provided, will apply video filters to the file



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **AudioQuality**

If provided, will attempt to encode the audio at a variable quality level. Values differ per encoder.



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **AudioBitrate**

If provided, will encode the audio at a given bitrate



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **AudioStreamIndex**

Used to specify the audio stream.  If more than one audio stream is found and this parameter is not supplied, Convert-Media will attempt to find an audio stream that matches the current culture language.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
#### **AudioChannelCount**

The audio channel count.  This can be used to force 5.1 channel audio (which is supported by only a few codecs) into stereo audio (which is supported by almost all codecs)



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[UInt32]```|false   |named  |false        |
---
#### **MetaData**

The metadata to put in the converted file



|Type               |Requried|Postion|PipelineInput|
|-------------------|--------|-------|-------------|
|```[IDictionary]```|false   |named  |false        |
---
#### **Start**

The start time within the media. 
This maps to the ffmpeg parameter -ss.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |3      |true (ByPropertyName)|
---
#### **End**

The end time within the media. 
This maps to the ffmpeg parameter -to.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |4      |true (ByPropertyName)|
---
#### **Duration**

The duration of the media.
This maps to the ffmpeg parameter -t.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[TimeSpan]```|false   |5      |true (ByPropertyName)|
---
#### **Preset**

If provided, will use an ffmpeg preset to encode.
This maps to the --preset parameter in ffmpeg.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Tune**

If provided, will use a set of encoder settings to "tune" the video encoder.
Not supported by all codecs.  This maps to the --tune parameter in ffmpeg.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **VideoQuality**

If provided, will attempt to encode the video at a variable quality level, between 1 (highest) and 31 (lowest).



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **VideoCodec**

If provided, will re-encode the file with a given video codec.  This affects the input files, where -Codec affects the final output.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **VideoFrameCount**

If provided, will output a specified number of frames from the video file



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[UInt32]```|false   |named  |true (ByPropertyName)|
---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **AsJob**

If set, will run inside of a background job



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **FFMpegArgument**

Any additional arguments to FFMpeg



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **Loop**

If set, this will loop the input source.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **LoopCount**

If set, this will loop the input source any number of times.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
### Outputs
System.IO.FileInfo


System.Management.Automation.Job


---
### Syntax
```PowerShell
Convert-Media [-InputPath] <String> [-OutputPath] <String> [-Codec <String>] [-FFMpegPath <String>] [-FrameRate <String>] [-CopyAudio] [-AudioCodec <String>] [-AudioFilter <String[]>] [-VideoFilter <String[]>] [-AudioQuality <Int32>] [-AudioBitrate <String>] [-AudioStreamIndex <Int32>] [-AudioChannelCount <UInt32>] [-MetaData <IDictionary>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [[-Duration] <TimeSpan>] [-Preset <String>] [-Tune <String>] [-VideoQuality <Int32>] [-VideoCodec <String>] [-VideoFrameCount <UInt32>] [-PixelFormat <String>] [-AsJob] [-FFMpegArgument <String[]>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
---


