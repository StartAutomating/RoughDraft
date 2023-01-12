
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **RedCyanColorContrast**

The constrast between Red and Cyan.  Valid between -1 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
#### **GreenMagentaColorContrast**

The constrast between Green and Magenta.  Valid between -1 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
#### **BlueYellowColorContrast**

The constrast between Blue and Yellow.  Valid between -1 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |3       |false        |



---
#### **RedCyanConstrastWeight**

The weight of the constrast between Red and Cyan.  Valid between 0 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |4       |false        |



---
#### **GreenMagentaConstrastWeight**

The weight of the constrast between Green and Magenta.  Valid between 0 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |5       |false        |



---
#### **BlueYellowConstrastWeight**

The weight of the constrast between Blue and Yellow.  Valid between 0 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |6       |false        |



---
#### **ColorContrastPreserveLightness**

The amount of lightness that should be preserved.  Valid between 0 and 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |7       |false        |



---
### Syntax
```PowerShell
Extension/ColorContrast.RoughDraft.Extension.ps1 -ColorContrast [[-RedCyanColorContrast] <Single>] [[-GreenMagentaColorContrast] <Single>] [[-BlueYellowColorContrast] <Single>] [[-RedCyanConstrastWeight] <Single>] [[-GreenMagentaConstrastWeight] <Single>] [[-BlueYellowConstrastWeight] <Single>] [[-ColorContrastPreserveLightness] <Single>] [<CommonParameters>]
```
---




