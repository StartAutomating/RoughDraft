
Extension/LimitPixel.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Limits Pixel values

---
### Description

Limits the pixel components values to the specified range [min, max].

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#limiter](https://ffmpeg.org/ffmpeg-filters.html#limiter)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\TestSource.gif -LimitPixel -LimitPixelMin 50 -LimitPixelMax 200
```

---
### Parameters
#### **LimitPixel**

If set, will limit pixels between a range of values.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **LimitPixelMin**

Lower bound. Defaults to the lowest allowed value for the input.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **LimitPixelMax**

Upper bound. Defaults to the highest allowed value for the input.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **LimitPixelPlane**

Specify which planes will be processed. Defaults to all available.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
### Syntax
```PowerShell
Extension/LimitPixel.RoughDraft.Extension.ps1 -LimitPixel [[-LimitPixelMin] <String>] [[-LimitPixelMax] <String>] [[-LimitPixelPlane] <String>] [<CommonParameters>]
```
---




