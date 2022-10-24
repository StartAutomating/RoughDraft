
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **AudioCrusherLevelIn**

set level in



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **AudioCrusherLevelOut**

set level out



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **AudioCrusherBits**

set bit reduction



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **AudioCrusherMix**

set mix



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **AudioCrusherMode**

set mode



Valid Values:

* lin
* log



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **AudioCrusherDc**

set DC



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **AudioCrusherAa**

set anti-aliasing



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **AudioCrusherSamples**

set sample reduction



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **AudioCrusherLfo**

enable LFO



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **AudioCrusherLforange**

set LFO depth



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **AudioCrusherLforate**

set LFO rate



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/AudioCrusher.RoughDraft.Extension.ps1 -AudioCrusher [[-AudioCrusherLevelIn] <Double>] [[-AudioCrusherLevelOut] <Double>] [[-AudioCrusherBits] <Double>] [[-AudioCrusherMix] <Double>] [[-AudioCrusherMode] <String>] [[-AudioCrusherDc] <Double>] [[-AudioCrusherAa] <Double>] [[-AudioCrusherSamples] <Double>] [-AudioCrusherLfo] [[-AudioCrusherLforange] <Double>] [[-AudioCrusherLforate] <Double>] [<CommonParameters>]
```
---




