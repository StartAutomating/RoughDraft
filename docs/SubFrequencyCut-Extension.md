
Extension/SubFrequencyCut.RoughDraft.Extension.ps1
--------------------------------------------------
### Synopsis
Cut subwoofer frequencies

---
### Description

Cut subwoofer frequencies.

This filter allows to set custom, steeper roll off than highpass filter, and thus is able to more attenuate frequency content in stop-band.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#asubcut](https://ffmpeg.org/ffmpeg-filters.html#asubcut)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp3 -SubFrequencyCut -SubFrequencyCut
```

---
### Parameters
#### **SubFrequencyCut**

If set, will Cut subwoofer frequencies.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **SubFrequencyCutFrequency**

Set cutoff frequency in Hertz. Allowed range is 2 to 200. Default value is 20.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **SubFrequencyCutOrder**

Set filter order. Available values are from 3 to 20. Default value is 10.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **SubFrequencyCutLevel**

Set input gain level. Allowed range is from 0 to 1. Default value is 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
### Syntax
```PowerShell
Extension/SubFrequencyCut.RoughDraft.Extension.ps1 -SubFrequencyCut [[-SubFrequencyCutFrequency] <Int32>] [[-SubFrequencyCutOrder] <Int32>] [[-SubFrequencyCutLevel] <Double>] [<CommonParameters>]
```
---




