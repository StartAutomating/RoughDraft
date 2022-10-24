
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ShowFrequencySize**

set video size



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ShowFrequencyMode**

set display mode



Valid Values:

* line
* bar
* dot



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ShowFrequencyAmplitudeScale**

set amplitude scale



Valid Values:

* lin
* sqrt
* cbrt
* log



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ShowFrequencyScale**

set frequency scale



Valid Values:

* lin
* log
* rlog



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ShowFrequencyWindowSize**

set window size



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



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



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ShowFrequencyOverlap**

set window overlap



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **ShowFrequencyAveraging**

set time averaging



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **ShowFrequencyColors**

set channels colors



> **Type**: ```[String]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **ShowFrequencyChannelMode**

set channel mode



Valid Values:

* combined
* separate



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **ShowFrequencyMinimumAmplitude**

set minimum amplitude



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **ShowFrequencyDataDisplayMode**

Set data display mode.



Valid Values:

* magnitude
* phase
* delay



> **Type**: ```[String]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ShowFrequency.RoughDraft.Extension.ps1 -ShowFrequency [[-ShowFrequencySize] <String>] [[-ShowFrequencyMode] <String>] [[-ShowFrequencyAmplitudeScale] <String>] [[-ShowFrequencyScale] <String>] [[-ShowFrequencyWindowSize] <Int32>] [[-ShowFrequencyWindowFunction] <String>] [[-ShowFrequencyOverlap] <Single>] [[-ShowFrequencyAveraging] <Int32>] [[-ShowFrequencyColors] <String>] [[-ShowFrequencyChannelMode] <Object>] [[-ShowFrequencyMinimumAmplitude] <Single>] [[-ShowFrequencyDataDisplayMode] <String>] [<CommonParameters>]
```
---



