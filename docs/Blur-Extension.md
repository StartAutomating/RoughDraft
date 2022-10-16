
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

> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



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



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **BlurRadius**

The radius of the blur.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **BlurRadiusY**

Set vertical radius size, if zero it will be same as sizeX. Default is 0.
With avgblur, this will be the sizeX parameter
With gblur, this will be the sigmaV parameter.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **BlurAngle**

The angle of the blur.  Used in dblur.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **BlurLumaStrength**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **BlurChromaStrength**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **BlurLumaThreshold**

Set the luma threshold used as a coefficient to determine whether a pixel should be blurred or not.
The option value must be an integer in the range [-30,30].
A value of 0 will filter all the image, a value included in [0,30] will filter flat areas and a value included in [-30,0] will filter edges.
Default value is 0.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **BlurChromaThreshold**

Set the chroma threshold used as a coefficient to determine whether a pixel should be blurred or not.
The option value must be an integer in the range [-30,30].
A value of 0 will filter all the image, a value included in [0,30] will filter flat areas and a value included in [-30,0] will filter edges.
Default value is 0.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **BlurPlanes**

Set which planes to filter. By default all planes are filtered.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Blur.RoughDraft.Extension.ps1 -Blur [[-BlurType] <String>] [[-BlurRadius] <String>] [[-BlurRadiusY] <String>] [[-BlurAngle] <String>] [[-BlurLumaStrength] <String>] [[-BlurChromaStrength] <String>] [[-BlurLumaThreshold] <Int32>] [[-BlurChromaThreshold] <Int32>] [[-BlurPlanes] <String>] [<CommonParameters>]
```
---




