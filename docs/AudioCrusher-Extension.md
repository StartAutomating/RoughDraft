Extension/AudioCrusher.RoughDraft.Extension.ps1
-----------------------------------------------

### Synopsis
Audio Crusher

---

### Description

Reduce audio bit resolution.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#acrusher](https://ffmpeg.org/ffmpeg-filters.html#acrusher)

---

### Parameters
#### **AudioCrusher**
Reduce audio bit resolution.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AudioCrusherLevelIn**
set level in

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Double]`|false   |1       |false        |acrusher_level_in|

#### **AudioCrusherLevelOut**
set level out

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Double]`|false   |2       |false        |acrusher_level_out|

#### **AudioCrusherBits**
set bit reduction

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Double]`|false   |3       |false        |acrusher_bits|

#### **AudioCrusherMix**
set mix

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Double]`|false   |4       |false        |acrusher_mix|

#### **AudioCrusherMode**
set mode
Valid Values:

* lin
* log

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |5       |false        |acrusher_mode|

#### **AudioCrusherDc**
set DC

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Double]`|false   |6       |false        |acrusher_dc|

#### **AudioCrusherAa**
set anti-aliasing

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Double]`|false   |7       |false        |acrusher_aa|

#### **AudioCrusherSamples**
set sample reduction

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Double]`|false   |8       |false        |acrusher_samples|

#### **AudioCrusherLfo**
enable LFO

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|false   |named   |false        |acrusher_lfo|

#### **AudioCrusherLforange**
set LFO depth

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Double]`|false   |9       |false        |acrusher_lforange|

#### **AudioCrusherLforate**
set LFO rate

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Double]`|false   |10      |false        |acrusher_lforate|

---

### Syntax
```PowerShell
Extension/AudioCrusher.RoughDraft.Extension.ps1 -AudioCrusher [[-AudioCrusherLevelIn] <Double>] [[-AudioCrusherLevelOut] <Double>] [[-AudioCrusherBits] <Double>] [[-AudioCrusherMix] <Double>] [[-AudioCrusherMode] <String>] [[-AudioCrusherDc] <Double>] [[-AudioCrusherAa] <Double>] [[-AudioCrusherSamples] <Double>] [-AudioCrusherLfo] [[-AudioCrusherLforange] <Double>] [[-AudioCrusherLforate] <Double>] [<CommonParameters>]
```
