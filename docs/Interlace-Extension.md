Extension/Interlace.RoughDraft.Extension.ps1
--------------------------------------------

### Synopsis
Interlace Extension

---

### Description

Apply Interlace effect to the video.

Simple interlacing filter from progressive contents. 

This interleaves upper (or lower) lines from odd frames with 
lower (or upper) lines from even frames.

This halves the frame rate and preserves the image height.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#interlace_002c-interlace_005fvulkan](https://ffmpeg.org/ffmpeg-filters.html#interlace_002c-interlace_005fvulkan)

---

### Parameters
#### **Interlace**
If set, will use the interlace video filter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **InterlaceScan**
This determines whether the interlaced frame is taken from the 
even (tff - default) or odd (bff) lines of the progressive frame.
`bff` may feel like it is jumping back in time.
`tff` may feel like it is jumping forward in time.
Valid Values:

* bff
* tff

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **InterlaceLowPass**
Vertical lowpass filter to avoid twitter interlacing and reduce moire patterns.
`off` will not filter
`linear` blends the interlace.
`complex` smoothes the interface.
Valid Values:

* 0
* off
* 1
* linear
* 2
* complex

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Extension/Interlace.RoughDraft.Extension.ps1 -Interlace [[-InterlaceScan] <String>] [[-InterlaceLowPass] <String>] [<CommonParameters>]
```
