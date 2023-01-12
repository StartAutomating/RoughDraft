
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **HistogramLevelHeight**

Set height of level. Default value is 200. Allowed range is [50, 2048].






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **HistogramScaleHeight**

Set height of color scale. Default value is 12. Allowed range is [0, 40].






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **HistogramLevelMode**

Set mode. Can be either linear, or logarithmic. Default is linear.



Valid Values:

* linear
* logarithmic






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **HistogramComponent**

Set what color components to display. Default is 7.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |



---
#### **HistogramForegroundOpacity**

Set foreground opacity. Default is 0.7.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |6       |false        |



---
#### **HistogramBackgroundOpacity**

Set background opacity. Default is 0.5.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |7       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
### Syntax
```PowerShell
Extension/Histogram.RoughDraft.Extension.ps1 -Histogram [[-HistogramLevelHeight] <Int32>] [[-HistogramScaleHeight] <Int32>] [[-HistogramDisplayMode] <String>] [[-HistogramLevelMode] <String>] [[-HistogramComponent] <Int32>] [[-HistogramForegroundOpacity] <Single>] [[-HistogramBackgroundOpacity] <Single>] [[-HistogramColorMode] <String>] [<CommonParameters>]
```
---




