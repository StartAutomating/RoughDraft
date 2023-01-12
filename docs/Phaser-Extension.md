
Extension/Phaser.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
Audio Phaser

---
### Description

Add a phasing effect to the audio.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#aphaser](https://ffmpeg.org/ffmpeg-filters.html#aphaser)



---
### Parameters
#### **Phaser**

Add a phasing effect to the audio.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **PhaserInGain**

set input gain






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
#### **PhaserOutGain**

set output gain






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **PhaserDelay**

set delay in milliseconds






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **PhaserDecay**

set decay






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



---
#### **PhaserSpeed**

set modulation speed






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |



---
#### **PhaserType**

set modulation type



Valid Values:

* triangular
* sinusoidal






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |



---
### Syntax
```PowerShell
Extension/Phaser.RoughDraft.Extension.ps1 -Phaser [[-PhaserInGain] <Double>] [[-PhaserOutGain] <Double>] [[-PhaserDelay] <Double>] [[-PhaserDecay] <Double>] [[-PhaserSpeed] <Double>] [[-PhaserType] <Object>] [<CommonParameters>]
```
---




