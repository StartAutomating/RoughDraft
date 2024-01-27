Extension/Scale.RoughDraft.Extension.ps1
----------------------------------------

### Synopsis
Scales video.

---

### Description

Scale the input video size and/or convert the image format.

The values of the Width and Height options are expressions containing the following constants:

|Constant|Value|
|-:|:-|
|in_w||
|in_h|The input width and height|
|iw||
|ih|These are the same as in_w and in_h.|
|out_w||
|out_h|The output (scaled) width and height|
|ow||
|oh|These are the same as out_w and out_h|
|a|The same as iw / ih|
|sar|input sample aspect ratio|
|dar|The input display aspect ratio. Calculated from (iw / ih) * sar.|
|hsub||
|vsub|horizontal and vertical input chroma subsample values. For example for the pixel format "yuv422p" hsub is 2 and vsub is 1.|
|ohsub||
|ovsub|horizontal and vertical output chroma subsample values. For example for the pixel format "yuv422p" hsub is 2 and vsub is 1.|
|n|The (sequential) number of the input frame, starting from 0. Only available with eval=frame.|
|t|The presentation timestamp of the input frame, expressed as a number of seconds. Only available with eval=frame.|
|pos|The byte offset of the frame in the input. Only available with eval=frame.|

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

#### **ScaleWidth**
Output video width

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[String]`|false   |1       |false        |scale_w<br/>scale_width|

#### **ScaleHeight**
Output video height

|Type      |Required|Position|PipelineInput|Aliases                 |
|----------|--------|--------|-------------|------------------------|
|`[String]`|false   |2       |false        |scale_h<br/>scale_height|

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

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |3       |false        |scale_flags|

#### **ScaleInterlacing**
Set interlacing
* 1 : forces interlaced aware scaling
* 0 : Do not apply interlaced scaling
* -1 : Select interlaced aware scaling depending on whether the source frames are flagged as interlaced or not.

|Type     |Required|Position|PipelineInput|Aliases     |
|---------|--------|--------|-------------|------------|
|`[Int32]`|false   |4       |false        |scale_interl|

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

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|false   |5       |false        |scale_in_color_matrix|

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

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[String]`|false   |6       |false        |scale_out_color_matrix|

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

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |7       |false        |scale_in_range|

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

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |8       |false        |scale_out_range|

#### **ScaleInVerticalChromaPosition**
input vertical chroma position in luma grid/256

|Type     |Required|Position|PipelineInput|Aliases           |
|---------|--------|--------|-------------|------------------|
|`[Int32]`|false   |9       |false        |scale_in_v_chr_pos|

#### **ScaleInHorizontalChromaPosition**
input horizontal chroma position in luma grid/256

|Type     |Required|Position|PipelineInput|Aliases           |
|---------|--------|--------|-------------|------------------|
|`[Int32]`|false   |10      |false        |scale_in_h_chr_pos|

#### **ScaleOutVerticalChromaPosition**
output vertical chroma position in luma grid/256

|Type     |Required|Position|PipelineInput|Aliases            |
|---------|--------|--------|-------------|-------------------|
|`[Int32]`|false   |11      |false        |scale_out_v_chr_pos|

#### **ScaleOutHorizontalChromaPosition**
output horizontal chroma position in luma grid/256

|Type     |Required|Position|PipelineInput|Aliases            |
|---------|--------|--------|-------------|-------------------|
|`[Int32]`|false   |12      |false        |scale_out_h_chr_pos|

#### **ScaleForceOriginalAspectRatio**
decrease or increase w/h if necessary to keep the original AR
Valid Values:

* disable
* increase
* decrease

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[Object]`|false   |13      |false        |scale_force_original_aspect_ratio|

#### **ScaleParam0**
Scaler param 0

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Double]`|false   |14      |false        |scale_param0|

#### **ScaleParam1**
Scaler param 1

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Double]`|false   |15      |false        |scale_param1|

#### **ScaleSliceCount**
set the number of slices

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |16      |false        |scale_nb_slices|

#### **ScaleEval**
Specify when to evaluate expressions.  Either initially or every frame.
Valid Values:

* init
* frame

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Object]`|false   |17      |false        |scale_eval|

---

### Syntax
```PowerShell
Extension/Scale.RoughDraft.Extension.ps1 -Scale [[-ScaleWidth] <String>] [[-ScaleHeight] <String>] [[-ScaleFlags] <String>] [[-ScaleInterlacing] <Int32>] [[-ScaleInColorMatrix] <String>] [[-ScaleOutColorMatrix] <String>] [[-ScaleInRange] <String>] [[-ScaleOutRange] <String>] [[-ScaleInVerticalChromaPosition] <Int32>] [[-ScaleInHorizontalChromaPosition] <Int32>] [[-ScaleOutVerticalChromaPosition] <Int32>] [[-ScaleOutHorizontalChromaPosition] <Int32>] [[-ScaleForceOriginalAspectRatio] <Object>] [[-ScaleParam0] <Double>] [[-ScaleParam1] <Double>] [[-ScaleSliceCount] <Int32>] [[-ScaleEval] <Object>] [<CommonParameters>]
```
