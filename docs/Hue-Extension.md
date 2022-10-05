
Extension/Hue.RoughDraft.Extension.ps1
--------------------------------------
### Synopsis
Hue Extension

---
### Description

Adjusts the Hue of a video source

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#hue](https://ffmpeg.org/ffmpeg-filters.html#hue)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "TestSource.mp4" -SetHue -HueDegree 60 # Adjust hue by 60 degrees
```

---
### Parameters
#### **SetHue**

If set, will change hue levels.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **HueDegree**

The adjustment to the hue (in degrees).  Can include expressions.  Mutually exclusive with -HueRadian.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **HueRadian**

The adjustment to the hue (in radians).  Can include expressions.  Mutually exclusive with -HueDegree.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **Saturation**

The adjustment to the saturation.  Can include expressions.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **Brightness**

The adjustment to the brightness.  Can include expressions.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Hue.RoughDraft.Extension.ps1 -SetHue [[-HueDegree] <String>] [[-HueRadian] <String>] [[-Saturation] <String>] [[-Brightness] <String>] [<CommonParameters>]
```
---



