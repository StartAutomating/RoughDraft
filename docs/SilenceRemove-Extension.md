
Extension/SilenceRemove.RoughDraft.Extension.ps1
------------------------------------------------
### Synopsis
Detects silence in an audio stream

---
### Description

Detects silence in an audio stream, using the silencedetect filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#silenceremove

It's an extension](https://ffmpeg.org/ffmpeg-filters.html#silenceremove

It's an extension)



* [https://ffmpeg.org/ffmpeg-filters.html#silenceremove

It's an extension](https://ffmpeg.org/ffmpeg-filters.html#silenceremove

It's an extension.md)



---
### Parameters
#### **RemoveSilence**

If set, will remove silence.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **SilenceDuration**

The Silence Duration



> **Type**: ```[TimeSpan]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **SilenceThreshold**

The noise tolerance (by default 0.1%)  
If this is a number between 0 and 1 it will be treated as an amplitude ratio.
Otherwise, it will be treated as a decibal value.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **AnyChannel**

If set, will find silence within any channel of audio



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **SilenceStartPeriod**

The number of periods of silence at the start of the sample that will be trimmed.  
The default is one (which trims leading silence)
To not trim leading silence, pass a value of 0
To trim more than one period of silence, pass a value greater than one.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:true (ByPropertyName)



---
#### **SilenceStopPeriod**

The number of periods of silence at the end of the sample that will be trimmed.
The default is 0 (trim after the last silence, but don't trim between the first and last silence)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:true (ByPropertyName)



---
### Syntax
```PowerShell
Extension/SilenceRemove.RoughDraft.Extension.ps1 -RemoveSilence [[-SilenceDuration] <TimeSpan>] [[-SilenceThreshold] <Double>] [-AnyChannel] [[-SilenceStartPeriod] <Int32>] [[-SilenceStopPeriod] <Int32>] [<CommonParameters>]
```
---




