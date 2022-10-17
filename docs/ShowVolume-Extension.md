
Extension/ShowVolume.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Shows the volume of an audio stream.

---
### Description

Shows the volume of an audio stream, using the [showvolume filter](https://ffmpeg.org/ffmpeg-filters.html#showvolume)

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#showvolume](https://ffmpeg.org/ffmpeg-filters.html#showvolume)



---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -InputPath .\a.mp3 -ShowVolume
```

#### EXAMPLE 2
```PowerShell
Edit-Media -InputPath .\a.mp3 -ShowVolume -OutputPath .\a.mp4
```

---
### Parameters
#### **ShowVolume**

If set, will show volume



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ShowVolumeBorderWidth**

Set border width, allowed range is [0, 5]. Default is 1.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ShowVolumeChannelWidth**

Set channel width, allowed range is [80, 8192]. Default is 400



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ShowVolumeChannelHeight**

Set channel height, allowed range is [1, 900]. Default is 20.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ShowVolumeChannelFade**

Set fade, allowed range is [0, 1]. Default is 0.95.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ShowVolumeColorExpression**

Set volume color expression.

The expression can use the following variables:

VOLUME
Current max volume of channel in dB.

PEAK
Current peak.

CHANNEL
Current channel number, starting from 0.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **ShowVolumeOrientation**

Set orientation, can be horizontal: h or vertical: v, default is h.



Valid Values:

* v
* h
* horizontal
* vertical



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ShowVolumeMode**

Set metering mode, can be peak: p or rms: r, default is p.



Valid Values:

* p
* r
* peak
* rms



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **ShowVolumeStepSize**

Set step size, allowed range is [0, 5]. Default is 0, which means step is disabled.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **ShowVolumeBackgroundOpacity**

Set background opacity, allowed range is [0, 1]. Default is 0.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **ShowVolumeDisplayScale**

Set display scale, can be linear: lin or log: log, default is lin.



Valid Values:

* lin
* log



> **Type**: ```[String]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **ShowVolumeDisplayMaxInterval**

In second. If set to > 0., display a line for the max level in the previous seconds. default is disabled



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **ShowVolumeDisplayMaxColor**

The color of the max line (if -ShowVolumeDisplayMaxInterval is set).
default is 'orange'.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ShowVolume.RoughDraft.Extension.ps1 -ShowVolume [[-ShowVolumeBorderWidth] <Int32>] [[-ShowVolumeChannelWidth] <Int32>] [[-ShowVolumeChannelHeight] <Int32>] [[-ShowVolumeChannelFade] <Double>] [[-ShowVolumeColorExpression] <String>] [[-ShowVolumeOrientation] <String>] [[-ShowVolumeMode] <String>] [[-ShowVolumeStepSize] <Double>] [[-ShowVolumeBackgroundOpacity] <Double>] [[-ShowVolumeDisplayScale] <String>] [[-ShowVolumeDisplayMaxInterval] <Double>] [[-ShowVolumeDisplayMaxColor] <Object>] [<CommonParameters>]
```
---




