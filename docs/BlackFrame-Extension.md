
Extension/BlackFrame.rd.Extension.ps1
-------------------------------------
### Synopsis
Detects black frames.

---
### Description

Detects black frames in an video stream, using the blackframe filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#blackframe](https://ffmpeg.org/ffmpeg-filters.html#blackframe)



---
### Parameters
#### **BlackFrameDetect**

If set, will find black frames within a video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **BlackFrameThreshold**

The perctange of the screen blackness that constitutes a cut.  By default, 15%.
Due to encoding and equipment, very few fades to black are actually truly black.
They are often very dark grey instead.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
### Syntax
```PowerShell
Extension/BlackFrame.rd.Extension.ps1 -BlackFrameDetect [[-BlackFrameThreshold] <Double>] [<CommonParameters>]
```
---




