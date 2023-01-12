
Extension/SuperFrequencyCut.RoughDraft.Extension.ps1
----------------------------------------------------
### Synopsis
Cut super frequencies.

---
### Description

Cut super frequencies (frequencies at an extremely high range).

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#asupercut](https://ffmpeg.org/ffmpeg-filters.html#asupercut)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp3 -SuperFrequencyCut
```

---
### Parameters
#### **SuperFrequencyCut**

If set, will apply a Super frequency cut to the audio.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **SuperFrequencyCutFrequency**

Set cutoff frequency in Hertz. Allowed range is 20000 to 192000. Default value is 20000.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **SuperFrequencyCutOrder**

Set filter order. Available values are from 3 to 20. Default value is 10.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **SuperFrequencyCutLevel**

Set input gain level. Allowed range is from 0 to 1. Default value is 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
### Syntax
```PowerShell
Extension/SuperFrequencyCut.RoughDraft.Extension.ps1 -SuperFrequencyCut [[-SuperFrequencyCutFrequency] <Int32>] [[-SuperFrequencyCutOrder] <Int32>] [[-SuperFrequencyCutLevel] <Double>] [<CommonParameters>]
```
---




