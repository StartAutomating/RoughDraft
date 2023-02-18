
Extension/Subtitler.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
Creates subtitles.

---
### Description

Creates VTT and SRT subtitles.

---
### Examples
#### EXAMPLE 1
```PowerShell
New-Media -SubtitleContent "a", "b" -SubtitleStartTime "00:00:01","00:01:01" -SubtitleEndTime "00:01:00", "00:02:00" -OutputPath .\test.srt
```

---
### Parameters
#### **SubtitleContent**

An array of subtitles.
Each element represents a single subtitle






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |



---
#### **SubtitleStartTime**

An array of subtitle start times.
Each element represents the starting time of each subtitle.






|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|true    |2       |false        |



---
#### **SubtitleEndTime**

An array of subtitle end times.
Each element represents the end time of each subtitle.






|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|true    |3       |false        |



---
#### **SubtitleLocale**

The subtitle locale.  Only valid when the -OutputPath is a VTT
If not provided, this will be automatically detected.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/Subtitler.RoughDraft.Extension.ps1 [-SubtitleContent] <String[]> [-SubtitleStartTime] <TimeSpan[]> [-SubtitleEndTime] <TimeSpan[]> [[-SubtitleLocale] <String>] [<CommonParameters>]
```
---




