Join-Media
----------
### Synopsis
Joins media files

---
### Description

Joins multiple media files together into a single file.

---
### Related Links
* [Get-Media](Get-Media.md)



* [Convert-Media](Convert-Media.md)



* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)



---
### Parameters
#### **InputPath**

The input path






|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|



---
#### **OutputPath**

The output path






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |



---
#### **Transcode**

If set, will transcode input files before concatinating them together.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **Shortest**

If inputs are mixed together, instead of concatenated, then the shortest input file will be preferred






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **FrameRate**

The frame rate.  If joining images, this determines how long each image takes.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |



---
#### **TimeLapse**

If set, will generate a time lapse.
This will assume all inputs are images (skipping individual analysis)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ThreadCount**

The number of threads to use for decoding and filtering.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **Preset**

If provided, will use an ffmpeg preset to encode.
This maps to the --preset parameter in ffmpeg.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **Tune**

If provided, will use a set of encoder settings to "tune" the video encoder.
Not supported by all codecs.  This maps to the --tune parameter in ffmpeg.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **FFMpegArgument**

A list of additional arguments to FFMpeg.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |



---
#### **PixelFormat**

The pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg. By default, yuv420p.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |



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




---
### Syntax
```PowerShell
Join-Media [-InputPath] <String[]> [-OutputPath] <String> [-Transcode] [-Shortest] [-FrameRate <UInt32>] [-ThreadCount <String>] [-Preset <String>] [-Tune <String>] [-FFMpegArgument <String[]>] [-PixelFormat <String>] [-AsJob] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
```PowerShell
Join-Media [-InputPath] <String[]> [-OutputPath] <String> [-Transcode] [-Shortest] [-FrameRate <UInt32>] -TimeLapse [-ThreadCount <String>] [-Preset <String>] [-Tune <String>] [-FFMpegArgument <String[]>] [-PixelFormat <String>] [-AsJob] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
---
### Notes
Join-Media has a variety of uses:

* Creating a Time Lapse or Stop Motion from a series of images
* Mixing audio into an existing video file
* Joining multiple videos or audio files into a single long file
