
Extension/ZoomPan.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
Zoom and Pan

---
### Description

Apply Zoom & Pan effect.

Zoom and Pan is accomplished using a series of expressions.

Each expression can use the following variables:

Each expression can contain the following constants:

|Variable   |Description |
|-----------|------------|
|in_w, iw   |Input width |
|in_h, ih   |Input height|
|out_w, ow  |Output width|
|out_h, oh  |Output height|
|in         |Input frame count|
|on         |Output frame count|
|in_time, it|The input timestamp expressed in seconds. It’s NAN if the input timestamp is unknown.|
|out_time, time, ot|The output timestamp expressed in seconds.|
|x          |Last calculated 'x' expression for current input frame|
|y          |Last calculated 'y' expression for current input frame|
|px         |'x' of last output frame of previous input frame or 0 when there was not yet such frame (first input frame).|
|py         |'y' of last output frame of previous input frame or 0 when there was not yet such frame (first input frame).|
|zoom       |Last calculated zoom from ’z’ expression for current input frame.|
|pzoom      |Last calculated zoom of last output frame of previous input frame.|
|duration   |Number of output frames for current input frame. Calculated from ’d’ expression for each input frame.|
|pduration  |number of output frames created for previous input frame|
|a          |Rational number: input width / input height|
|sar        |sample aspect ratio|
|dar        |display aspect ratio|

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#zoompan](https://ffmpeg.org/ffmpeg-filters.html#zoompan)



---
### Parameters
#### **ZoomPan**

Apply Zoom & Pan effect.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ZoomPanZoom**

Set the zoom expression. Range is 1-10. Default is 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **ZoomPanX**

Set the x expression






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **ZoomPanY**

set the y expression






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **ZoomPanD**

set the duration expression






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **ZoomPanS**

set the output image size






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **ZoomPanFps**

set the output framerate






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |



---
### Syntax
```PowerShell
Extension/ZoomPan.RoughDraft.Extension.ps1 -ZoomPan [[-ZoomPanZoom] <String>] [[-ZoomPanX] <String>] [[-ZoomPanY] <String>] [[-ZoomPanD] <String>] [[-ZoomPanS] <String>] [[-ZoomPanFps] <Int32>] [<CommonParameters>]
```
---




