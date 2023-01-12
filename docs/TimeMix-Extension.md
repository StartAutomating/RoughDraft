
Extension/TimeMix.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
Mix successive video frames.

---
### Description

Mix successive video frames, using the tmix filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#tmix](https://ffmpeg.org/ffmpeg-filters.html#tmix)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\TestSource.gif -TimeMix 5
```

---
### Parameters
#### **TimeMix**

The number of successive frames to mix.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |1       |false        |



---
#### **TimeMixFrameWeight**

Specify weight of each input video frame. 
If number of weights is smaller than number of frames last specified weight will be used for all remaining unset weights.






|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |2       |false        |



---
#### **TimeMixScale**

Specify scale, if it is set it will be multiplied with sum of each weight multiplied with pixel values to give final destination pixel value.
By default scale is auto scaled to sum of weights.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **TimeMixPlane**

Set which planes to filter. Default is all. Allowed range is from 0 to 15.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/TimeMix.RoughDraft.Extension.ps1 [-TimeMix] <Int32> [[-TimeMixFrameWeight] <Int32[]>] [[-TimeMixScale] <Int32>] [[-TimeMixPlane] <Int32>] [<CommonParameters>]
```
---




