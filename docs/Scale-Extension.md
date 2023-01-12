
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ScaleWidth**

Output video width






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **ScaleHeight**

Output video height






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **ScaleInterlacing**

Set interlacing
* 1 : forces interlaced aware scaling
* 0 : Do not apply interlaced scaling
* -1 : Select interlaced aware scaling depending on whether the source frames are flagged as interlaced or not.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
#### **ScaleInVerticalChromaPosition**

input vertical chroma position in luma grid/256






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |



---
#### **ScaleInHorizontalChromaPosition**

input horizontal chroma position in luma grid/256






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |



---
#### **ScaleOutVerticalChromaPosition**

output vertical chroma position in luma grid/256






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |11      |false        |



---
#### **ScaleOutHorizontalChromaPosition**

output horizontal chroma position in luma grid/256






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |12      |false        |



---
#### **ScaleForceOriginalAspectRatio**

decrease or increase w/h if necessary to keep the original AR



Valid Values:

* disable
* increase
* decrease






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |13      |false        |



---
#### **ScaleParam0**

Scaler param 0






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |14      |false        |



---
#### **ScaleParam1**

Scaler param 1






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |15      |false        |



---
#### **ScaleSliceCount**

set the number of slices






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |16      |false        |



---
#### **ScaleEval**

Specify when to evaluate expressions.  Either initially or every frame.



Valid Values:

* init
* frame






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |17      |false        |



---
### Syntax
```PowerShell
Extension/Scale.RoughDraft.Extension.ps1 -Scale [[-ScaleWidth] <String>] [[-ScaleHeight] <String>] [[-ScaleFlags] <String>] [[-ScaleInterlacing] <Int32>] [[-ScaleInColorMatrix] <String>] [[-ScaleOutColorMatrix] <String>] [[-ScaleInRange] <String>] [[-ScaleOutRange] <String>] [[-ScaleInVerticalChromaPosition] <Int32>] [[-ScaleInHorizontalChromaPosition] <Int32>] [[-ScaleOutVerticalChromaPosition] <Int32>] [[-ScaleOutHorizontalChromaPosition] <Int32>] [[-ScaleForceOriginalAspectRatio] <Object>] [[-ScaleParam0] <Double>] [[-ScaleParam1] <Double>] [[-ScaleSliceCount] <Int32>] [[-ScaleEval] <Object>] [<CommonParameters>]
```
---



