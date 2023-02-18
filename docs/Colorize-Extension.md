
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ColorizeHue**

Set the colorize hue. Allowed range is from 0 to 360. Default value is 0.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **ColorizeSaturation**

Set the color saturation. Allowed range is from 0 to 1. Default value is 0.5.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **ColorizeLightness**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **ColorizeMix**

Set the mix of source lightness. By default is set to 1.0. Allowed range is from 0.0 to 1.0.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/Colorize.RoughDraft.Extension.ps1 -Colorize [[-ColorizeHue] <Int32>] [[-ColorizeSaturation] <Double>] [[-ColorizeLightness] <Double>] [[-ColorizeMix] <Double>] [<CommonParameters>]
```
---




