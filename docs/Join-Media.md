
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



|Type            |Requried|Postion|PipelineInput                 |
|----------------|--------|-------|------------------------------|
|```[String[]]```|true    |1      |true (ByValue, ByPropertyName)|
---
#### **OutputPath**

The output path



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|true    |2      |false        |
---
#### **Transcode**

If set, will transcode input files before concatinating them together.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **Shortest**

If inputs are mixed together, instead of concatenated, then the shortest input file will be preferred



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **FrameRate**

The frame rate.  If joining images, this determines how long each image takes.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[UInt32]```|false   |named  |false        |
---
#### **TimeLapse**

If set, will generate a time lapse.
This will assume all inputs are images (skipping individual analysis)



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|true    |named  |false        |
---
#### **PixelFormat**

The pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg. By default, yuv420p.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
### Outputs
System.IO.FileInfo


---
### Syntax
```PowerShell
Join-Media [-InputPath] <String[]> [-OutputPath] <String> [-Transcode] [-Shortest] [-FrameRate <UInt32>] [-PixelFormat <String>] [<CommonParameters>]
```
```PowerShell
Join-Media [-InputPath] <String[]> [-OutputPath] <String> [-Transcode] [-Shortest] [-FrameRate <UInt32>] -TimeLapse [-PixelFormat <String>] [<CommonParameters>]
```
---
### Notes
Join-Media has a variety of uses:

* Creating a Time Lapse or Stop Motion from a series of images
* Mixing audio into an existing video file
* Joining multiple videos or audio files into a single long file



