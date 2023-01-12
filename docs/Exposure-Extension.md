
Extension/Exposure.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Exposure Extension

---
### Description

Adjusts video Exposure, using the [exposure filter](https://ffmpeg.org/ffmpeg-filters.html#exposure)

---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath a.mp4 -SetExposure
```

---
### Parameters
#### **SetExposure**

If set, will adjust exposure






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ExposureCorrection**

Set the exposure correction in EV. Allowed range is from -3.0 to 3.0.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
#### **ExposureBlackCorrection**

Set the black level correction.   Allowed range is from -1.0 to 1.0.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
### Syntax
```PowerShell
Extension/Exposure.RoughDraft.Extension.ps1 -SetExposure [[-ExposureCorrection] <Double>] [[-ExposureBlackCorrection] <Double>] [<CommonParameters>]
```
---




