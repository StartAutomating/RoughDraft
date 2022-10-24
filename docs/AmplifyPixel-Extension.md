
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **AmplifyPixelRadius**

Set frame radius. Default is 2. Allowed range is from 1 to 63. For example radius of 3 will instruct filter to calculate average of 7 frames.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **AmplifyPixelFactor**

Set factor to amplify difference. Default is 2



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **AmplifyPixelThreshold**

Set threshold for difference amplification.
Any difference greater or equal to this value will not alter source pixel.
Default is 10.
Allowed range is from 0 to 65535.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **AmplifyPixelTolerance**

Set tolerance for difference amplification.
Any difference lower to this value will not alter source pixel.
Default is 0. Allowed range is from 0 to 65535.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **AmplifyPixelLow**

Set lower limit for changing source pixel.
Default is 65535.
Allowed range is from 0 to 65535.
This option controls maximum possible value that will decrease source pixel value



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **AmplifyPixelHigh**

Set high limit for changing source pixel.
Default is 65535.
Allowed range is from 0 to 65535.
This option controls maximum possible value that will decrease source pixel value



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **AmplifyPixelPlanes**

Set which planes to filter. Default is all. Allowed range is from 0 to 15.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/AmplifyPixel.RoughDraft.Extension.ps1 -AmplifyPixel [[-AmplifyPixelRadius] <Int32>] [[-AmplifyPixelFactor] <Int32>] [[-AmplifyPixelThreshold] <Int32>] [[-AmplifyPixelTolerance] <Int32>] [[-AmplifyPixelLow] <Int32>] [[-AmplifyPixelHigh] <Int32>] [[-AmplifyPixelPlanes] <String>] [<CommonParameters>]
```
---




