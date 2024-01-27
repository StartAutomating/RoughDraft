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

#### **PhaserInGain**
set input gain

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Double]`|false   |1       |false        |aphaser_in_gain|

#### **PhaserOutGain**
set output gain

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Double]`|false   |2       |false        |aphaser_out_gain|

#### **PhaserDelay**
set delay in milliseconds

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Double]`|false   |3       |false        |aphaser_delay|

#### **PhaserDecay**
set decay

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Double]`|false   |4       |false        |aphaser_decay|

#### **PhaserSpeed**
set modulation speed

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Double]`|false   |5       |false        |aphaser_speed|

#### **PhaserType**
set modulation type
Valid Values:

* triangular
* sinusoidal

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Object]`|false   |6       |false        |aphaser_type|

---

### Syntax
```PowerShell
Extension/Phaser.RoughDraft.Extension.ps1 -Phaser [[-PhaserInGain] <Double>] [[-PhaserOutGain] <Double>] [[-PhaserDelay] <Double>] [[-PhaserDecay] <Double>] [[-PhaserSpeed] <Double>] [[-PhaserType] <Object>] [<CommonParameters>]
```
