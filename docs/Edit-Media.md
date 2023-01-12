Edit-Media
----------
### Synopsis
Edits media files

---
### Description

Modifies media files to apply advanced filters

---
### Related Links
* [Convert-Media](Convert-Media.md)



* [Get-Media](Get-Media.md)



* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
Get-Item a.mp4 |
    Edit-Media -FadeIn |
    Edit-Media -Rotate 90
```

---
### Parameters
#### **InputPath**

The input path






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|



---
#### **OutputPath**

The output path.  If not provided, the output path will be named for the current edit action, i.e. 1_FadeIn.mp4






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



---
#### **OutputMap**

The output map.  This can be provided to map multiple outputs from a single input.






|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |



---
#### **Codec**

The coded used for the conversion






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.






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
#### **MetaData**

The metadata to put in the converted file






|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |



---
#### **Start**

The start time within the media. 
This maps to the ffmpeg parameter -ss.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |3       |true (ByPropertyName)|



---
#### **End**

The end time within the media. 
This maps to the ffmpeg parameter -to.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |4       |true (ByPropertyName)|



---
#### **Duration**

The duration of the media.
This maps to the ffmpeg parameter -t.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |5       |true (ByPropertyName)|



---
#### **VideoFilter**

A series of video filters.  
The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|



---
#### **AudioFilter**

A series of audio filters.  
The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|



---
#### **ComplexFilter**

A series of complex filters.  The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.






|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[IDictionary[]]`|false   |named   |false        |



---
#### **ThreadCount**

The number of threads to use for decoding and filtering.






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
#### **Force**

If set, will ignore any previously generated content.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.
    
If you pass ```-Confirm:$false``` you will not be prompted.
    
    
If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---
### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)




---
### Syntax
```PowerShell
Edit-Media [-InputPath] <String[]> [[-OutputPath] <String>] [-OutputMap <IDictionary>] [-Codec <String>] [-FFMpegPath <String>] [-PixelFormat <String>] [-Preset <String>] [-Tune <String>] [-MetaData <IDictionary>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [[-Duration] <TimeSpan>] [-VideoFilter <IDictionary>] [-AudioFilter <IDictionary>] [-ComplexFilter <IDictionary[]>] [-ThreadCount <String>] [-FFMpegArgument <String[]>] [-AsJob] [-ThrottleLimit <Int32>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
---
### Notes
Edit-Media will return the output file, which can in turn be piped into the next Edit-Media.
Each parameter set of Edit-Media will perform one and only one action.
Using Edit-Media in a fluent pipeline will allow you to easily control the order in which actions are applied.
