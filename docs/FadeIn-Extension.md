
Extension/FadeIn.rd.ext.ps1
---------------------------
### Synopsis
Fades in video

---
### Description

Fades in video, using the fade filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#fade](https://ffmpeg.org/ffmpeg-filters.html#fade)



---
### Parameters
#### **FadeIn**

If provided, the video will be faded in






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **StartFadeAt**

The frame the fade-in will start (by default, 0)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |1       |false        |



---
#### **EndFadeAt**

The frame the fade-in will end (by default, 30)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |2       |false        |



---
#### **FadeColor**

The fade color






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
### Syntax
```PowerShell
Extension/FadeIn.rd.ext.ps1 -FadeIn [[-StartFadeAt] <UInt32>] [[-EndFadeAt] <UInt32>] [[-FadeColor] <String>] [<CommonParameters>]
```
---




