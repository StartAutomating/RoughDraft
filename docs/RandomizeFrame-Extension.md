
Extension/RandomizeFrame.RoughDraft.Extension.ps1
-------------------------------------------------
### Synopsis
RandomizeFrame extensions

---
### Description

Flush video frames from internal cache of frames into a random order. No frame is discarded.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#random](https://ffmpeg.org/ffmpeg-filters.html#random)



---
### Parameters
#### **RandomizeFrame**

If set, will randomize frames






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **RandomizedFrameCount**

The number of frames to be randomized.  Default is 30.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **RandomizedFrameSeed**

The seet for the random number generator.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/RandomizeFrame.RoughDraft.Extension.ps1 -RandomizeFrame [[-RandomizedFrameCount] <Int32>] [[-RandomizedFrameSeed] <Int32>] [<CommonParameters>]
```
---




