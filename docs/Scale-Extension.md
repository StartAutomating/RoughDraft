
Extension/Scale.RoughDraft.Extension.ps1
----------------------------------------
### Synopsis
Scales video.

---
### Description

Scale the input video size and/or convert the image format.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#scale-1](https://ffmpeg.org/ffmpeg-filters.html#scale-1)



---
### Parameters
#### **Scale**

Scale the input video size and/or convert the image format.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ScaleWidth**

Output video width



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ScaleHeight**

Output video height



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ScaleFlags**

Flags to pass to libswscale.
See the [ffmpeg-scalar manual](https://ffmpeg.org/ffmpeg-scaler.html#sws_005fflags)



Valid Values:

* fast_bilinear
* bilinear
* bicubic
* experimental
* neighbor
* area
* bicublin
* gauss
* sinc
* lanczos
* spline
* print_info
* accurate_rnd
* full_chroma_int
* full_chroma_inp
* bitexact



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ScaleInterlacing**

Set interlacing
* 1 : forces interlaced aware scaling
* 0 : Do not apply interlaced scaling
* -1 : Select interlaced aware scaling depending on whether the source frames are flagged as interlaced or not.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ScaleInColorMatrix**

set input YCbCr type



Valid Values:

* auto
* bt709
* fcc
* bt601
* bt470
* smpte170m
* smpte240m
* bt2020



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **ScaleOutColorMatrix**

set output YCbCr type



Valid Values:

* auto
* bt709
* fcc
* bt601
* bt470
* smpte170m
* smpte240m
* bt2020



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ScaleInRange**

set input color range



Valid Values:

* auto
* unknown
* jpeg
* full
* pc
* mpeg
* limited
* tv



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **ScaleOutRange**

set output color range



Valid Values:

* auto
* unknown
* jpeg
* full
* pc
* mpeg
* limited
* tv



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **ScaleInVerticalChromaPosition**

input vertical chroma position in luma grid/256



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **ScaleInHorizontalChromaPosition**

input horizontal chroma position in luma grid/256



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **ScaleOutVerticalChromaPosition**

output vertical chroma position in luma grid/256



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **ScaleOutHorizontalChromaPosition**

output horizontal chroma position in luma grid/256



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
#### **ScaleForceOriginalAspectRatio**

decrease or increase w/h if necessary to keep the original AR



Valid Values:

* disable
* increase
* decrease



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 13

> **PipelineInput**:false



---
#### **ScaleParam0**

Scaler param 0



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 14

> **PipelineInput**:false



---
#### **ScaleParam1**

Scaler param 1



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 15

> **PipelineInput**:false



---
#### **ScaleSliceCount**

set the number of slices



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 16

> **PipelineInput**:false



---
#### **ScaleEval**

Specify when to evaluate expressions.  Either initially or every frame.



Valid Values:

* init
* frame



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 17

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Scale.RoughDraft.Extension.ps1 -Scale [[-ScaleWidth] <String>] [[-ScaleHeight] <String>] [[-ScaleFlags] <String>] [[-ScaleInterlacing] <Int32>] [[-ScaleInColorMatrix] <String>] [[-ScaleOutColorMatrix] <String>] [[-ScaleInRange] <String>] [[-ScaleOutRange] <String>] [[-ScaleInVerticalChromaPosition] <Int32>] [[-ScaleInHorizontalChromaPosition] <Int32>] [[-ScaleOutVerticalChromaPosition] <Int32>] [[-ScaleOutHorizontalChromaPosition] <Int32>] [[-ScaleForceOriginalAspectRatio] <Object>] [[-ScaleParam0] <Double>] [[-ScaleParam1] <Double>] [[-ScaleSliceCount] <Int32>] [[-ScaleEval] <Object>] [<CommonParameters>]
```
---



