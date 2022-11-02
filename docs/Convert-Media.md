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



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputPath**

The output path



> **Type**: ```[String]```

> **Required**: true

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **Codec**

The codec used for the conversion.  If the file is a video or image file, then this will be treated as a the video codec.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FrameRate**

The frame rate of the outputted video



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **CopyAudio**

If set, will copy the audio streams and will not re-encode them.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AudioCodec**

If provided, will re-encode the audio using the given codec



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AudioFilter**

If provided, will apply audio filters to the file



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **VideoFilter**

If provided, will apply video filters to the file



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AudioQuality**

If provided, will attempt to encode the audio at a variable quality level. Values differ per encoder.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AudioBitrate**

If provided, will encode the audio at a given bitrate



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AudioStreamIndex**

Used to specify the audio stream.  If more than one audio stream is found and this parameter is not supplied, Convert-Media will attempt to find an audio stream that matches the current culture language.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AudioChannelCount**

The audio channel count.  This can be used to force 5.1 channel audio (which is supported by only a few codecs) into stereo audio (which is supported by almost all codecs)



> **Type**: ```[UInt32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **MetaData**

The metadata to put in the converted file



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Start**

The start time within the media. 
This maps to the ffmpeg parameter -ss.



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:true (ByPropertyName)



---
#### **End**

The end time within the media. 
This maps to the ffmpeg parameter -to.



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:true (ByPropertyName)



---
#### **Duration**

The duration of the media.
This maps to the ffmpeg parameter -t.



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:true (ByPropertyName)



---
#### **Preset**

If provided, will use an ffmpeg preset to encode.
This maps to the --preset parameter in ffmpeg.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Tune**

If provided, will use a set of encoder settings to "tune" the video encoder.
Not supported by all codecs.  This maps to the --tune parameter in ffmpeg.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **VideoQuality**

If provided, will attempt to encode the video at a variable quality level, between 1 (highest) and 31 (lowest).



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **VideoCodec**

If provided, will re-encode the file with a given video codec.  This affects the input files, where -Codec affects the final output.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **VideoFrameCount**

If provided, will output a specified number of frames from the video file



> **Type**: ```[UInt32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AsJob**

If set, will run inside of a background job



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FFMpegArgument**

Any additional arguments to FFMpeg



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Loop**

If set, this will loop the input source.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **LoopCount**

If set, this will loop the input source any number of times.



> **Type**: ```[Int32]```

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
Convert-Media [-InputPath] <String> [-OutputPath] <String> [-Codec <String>] [-FFMpegPath <String>] [-FrameRate <String>] [-CopyAudio] [-AudioCodec <String>] [-AudioFilter <String[]>] [-VideoFilter <String[]>] [-AudioQuality <Int32>] [-AudioBitrate <String>] [-AudioStreamIndex <Int32>] [-AudioChannelCount <UInt32>] [-MetaData <IDictionary>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [[-Duration] <TimeSpan>] [-Preset <String>] [-Tune <String>] [-VideoQuality <Int32>] [-VideoCodec <String>] [-VideoFrameCount <UInt32>] [-PixelFormat <String>] [-AsJob] [-FFMpegArgument <String[]>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
---
