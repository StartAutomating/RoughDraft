
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



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



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



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



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **BlendExpression**

The blend expression



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **BlendColorExpression**

The blend expressions for a given color



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **BlendOpacity**

The blend opacity.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **BlendColorOpacity**

The blend opacity for a given color.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/BlendVideo.RoughDraft.Extension.ps1 -BlendVideo [[-BlendMode] <String>] [[-BlendColorMode] <String[]>] [[-BlendExpression] <String>] [[-BlendColorExpression] <String[]>] [[-BlendOpacity] <String>] [[-BlendColorOpacity] <String[]>] [<CommonParameters>]
```
---




