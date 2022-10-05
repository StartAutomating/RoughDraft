
Extension/ColorScope.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Colorscope extension

---
### Description

Display CIE color diagram with pixels overlaid onto it.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#ciescope](https://ffmpeg.org/ffmpeg-filters.html#ciescope)



---
### Parameters
#### **ColorScope**

If set, will display a video ColorScope



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ColorScopeColorSystem**

Set color system for the ColorScope



Valid Values:

* ntsc
* 470m
* ebu
* 470bg
* smpte
* 240m
* apple
* widergb
* cie1931
* rec709
* hdtv
* uhdtv
* rec2020
* dcip3



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ColorScopeColorGamut**

Sets the gamut for the ColorScope



Valid Values:

* ntsc
* 470m
* ebu
* 470bg
* smpte
* 240m
* apple
* widergb
* cie1931
* rec709
* hdtv
* uhdtv
* rec2020
* dcip3



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ColorScopeCIESystem**

Set CIE system for the ColorScope



Valid Values:

* xyy
* ucs
* luv



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ColorScopeSize**

Set ciescope size, by default set to 512.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ColorScopeIntensity**

Set intensity used to map input pixel values to CIE diagram.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **ColorScopeContrast**

Set contrast used to draw tongue colors that are out of active color system gamut.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ColorScopeNoGamutCorrection**

Correct gamma displayed on scope, by default enabled.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ColorScopeShowWhitePoint**

Show white point on CIE diagram, by default disabled.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ColorScopeInputGamma**

Set input gamma. Used only with XYZ input color space



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ColorScope.RoughDraft.Extension.ps1 -ColorScope [[-ColorScopeColorSystem] <String>] [[-ColorScopeColorGamut] <String>] [[-ColorScopeCIESystem] <String>] [[-ColorScopeSize] <Int32>] [[-ColorScopeIntensity] <String>] [[-ColorScopeContrast] <String>] [-ColorScopeNoGamutCorrection] [-ColorScopeShowWhitePoint] [[-ColorScopeInputGamma] <String>] [<CommonParameters>]
```
---




