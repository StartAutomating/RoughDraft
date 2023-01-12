
Extension/Blur.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Blurs Video

---
### Description

Blurs Video, using a variety of FFMpeg filters.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#avgblur](https://ffmpeg.org/ffmpeg-filters.html#avgblur)



* [https://ffmpeg.org/ffmpeg-filters.html#boxblur](https://ffmpeg.org/ffmpeg-filters.html#boxblur)



* [https://ffmpeg.org/ffmpeg-filters.html#dblur](https://ffmpeg.org/ffmpeg-filters.html#dblur)



* [https://ffmpeg.org/ffmpeg-filters.html#gblur](https://ffmpeg.org/ffmpeg-filters.html#gblur)



* [https://ffmpeg.org/ffmpeg-filters.html#smartblur-1](https://ffmpeg.org/ffmpeg-filters.html#smartblur-1)



* [https://ffmpeg.org/ffmpeg-filters.html#yaepblur](https://ffmpeg.org/ffmpeg-filters.html#yaepblur)



---
### Parameters
#### **Blur**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|



---
#### **BlurType**

Valid Values:

* Average
* avgblur
* Box
* boxblur
* Directional
* dblur
* EdgePreserving
* yeapblur
* Gaussian
* gblur
* Smart
* smartblur






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



---
#### **BlurRadius**

The radius of the blur.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **BlurRadiusY**

Set vertical radius size, if zero it will be same as sizeX. Default is 0.
With avgblur, this will be the sizeX parameter
With gblur, this will be the sigmaV parameter.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **BlurAngle**

The angle of the blur.  Used in dblur.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **BlurLumaStrength**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **BlurChromaStrength**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **BlurLumaThreshold**

Set the luma threshold used as a coefficient to determine whether a pixel should be blurred or not.
The option value must be an integer in the range [-30,30].
A value of 0 will filter all the image, a value included in [0,30] will filter flat areas and a value included in [-30,0] will filter edges.
Default value is 0.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |



---
#### **BlurChromaThreshold**

Set the chroma threshold used as a coefficient to determine whether a pixel should be blurred or not.
The option value must be an integer in the range [-30,30].
A value of 0 will filter all the image, a value included in [0,30] will filter flat areas and a value included in [-30,0] will filter edges.
Default value is 0.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |8       |false        |



---
#### **BlurPlanes**

Set which planes to filter. By default all planes are filtered.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |



---
### Syntax
```PowerShell
Extension/Blur.RoughDraft.Extension.ps1 -Blur [[-BlurType] <String>] [[-BlurRadius] <String>] [[-BlurRadiusY] <String>] [[-BlurAngle] <String>] [[-BlurLumaStrength] <String>] [[-BlurChromaStrength] <String>] [[-BlurLumaThreshold] <Int32>] [[-BlurChromaThreshold] <Int32>] [[-BlurPlanes] <String>] [<CommonParameters>]
```
---




