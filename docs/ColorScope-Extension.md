
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **ColorScopeCIESystem**

Set CIE system for the ColorScope



Valid Values:

* xyy
* ucs
* luv






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **ColorScopeSize**

Set ciescope size, by default set to 512.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
#### **ColorScopeIntensity**

Set intensity used to map input pixel values to CIE diagram.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **ColorScopeContrast**

Set contrast used to draw tongue colors that are out of active color system gamut.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **ColorScopeNoGamutCorrection**

Correct gamma displayed on scope, by default enabled.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ColorScopeShowWhitePoint**

Show white point on CIE diagram, by default disabled.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ColorScopeInputGamma**

Set input gamma. Used only with XYZ input color space






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
### Syntax
```PowerShell
Extension/ColorScope.RoughDraft.Extension.ps1 -ColorScope [[-ColorScopeColorSystem] <String>] [[-ColorScopeColorGamut] <String>] [[-ColorScopeCIESystem] <String>] [[-ColorScopeSize] <Int32>] [[-ColorScopeIntensity] <String>] [[-ColorScopeContrast] <String>] [-ColorScopeNoGamutCorrection] [-ColorScopeShowWhitePoint] [[-ColorScopeInputGamma] <String>] [<CommonParameters>]
```
---




