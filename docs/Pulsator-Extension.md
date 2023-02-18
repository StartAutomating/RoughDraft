
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **PulsatorLevelIn**

Set pulsator input gain. By default it is 1. Range is [0.015625 - 64].






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
#### **PulsatorLevelOut**

Set pulsator output gain. By default it is 1. Range is [0.015625 - 64].






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **PulsatorMode**

Set waveform shape the LFO will use. Can be one of: sine, triangle, square, sawup or sawdown. Default is sine.



Valid Values:

* sine
* triangle
* square
* sawup
* sawdown






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **PulsatorAmount**

Set modulation. Define how much of original signal is affected by the LFO.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **PulsatorOffsetLeft**

Set pulsator left channel offset. Default is 0. Allowed range is [0 - 1].






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |



---
#### **PulsatorOffsetRight**

Set pulsator right channel offset. Default is 0.5. Allowed range is [0 - 1].






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |6       |false        |



---
#### **PulsatorWidth**

Set pulse width. Default is 1. Allowed range is [0 - 2]






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |



---
#### **PulsatorTimingMode**

Set possible timing mode. Can be one of: bpm, ms or hz. Default is hz.



Valid Values:

* bpm
* ms
* hz






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
#### **PulsatorBPM**

Set pulsator bpm. Default is 120. Allowed range is [30 - 300]. Only used if timing is set to bpm.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |9       |false        |



---
#### **PulsatorMS**

Set pulsator ms. Default is 500. Allowed range is [10 - 2000]. Only used if timing is set to ms.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |10      |false        |



---
#### **PulsatorHZ**

Set frequency in Hz. Default is 2. Allowed range is [0.01 - 100]. Only used if timing is set to hz.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |11      |false        |



---
### Syntax
```PowerShell
Extension/Pulsator.RoughDraft.Extension.ps1 -Pulsator [[-PulsatorLevelIn] <Double>] [[-PulsatorLevelOut] <Double>] [[-PulsatorMode] <String>] [[-PulsatorAmount] <String>] [[-PulsatorOffsetLeft] <Double>] [[-PulsatorOffsetRight] <Double>] [[-PulsatorWidth] <Double>] [[-PulsatorTimingMode] <String>] [[-PulsatorBPM] <Double>] [[-PulsatorMS] <Double>] [[-PulsatorHZ] <Double>] [<CommonParameters>]
```
---




