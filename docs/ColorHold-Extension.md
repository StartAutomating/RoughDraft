
Extension/ColorHold.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
ColorHold Extension

---
### Description

Remove all color information for all RGB colors except for certain one.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#colorhold](https://ffmpeg.org/ffmpeg-filters.html#colorhold)



---
### Parameters
#### **ColorHold**

The color which will not be replaced with neutral gray.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
#### **ColorHoldSimilarity**

Similarity percentage with the above color. 0.01 matches only the exact key color, while 1.0 matches everything.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ColorHoldBlend**

Blend percentage. 0.0 makes pixels fully gray. Higher values result in more preserved color.



> **Type**: ```[Single]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ColorHold.RoughDraft.Extension.ps1 [-ColorHold] <String> [[-ColorHoldSimilarity] <Single>] [[-ColorHoldBlend] <Single>] [<CommonParameters>]
```
---



