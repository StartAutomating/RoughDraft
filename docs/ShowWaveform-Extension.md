
Extension/ShowWaveform.RoughDraft.Extension.ps1
-----------------------------------------------
### Synopsis
Shows audio waveform.

---
### Description

Shows a waveform of the audio, using the [showwaves filter](https://ffmpeg.org/ffmpeg-filters.html#showwaves)

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#showwaves](https://ffmpeg.org/ffmpeg-filters.html#showwaves)



---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -InputPath .\a.mp3 -ShowWaveform
```

#### EXAMPLE 2
```PowerShell
Edit-Media -InputPath .\a.mp3 -ShowWaveform -OutputPath .\a.mp4
```

---
### Parameters
#### **ShowWaveform**

If set, will show a line waveform



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ShowWaveformMode**

Set display mode



Valid Values:

* point
* line
* p2p
* cline



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ShowWaveformSize**

Specify the video size for the output.  Default value is 600x200



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ShowWaveformSplitChannel**

Set if channels should be drawn separately or overlap



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ShowWaveformColor**

Show waves color



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ShowWaveformScale**

Set amplitude scale.



Valid Values:

* lin
* log
* sqrt
* cbrt



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ShowWaveform.RoughDraft.Extension.ps1 -ShowWaveform [[-ShowWaveformMode] <String>] [[-ShowWaveformSize] <String>] [-ShowWaveformSplitChannel] [[-ShowWaveformColor] <String[]>] [[-ShowWaveformScale] <String>] [<CommonParameters>]
```
---



