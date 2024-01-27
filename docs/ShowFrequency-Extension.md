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

#### **ShowFrequencySize**
set video size

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |1       |false        |showfreqs_size|

#### **ShowFrequencyMode**
set display mode
Valid Values:

* line
* bar
* dot

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |2       |false        |showfreqs_mode|

#### **ShowFrequencyAmplitudeScale**
set amplitude scale
Valid Values:

* lin
* sqrt
* cbrt
* log

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |3       |false        |showfreqs_ascale|

#### **ShowFrequencyScale**
set frequency scale
Valid Values:

* lin
* log
* rlog

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |4       |false        |showfreqs_fscale|

#### **ShowFrequencyWindowSize**
set window size

|Type     |Required|Position|PipelineInput|Aliases           |
|---------|--------|--------|-------------|------------------|
|`[Int32]`|false   |5       |false        |showfreqs_win_size|

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

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[String]`|false   |6       |false        |showfreqs_win_func|

#### **ShowFrequencyOverlap**
set window overlap

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Single]`|false   |7       |false        |showfreqs_overlap|

#### **ShowFrequencyAveraging**
set time averaging

|Type     |Required|Position|PipelineInput|Aliases            |
|---------|--------|--------|-------------|-------------------|
|`[Int32]`|false   |8       |false        |showfreqs_averaging|

#### **ShowFrequencyColors**
set channels colors

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |9       |false        |showfreqs_colors|

#### **ShowFrequencyChannelMode**
set channel mode
Valid Values:

* combined
* separate

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Object]`|false   |10      |false        |showfreqs_cmode|

#### **ShowFrequencyMinimumAmplitude**
set minimum amplitude

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Single]`|false   |11      |false        |showfreqs_minamp|

#### **ShowFrequencyDataDisplayMode**
Set data display mode.
Valid Values:

* magnitude
* phase
* delay

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |12      |false        |showfreqs_data|

---

### Syntax
```PowerShell
Extension/ShowFrequency.RoughDraft.Extension.ps1 -ShowFrequency [[-ShowFrequencySize] <String>] [[-ShowFrequencyMode] <String>] [[-ShowFrequencyAmplitudeScale] <String>] [[-ShowFrequencyScale] <String>] [[-ShowFrequencyWindowSize] <Int32>] [[-ShowFrequencyWindowFunction] <String>] [[-ShowFrequencyOverlap] <Single>] [[-ShowFrequencyAveraging] <Int32>] [[-ShowFrequencyColors] <String>] [[-ShowFrequencyChannelMode] <Object>] [[-ShowFrequencyMinimumAmplitude] <Single>] [[-ShowFrequencyDataDisplayMode] <String>] [<CommonParameters>]
```
