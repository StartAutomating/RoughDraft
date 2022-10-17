
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **SuperFrequencyCutFrequency**

Set cutoff frequency in Hertz. Allowed range is 20000 to 192000. Default value is 20000.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **SuperFrequencyCutOrder**

Set filter order. Available values are from 3 to 20. Default value is 10.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **SuperFrequencyCutLevel**

Set input gain level. Allowed range is from 0 to 1. Default value is 1.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/SuperFrequencyCut.RoughDraft.Extension.ps1 -SuperFrequencyCut [[-SuperFrequencyCutFrequency] <Int32>] [[-SuperFrequencyCutOrder] <Int32>] [[-SuperFrequencyCutLevel] <Double>] [<CommonParameters>]
```
---




