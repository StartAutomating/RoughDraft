Extension/ShuffleFrames.RoughDraft.Extension.ps1
------------------------------------------------

### Synopsis
Shuffles frames in video

---

### Description

Shuffles frames in a video stream.

It's an extension

---

### Parameters
#### **ShuffleFrame**
Set the destination indexes of input frames. 
Number of indexes also sets maximal value that each index may have.
’-1’ index have special meaning and that is to drop frame.

|Type       |Required|Position|PipelineInput|Aliases      |
|-----------|--------|--------|-------------|-------------|
|`[Int32[]]`|true    |1       |false        |ShuffleFrames|

---

### Syntax
```PowerShell
Extension/ShuffleFrames.RoughDraft.Extension.ps1 [-ShuffleFrame] <Int32[]> [<CommonParameters>]
```
