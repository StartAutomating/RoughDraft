
Extension/Skew.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Skew Extension

---
### Description

Skews video, using the shear filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#shear](https://ffmpeg.org/ffmpeg-filters.html#shear)



---
### Parameters
#### **Skew**

If set, will skew video






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **SkewX**

Skew factor in X-direction. Default value is 0. Allowed range is from -2 to 2.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
#### **SkewY**

Skew factor in Y-direction. Default value is 0. Allowed range is from -2 to 2.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
#### **SkewFillColor**

Set the color used to fill the output area not covered by the transformed video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **SkewInteropolation**

Set interpolation type.  Default is 'bilinear'



Valid Values:

* bilinear
* nearest






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/Skew.RoughDraft.Extension.ps1 -Skew [[-SkewX] <Single>] [[-SkewY] <Single>] [[-SkewFillColor] <String>] [[-SkewInteropolation] <String>] [<CommonParameters>]
```
---




