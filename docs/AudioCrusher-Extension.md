
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



---
#### **AudioCrusherLevelIn**

set level in






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
#### **AudioCrusherLevelOut**

set level out






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **AudioCrusherBits**

set bit reduction






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **AudioCrusherMix**

set mix






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



---
#### **AudioCrusherMode**

set mode



Valid Values:

* lin
* log






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **AudioCrusherDc**

set DC






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |6       |false        |



---
#### **AudioCrusherAa**

set anti-aliasing






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |



---
#### **AudioCrusherSamples**

set sample reduction






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |8       |false        |



---
#### **AudioCrusherLfo**

enable LFO






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **AudioCrusherLforange**

set LFO depth






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |9       |false        |



---
#### **AudioCrusherLforate**

set LFO rate






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |10      |false        |



---
### Syntax
```PowerShell
Extension/AudioCrusher.RoughDraft.Extension.ps1 -AudioCrusher [[-AudioCrusherLevelIn] <Double>] [[-AudioCrusherLevelOut] <Double>] [[-AudioCrusherBits] <Double>] [[-AudioCrusherMix] <Double>] [[-AudioCrusherMode] <String>] [[-AudioCrusherDc] <Double>] [[-AudioCrusherAa] <Double>] [[-AudioCrusherSamples] <Double>] [-AudioCrusherLfo] [[-AudioCrusherLforange] <Double>] [[-AudioCrusherLforate] <Double>] [<CommonParameters>]
```
---




