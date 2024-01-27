Extension/Tempo.RoughDraft.Extension.ps1
----------------------------------------

### Synopsis
Adjust audio tempo.

---

### Description

Adjust audio tempo using the atempo filter.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#atempo](https://ffmpeg.org/ffmpeg-filters.html#atempo)

---

### Parameters
#### **AudioTempo**
Adjust audio tempo.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Double]`|true    |1       |false        |atempo_tempo|

---

### Syntax
```PowerShell
Extension/Tempo.RoughDraft.Extension.ps1 [-AudioTempo] <Double> [<CommonParameters>]
```
