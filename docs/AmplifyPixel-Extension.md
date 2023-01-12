
Extension/AmplifyPixel.RoughDraft.Extension.ps1
-----------------------------------------------
### Synopsis
AmplifyPixel extension

---
### Description

Amplify differences between current pixel and pixels of adjacent frames in same pixel location.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#amplify](https://ffmpeg.org/ffmpeg-filters.html#amplify)



---
### Parameters
#### **AmplifyPixel**

If set, will amplify the differences between current pixel and pixels of adjacent frames in same pixel location.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **AmplifyPixelRadius**

Set frame radius. Default is 2. Allowed range is from 1 to 63. For example radius of 3 will instruct filter to calculate average of 7 frames.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **AmplifyPixelFactor**

Set factor to amplify difference. Default is 2






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **AmplifyPixelThreshold**

Set threshold for difference amplification.
Any difference greater or equal to this value will not alter source pixel.
Default is 10.
Allowed range is from 0 to 65535.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **AmplifyPixelTolerance**

Set tolerance for difference amplification.
Any difference lower to this value will not alter source pixel.
Default is 0. Allowed range is from 0 to 65535.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
#### **AmplifyPixelLow**

Set lower limit for changing source pixel.
Default is 65535.
Allowed range is from 0 to 65535.
This option controls maximum possible value that will decrease source pixel value






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |



---
#### **AmplifyPixelHigh**

Set high limit for changing source pixel.
Default is 65535.
Allowed range is from 0 to 65535.
This option controls maximum possible value that will decrease source pixel value






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |



---
#### **AmplifyPixelPlanes**

Set which planes to filter. Default is all. Allowed range is from 0 to 15.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
### Syntax
```PowerShell
Extension/AmplifyPixel.RoughDraft.Extension.ps1 -AmplifyPixel [[-AmplifyPixelRadius] <Int32>] [[-AmplifyPixelFactor] <Int32>] [[-AmplifyPixelThreshold] <Int32>] [[-AmplifyPixelTolerance] <Int32>] [[-AmplifyPixelLow] <Int32>] [[-AmplifyPixelHigh] <Int32>] [[-AmplifyPixelPlanes] <String>] [<CommonParameters>]
```
---




