
Extension/Pixelate.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Pixelate effect

---
### Description

Applies a pixelation effect, by using a chain of two scale filters

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#scale](https://ffmpeg.org/ffmpeg-filters.html#scale)



---
### Parameters
#### **Pixelate**

If set, will pixelate a video






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **PixelationWidth**

The pixelation width.  This is the number of effective pixels wide.  By default, 64






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **PixelationHeight**

The pixelation width.  This is the number of effective pixels tall.  If not provided, this will be the pixelationwidth






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/Pixelate.RoughDraft.Extension.ps1 -Pixelate [[-PixelationWidth] <Int32>] [[-PixelationHeight] <Int32>] [<CommonParameters>]
```
---




