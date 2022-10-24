
Extension/Phaser.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
Audio Phaser

---
### Description

Add a phasing effect to the audio.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#aphaser](https://ffmpeg.org/ffmpeg-filters.html#aphaser)



---
### Parameters
#### **Phaser**

Add a phasing effect to the audio.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **PhaserInGain**

set input gain



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **PhaserOutGain**

set output gain



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **PhaserDelay**

set delay in milliseconds



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **PhaserDecay**

set decay



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **PhaserSpeed**

set modulation speed



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **PhaserType**

set modulation type



Valid Values:

* triangular
* sinusoidal



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Phaser.RoughDraft.Extension.ps1 -Phaser [[-PhaserInGain] <Double>] [[-PhaserOutGain] <Double>] [[-PhaserDelay] <Double>] [[-PhaserDecay] <Double>] [[-PhaserSpeed] <Double>] [[-PhaserType] <Object>] [<CommonParameters>]
```
---




