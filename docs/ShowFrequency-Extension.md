
Extension/ShowFrequency.RoughDraft.Extension.ps1
------------------------------------------------
### Synopsis
Show Frequencies

---
### Description

Convert input audio to a frequencies video output.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#showfreqs](https://ffmpeg.org/ffmpeg-filters.html#showfreqs)



---
### Parameters
#### **ShowFrequency**

Convert input audio to a frequencies video output.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ShowFrequencySize**

set video size






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **ShowFrequencyMode**

set display mode



Valid Values:

* line
* bar
* dot






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **ShowFrequencyAmplitudeScale**

set amplitude scale



Valid Values:

* lin
* sqrt
* cbrt
* log






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **ShowFrequencyScale**

set frequency scale



Valid Values:

* lin
* log
* rlog






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **ShowFrequencyWindowSize**

set window size






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |



---
#### **ShowFrequencyWindowFunction**

set window function



Valid Values:

* rect
* bartlett
* hanning
* hamming
* blackman
* welch
* flattop
* bharris
* bnuttall
* bhann
* sine
* nuttall
* lanczos
* gauss
* tukey
* dolph
* cauchy
* parzen
* poisson
* bohman
* kaiser






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **ShowFrequencyOverlap**

set window overlap






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |7       |false        |



---
#### **ShowFrequencyAveraging**

set time averaging






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |8       |false        |



---
#### **ShowFrequencyColors**

set channels colors






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |



---
#### **ShowFrequencyChannelMode**

set channel mode



Valid Values:

* combined
* separate






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |



---
#### **ShowFrequencyMinimumAmplitude**

set minimum amplitude






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |11      |false        |



---
#### **ShowFrequencyDataDisplayMode**

Set data display mode.



Valid Values:

* magnitude
* phase
* delay






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |



---
### Syntax
```PowerShell
Extension/ShowFrequency.RoughDraft.Extension.ps1 -ShowFrequency [[-ShowFrequencySize] <String>] [[-ShowFrequencyMode] <String>] [[-ShowFrequencyAmplitudeScale] <String>] [[-ShowFrequencyScale] <String>] [[-ShowFrequencyWindowSize] <Int32>] [[-ShowFrequencyWindowFunction] <String>] [[-ShowFrequencyOverlap] <Single>] [[-ShowFrequencyAveraging] <Int32>] [[-ShowFrequencyColors] <String>] [[-ShowFrequencyChannelMode] <Object>] [[-ShowFrequencyMinimumAmplitude] <Single>] [[-ShowFrequencyDataDisplayMode] <String>] [<CommonParameters>]
```
---




