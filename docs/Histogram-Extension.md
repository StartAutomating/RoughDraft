
Extension/Histogram.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
Histogram Extension

---
### Description

Compute and draw a color distribution histogram for the input video.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#histogram](https://ffmpeg.org/ffmpeg-filters.html#histogram)



---
### Parameters
#### **Histogram**

If set, will display a video histogram



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **HistogramLevelHeight**

Set height of level. Default value is 200. Allowed range is [50, 2048].



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **HistogramScaleHeight**

Set height of color scale. Default value is 12. Allowed range is [0, 40].



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **HistogramDisplayMode**

Set display mode. It accepts the following values:

|Value  |Description                                            |
|-------|-------------------------------------------------------|
|stack  |Per color component graphs are placed below each other.|
|parade |Per color component graphs are placed side by side.    |
|overlay| Presents information identical to that in the parade, except that the graphs representing color components are superimposed directly over one another. |



Valid Values:

* Stack
* Parade
* Overlay



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **HistogramLevelMode**

Set mode. Can be either linear, or logarithmic. Default is linear.



Valid Values:

* linear
* logarithmic



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **HistogramComponent**

Set what color components to display. Default is 7.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **HistogramForegroundOpacity**

Set foreground opacity. Default is 0.7.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **HistogramBackgroundOpacity**

Set background opacity. Default is 0.5.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **HistogramColorMode**

The colormode of the histogram.



Valid Values:

* whiteonblack
* blackonwhite
* whiteongray
* blackongray
* coloronblack
* coloronwhite
* colorongray
* blackoncolor
* whiteoncolor
* grayoncolor



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Histogram.RoughDraft.Extension.ps1 -Histogram [[-HistogramLevelHeight] <Int32>] [[-HistogramScaleHeight] <Int32>] [[-HistogramDisplayMode] <String>] [[-HistogramLevelMode] <String>] [[-HistogramComponent] <Int32>] [[-HistogramForegroundOpacity] <Single>] [[-HistogramBackgroundOpacity] <Single>] [[-HistogramColorMode] <String>] [<CommonParameters>]
```
---



