
Extension/Pulsator.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Pulsator Effect

---
### Description

Adds an Pulsator Effect to the audio

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#apulsator](https://ffmpeg.org/ffmpeg-filters.html#apulsator)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "a.mp3" -Pulsator
```

#### EXAMPLE 2
```PowerShell
Show-Media -InputPath "a.mp3" -Pulsator
```

---
### Parameters
#### **Pulsator**

If set, will add a pulsator effect to the audio



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **PulsatorLevelIn**

Set pulsator input gain. By default it is 1. Range is [0.015625 - 64].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **PulsatorLevelOut**

Set pulsator output gain. By default it is 1. Range is [0.015625 - 64].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **PulsatorMode**

Set waveform shape the LFO will use. Can be one of: sine, triangle, square, sawup or sawdown. Default is sine.



Valid Values:

* sine
* triangle
* square
* sawup
* sawdown



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **PulsatorAmount**

Set modulation. Define how much of original signal is affected by the LFO.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **PulsatorOffsetLeft**

Set pulsator left channel offset. Default is 0. Allowed range is [0 - 1].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **PulsatorOffsetRight**

Set pulsator right channel offset. Default is 0.5. Allowed range is [0 - 1].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **PulsatorWidth**

Set pulse width. Default is 1. Allowed range is [0 - 2]



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **PulsatorTimingMode**

Set possible timing mode. Can be one of: bpm, ms or hz. Default is hz.



Valid Values:

* bpm
* ms
* hz



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **PulsatorBPM**

Set pulsator bpm. Default is 120. Allowed range is [30 - 300]. Only used if timing is set to bpm.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **PulsatorMS**

Set pulsator ms. Default is 500. Allowed range is [10 - 2000]. Only used if timing is set to ms.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **PulsatorHZ**

Set frequency in Hz. Default is 2. Allowed range is [0.01 - 100]. Only used if timing is set to hz.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Pulsator.RoughDraft.Extension.ps1 -Pulsator [[-PulsatorLevelIn] <Double>] [[-PulsatorLevelOut] <Double>] [[-PulsatorMode] <String>] [[-PulsatorAmount] <String>] [[-PulsatorOffsetLeft] <Double>] [[-PulsatorOffsetRight] <Double>] [[-PulsatorWidth] <Double>] [[-PulsatorTimingMode] <String>] [[-PulsatorBPM] <Double>] [[-PulsatorMS] <Double>] [[-PulsatorHZ] <Double>] [<CommonParameters>]
```
---




