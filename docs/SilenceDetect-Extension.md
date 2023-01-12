
Extension/SilenceDetect.RoughDraft.Extension.ps1
------------------------------------------------
### Synopsis
Detects silence in an audio stream

---
### Description

Detects silence in an audio stream, using the silencedetect filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#silencedetect

It's an extension](https://ffmpeg.org/ffmpeg-filters.html#silencedetect

It's an extension)



* [https://ffmpeg.org/ffmpeg-filters.html#silencedetect

It's an extension](https://ffmpeg.org/ffmpeg-filters.html#silencedetect

It's an extension.md)



---
### Parameters
#### **SilenceDetect**

If set, will find silences within an audio.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|



---
#### **SilenceDuration**

The duration of quiet that is considered silence.  By default a half second.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |1       |true (ByPropertyName)|



---
#### **NoiseThreshold**

The noise tolerance (by default 0.1%)  
If this is a number between 0 and 1 it will be treated as an amplitude ratio.
Otherwise, it will be treated as a decibal value.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |2       |true (ByPropertyName)|



---
#### **AnyChannel**

If set, will find silence within any channel of audio 
(this passes the ironically named mono parameter to the silencedetect filter of FFMPEG).






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
### Syntax
```PowerShell
Extension/SilenceDetect.RoughDraft.Extension.ps1 -SilenceDetect [[-SilenceDuration] <TimeSpan>] [[-NoiseThreshold] <Double>] [-AnyChannel] [<CommonParameters>]
```
---




