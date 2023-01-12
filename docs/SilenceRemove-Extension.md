
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **SilenceDuration**

The Silence Duration






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |1       |false        |



---
#### **SilenceThreshold**

The noise tolerance (by default 0.1%)  
If this is a number between 0 and 1 it will be treated as an amplitude ratio.
Otherwise, it will be treated as a decibal value.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |2       |true (ByPropertyName)|



---
#### **AnyChannel**

If set, will find silence within any channel of audio






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **SilenceStartPeriod**

The number of periods of silence at the start of the sample that will be trimmed.  
The default is one (which trims leading silence)
To not trim leading silence, pass a value of 0
To trim more than one period of silence, pass a value greater than one.






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |3       |true (ByPropertyName)|



---
#### **SilenceStopPeriod**

The number of periods of silence at the end of the sample that will be trimmed.
The default is 0 (trim after the last silence, but don't trim between the first and last silence)






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |4       |true (ByPropertyName)|



---
### Syntax
```PowerShell
Extension/SilenceRemove.RoughDraft.Extension.ps1 -RemoveSilence [[-SilenceDuration] <TimeSpan>] [[-SilenceThreshold] <Double>] [-AnyChannel] [[-SilenceStartPeriod] <Int32>] [[-SilenceStopPeriod] <Int32>] [<CommonParameters>]
```
---




