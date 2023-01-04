
Extension/Colorize.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Colorize a video stream

---
### Description

Overlay a solid color on the video stream

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#colorize](https://ffmpeg.org/ffmpeg-filters.html#colorize)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp4 -Colorize -ColorizeHue 200 -ColorizeSaturation 100 -ColorizeValue 1 -ColorizeMix .1
```

---
### Parameters
#### **Colorize**

If set, will overlay a solid color on the video stream



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ColorizeHue**

Set the colorize hue. Allowed range is from 0 to 360. Default value is 0.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ColorizeSaturation**

Set the color saturation. Allowed range is from 0 to 1. Default value is 0.5.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ColorizeLightness**

> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ColorizeMix**

Set the mix of source lightness. By default is set to 1.0. Allowed range is from 0.0 to 1.0.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Colorize.RoughDraft.Extension.ps1 -Colorize [[-ColorizeHue] <Int32>] [[-ColorizeSaturation] <Double>] [[-ColorizeLightness] <Double>] [[-ColorizeMix] <Double>] [<CommonParameters>]
```
---



