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



> **Type**: ```[String[]]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputPath**

The output path.  If not provided, the output path will be named for the current edit action, i.e. 1_FadeIn.mp4



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputMap**

The output map.  This can be provided to map multiple outputs from a single input.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Codec**

The coded used for the conversion



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

> **PipelineInput**:true (ByPropertyName)



---
#### **PixelFormat**

If provided, will use a specific pixel format for video and image output.  This maps to the -pix_fmt parameter in ffmpeg.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

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
#### **VideoFilter**

A series of video filters.  
The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AudioFilter**

A series of audio filters.  
The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **ComplexFilter**

A series of complex filters.  The key is the name of the filter, and the value can either be the direct string value of the filter, or a hashtable containing the filter components.



> **Type**: ```[IDictionary[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ThreadCount**

The number of threads to use for decoding and filtering.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **FFMpegArgument**

Any additional arguments to FFMpeg



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Force**

If set, will ignore any previously generated content.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



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
Edit-Media [-InputPath] <String[]> [[-OutputPath] <String>] [-OutputMap <IDictionary>] [-Codec <String>] [-FFMpegPath <String>] [-PixelFormat <String>] [-Preset <String>] [-Tune <String>] [-MetaData <IDictionary>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [[-Duration] <TimeSpan>] [-VideoFilter <IDictionary>] [-AudioFilter <IDictionary>] [-ComplexFilter <IDictionary[]>] [-ThreadCount <String>] [-FFMpegArgument <String[]>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
---
### Notes
Edit-Media will return the output file, which can in turn be piped into the next Edit-Media.
Each parameter set of Edit-Media will perform one and only one action.
Using Edit-Media in a fluent pipeline will allow you to easily control the order in which actions are applied.
