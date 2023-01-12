
Extension/FillBorder.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Fill Borders.

---
### Description

Fill Borders of a video.

Borders can be filled with a -FillBorderMode and a -FillBorderColor.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#fillborders](https://ffmpeg.org/ffmpeg-filters.html#fillborders)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "a.mp4" -FillBorder -FillBorderLeft 50 -FillBorderRight 50 -FillBorderTop 40 -FillBorderBottom 40 -FillBorderMode Reflect
```

---
### Parameters
#### **FillBorder**

If set, will fill borders.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **FillBorderWidth**

The Border Width.  This value will be used for both left and right.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **FillBorderHeight**

The Border Height.  This value will be used for both top and bottom.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **FillBorderLeft**

The Border Left Coordinate.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **FillBorderRight**

The Border Right Coordinate.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
#### **FillBorderTop**

The Border Top Coordinate.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |



---
#### **FillBorderBottom**

The Border Bottom Coordinate.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |



---
#### **FillBorderMode**

The Border Fill mode Coordinate.



Valid Values:

* smear
* mirror
* fixed
* reflect
* wrap
* fade
* margins






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
#### **FillBorderColor**

The color used to fill the border.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
### Syntax
```PowerShell
Extension/FillBorder.RoughDraft.Extension.ps1 -FillBorder [[-FillBorderWidth] <Int32>] [[-FillBorderHeight] <Int32>] [[-FillBorderLeft] <Int32>] [[-FillBorderRight] <Int32>] [[-FillBorderTop] <Int32>] [[-FillBorderBottom] <Int32>] [[-FillBorderMode] <String>] [[-FillBorderColor] <String>] [<CommonParameters>]
```
---




