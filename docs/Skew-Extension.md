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

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |Shear  |

#### **SkewX**
Skew factor in X-direction. Default value is 0. Allowed range is from -2 to 2.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Single]`|false   |1       |false        |ShearX |

#### **SkewY**
Skew factor in Y-direction. Default value is 0. Allowed range is from -2 to 2.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Single]`|false   |2       |false        |ShearY |

#### **SkewFillColor**
Set the color used to fill the output area not covered by the transformed video.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |3       |false        |ShearFillColor|

#### **SkewInteropolation**
Set interpolation type.  Default is 'bilinear'
Valid Values:

* bilinear
* nearest

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[String]`|false   |4       |false        |ShearInterpolation|

---

### Syntax
```PowerShell
Extension/Skew.RoughDraft.Extension.ps1 -Skew [[-SkewX] <Single>] [[-SkewY] <Single>] [[-SkewFillColor] <String>] [[-SkewInteropolation] <String>] [<CommonParameters>]
```
