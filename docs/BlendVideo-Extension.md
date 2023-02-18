
Extension/BlendVideo.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
BlendVideo Extension

---
### Description

Blends Multiple Videos

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#blend](https://ffmpeg.org/ffmpeg-filters.html#blend)



---
### Parameters
#### **BlendVideo**

If set, will blend multiple videos






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **BlendMode**

The blend mode.



Valid Values:

* addition
* and
* average
* bleach
* burn
* darken
* difference
* divide
* dodge
* exclusion
* extremity
* freeze
* geometric
* glow
* grainextract
* grainmerge
* hardlight
* hardmix
* hardoverlay
* harmonic
* heat
* interpolate
* lighten
* linearlight
* multiply
* multiply128
* negation
* normal
* or
* overlay
* phoenix
* pinlight
* reflect
* screen
* softdifference
* softlight
* stain
* subtract
* vividlight
* xor






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **BlendColorMode**

One or more blend modes for a given color.



Valid Values:

* 
* addition
* and
* average
* bleach
* burn
* darken
* difference
* divide
* dodge
* exclusion
* extremity
* freeze
* geometric
* glow
* grainextract
* grainmerge
* hardlight
* hardmix
* hardoverlay
* harmonic
* heat
* interpolate
* lighten
* linearlight
* multiply
* multiply128
* negation
* normal
* or
* overlay
* phoenix
* pinlight
* reflect
* screen
* softdifference
* softlight
* stain
* subtract
* vividlight
* xor






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |



---
#### **BlendExpression**

The blend expression






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **BlendColorExpression**

The blend expressions for a given color






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |



---
#### **BlendOpacity**

The blend opacity.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **BlendColorOpacity**

The blend opacity for a given color.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |



---
### Syntax
```PowerShell
Extension/BlendVideo.RoughDraft.Extension.ps1 -BlendVideo [[-BlendMode] <String>] [[-BlendColorMode] <String[]>] [[-BlendExpression] <String>] [[-BlendColorExpression] <String[]>] [[-BlendOpacity] <String>] [[-BlendColorOpacity] <String[]>] [<CommonParameters>]
```
---




