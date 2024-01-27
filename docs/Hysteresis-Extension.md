Extension/Hysteresis.RoughDraft.Extension.ps1
---------------------------------------------

### Synopsis
Hysteresis

---

### Description

Grow first stream into second stream by connecting components.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#hysteresis](https://ffmpeg.org/ffmpeg-filters.html#hysteresis)

---

### Parameters
#### **Hysteresis**
Grow first stream into second stream by connecting components.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **HysteresisPlanes**
set planes

|Type     |Required|Position|PipelineInput|Aliases          |
|---------|--------|--------|-------------|-----------------|
|`[Int32]`|false   |1       |false        |hysteresis_planes|

#### **HysteresisThreshold**
set threshold

|Type     |Required|Position|PipelineInput|Aliases             |
|---------|--------|--------|-------------|--------------------|
|`[Int32]`|false   |2       |false        |hysteresis_threshold|

---

### Syntax
```PowerShell
Extension/Hysteresis.RoughDraft.Extension.ps1 -Hysteresis [[-HysteresisPlanes] <Int32>] [[-HysteresisThreshold] <Int32>] [<CommonParameters>]
```
