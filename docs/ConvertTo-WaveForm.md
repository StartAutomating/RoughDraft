
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
#### **FFMpegPath**

The path to FFMpeg.exe.  Download it from http://ffmpeg.org/



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Width**

The width of the generated file:  by default, 640



> **Type**: ```[UInt32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Height**

The height of the generated file:  by default, 120



> **Type**: ```[UInt32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Start**

The timespan to start splitting the video



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:true (ByPropertyName)



---
#### **End**

The time span to end splitting the video



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:true (ByPropertyName)



---
#### **Visualizer**

The name of the visualizer



Valid Values:

* LineWaveform
* Spectrum
* TonalScale
* PhaseMeter
* VectorScope
* Volume



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Option**

Any options for the visualizer



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **PixelFormat**

The pixel format.  By default, yuv420p.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AsJob**

If set, will run this in a background job



> **Type**: ```[Switch]```

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
ConvertTo-WaveForm [-InputPath] <String> [-OutputPath] <String> [-FFMpegPath <String>] [-Width <UInt32>] [-Height <UInt32>] [[-Start] <TimeSpan>] [[-End] <TimeSpan>] [-Visualizer <String>] [-Option <IDictionary>] [-PixelFormat <String>] [-AsJob] [<CommonParameters>]
```
---


