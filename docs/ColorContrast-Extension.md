
Extension/ColorContrast.RoughDraft.Extension.ps1
------------------------------------------------
### Synopsis
ColorContrast Extension

---
### Description

Adjusts color contrast

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#colorcontrast](https://ffmpeg.org/ffmpeg-filters.html#colorcontrast)



---
### Parameters
#### **ColorContrast**

If set, will adjust color contrast



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **RedCyanColorContrast**

The constrast between Red and Cyan.  Valid between -1 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **GreenMagentaColorContrast**

The constrast between Green and Magenta.  Valid between -1 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **BlueYellowColorContrast**

The constrast between Blue and Yellow.  Valid between -1 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **RedCyanConstrastWeight**

The weight of the constrast between Red and Cyan.  Valid between 0 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **GreenMagentaConstrastWeight**

The weight of the constrast between Green and Magenta.  Valid between 0 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **BlueYellowConstrastWeight**

The weight of the constrast between Blue and Yellow.  Valid between 0 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ColorContrastPreserveLightness**

The amount of lightness that should be preserved.  Valid between 0 and 1.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ColorContrast.RoughDraft.Extension.ps1 -ColorContrast [[-RedCyanColorContrast] <Single>] [[-GreenMagentaColorContrast] <Single>] [[-BlueYellowColorContrast] <Single>] [[-RedCyanConstrastWeight] <Single>] [[-GreenMagentaConstrastWeight] <Single>] [[-BlueYellowConstrastWeight] <Single>] [[-ColorContrastPreserveLightness] <Single>] [<CommonParameters>]
```
---



