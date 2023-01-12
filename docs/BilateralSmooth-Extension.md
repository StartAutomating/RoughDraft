
Extension/BilateralSmooth.RoughDraft.Extension.ps1
--------------------------------------------------
### Synopsis
Bilateral Smooth

---
### Description

Applies a [bilateral](https://ffmpeg.org/ffmpeg-filters.html#bilateral) video filter, spatial smoothing while preserving edges.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#bilateral](https://ffmpeg.org/ffmpeg-filters.html#bilateral)



---
### Parameters
#### **BilateralSmooth**

If set, apply Apply bilateral filter, spatial smoothing while preserving edges






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **BilateralSmoothSpatialWeight**

Set sigma of gaussian function to calculate spatial weight. Allowed range is 0 to 512. Default is 0.1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
#### **BilateralSmoothRangeWeight**

Set sigma of gaussian function to calculate range weight. Allowed range is 0 to 1. Default is 0.1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/BilateralSmooth.RoughDraft.Extension.ps1 -BilateralSmooth [[-BilateralSmoothSpatialWeight] <Double>] [[-BilateralSmoothRangeWeight] <Single>] [<CommonParameters>]
```
---




