
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



---
#### **MixVideoInputs**

Number of inputs.  If unspecified, defaults to 2.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **MixVideoDuration**

How to determine the end-of-stream.



Valid Values:

* longest
* shortest
* first






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **MixVideoWeight**

Set weight for each input.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Double[]]`|false   |3       |false        |



---
#### **MixVideoScale**

Specify scale, if it is set it will be multiplied with sum of each weight multiplied with pixel values to give final destination pixel value.
By default scale is auto scaled to sum of weights.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/MixVideo.RoughDraft.Extension.ps1 -MixVideo [[-MixVideoInputs] <Int32>] [[-MixVideoDuration] <String>] [[-MixVideoWeight] <Double[]>] [[-MixVideoScale] <Double>] [<CommonParameters>]
```
---




