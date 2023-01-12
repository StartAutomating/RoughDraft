
Extension/Vignette.rd.ext.ps1
-----------------------------
### Synopsis
Applies a vignette filter

---
### Description

Applies a vignette filter to a video source.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#vignette](https://ffmpeg.org/ffmpeg-filters.html#vignette)



---
### Parameters
#### **Vignette**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **VignetteAngle**

Set vignette lens angle expression as a number of radians.
The value is clipped in the [0,PI/2] range.
Default value: "PI/5"






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **VignetteCenterX**

Set vignette center x coordinates expression. By default "w/2",






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **VignetteCenterY**

Set vignette center Y coordinates expression. By default "w/2",






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **VignetteDirection**

Set forward/backward mode.
Available values are:
* ‘forward’  
  * The larger the distance from the central point, the darker the image becomes.
* ‘backward’
  * The larger the distance from the central point, the brighter the image becomes. 
  * This can be used to reverse a vignette effect, though there is no automatic detection to extract the lens angle and other settings (yet). 
  * It can also be used to create a burning effect.



Valid Values:

* forward
* backward






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **VignetteEvaluatioMode**

Set evaluation mode for the -VignetteAngle, -VignetteCenterX, -VignetteCenterY expressions
*‘init’
  * Evaluate expressions only once during the filter initialization.
*‘frame’
  * Evaluate expressions for each incoming frame. 
  * This is way slower than the ‘init’ mode since it requires all the scalers to be re-computed, but it allows advanced dynamic expressions.



Valid Values:

* init
* frame






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **DoNotDitherVignette**

Set dithering to reduce the circular banding effects






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **VignetteAspectRatio**

Set vignette aspect. 
This setting allows one to adjust the shape of the vignette. 
Setting this value to the SAR of the input will make a rectangular vignetting following the dimensions of the video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
### Syntax
```PowerShell
Extension/Vignette.rd.ext.ps1 -Vignette [[-VignetteAngle] <String>] [[-VignetteCenterX] <String>] [[-VignetteCenterY] <String>] [[-VignetteDirection] <String>] [[-VignetteEvaluatioMode] <String>] [-DoNotDitherVignette] [[-VignetteAspectRatio] <String>] [<CommonParameters>]
```
---




