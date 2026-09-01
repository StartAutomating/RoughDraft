Extension/Deinterlace.RoughDraft.Extension.ps1
----------------------------------------------

### Synopsis
Deinterlace Extension

---

### Description

Deinterlace input video by applying Donald Graft’s adaptive kernel deinterling.
Work on interlaced parts of a video to produce progressive frames.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#interlace_002c-interlace_005fvulkan](https://ffmpeg.org/ffmpeg-filters.html#interlace_002c-interlace_005fvulkan)

---

### Parameters
#### **Deinterlace**
If set, will use the interlace video filter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **DeinterlaceThreshold**
Set the threshold which affects the filter’s tolerance when determining if a pixel line must be processed.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Byte]`|false   |1       |false        |

#### **DeinterlaceMap**
Paint pixels exceeding the threshold value to white if set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DeinterlaceOrder**
Set the fields order.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DeinterlaceSharp**
Enable additional sharpening

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DeinterlaceTwoWay**
Enable twoway sharpening

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Extension/Deinterlace.RoughDraft.Extension.ps1 -Deinterlace [[-DeinterlaceThreshold] <Byte>] [-DeinterlaceMap] [-DeinterlaceOrder] [-DeinterlaceSharp] [-DeinterlaceTwoWay] [<CommonParameters>]
```
