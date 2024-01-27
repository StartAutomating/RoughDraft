Extension/MixVideo.RoughDraft.Extension.ps1
-------------------------------------------

### Synopsis
Mix Video

---

### Description

Video mixing.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#mix](https://ffmpeg.org/ffmpeg-filters.html#mix)

---

### Parameters
#### **MixVideo**
Video mixing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **MixVideoInputs**
Number of inputs.  If unspecified, defaults to 2.

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|false   |1       |false        |vmix_inputs|

#### **MixVideoDuration**
How to determine the end-of-stream.
Valid Values:

* longest
* shortest
* first

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |2       |false        |vmix_duration|

#### **MixVideoWeight**
Set weight for each input.

|Type        |Required|Position|PipelineInput|Aliases                         |
|------------|--------|--------|-------------|--------------------------------|
|`[Double[]]`|false   |3       |false        |vmix_weights<br/>MixVideoWeights|

#### **MixVideoScale**
Specify scale, if it is set it will be multiplied with sum of each weight multiplied with pixel values to give final destination pixel value.
By default scale is auto scaled to sum of weights.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Double]`|false   |4       |false        |vmix_scale|

---

### Syntax
```PowerShell
Extension/MixVideo.RoughDraft.Extension.ps1 -MixVideo [[-MixVideoInputs] <Int32>] [[-MixVideoDuration] <String>] [[-MixVideoWeight] <Double[]>] [[-MixVideoScale] <Double>] [<CommonParameters>]
```
