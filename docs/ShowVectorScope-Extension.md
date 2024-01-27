Extension/ShowVectorScope.RoughDraft.Extension.ps1
--------------------------------------------------

### Synopsis
Shows a Vector Scope of the Audio

---

### Description

Shows a Vector Scope of the Audio, using the [avectorscope filter](https://ffmpeg.org/ffmpeg-filters.html#avectorscope)

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#avectorscope](https://ffmpeg.org/ffmpeg-filters.html#avectorscope)

---

### Examples
> EXAMPLE 1

```PowerShell
Show-Media -InputPath .\a.mp3 -ShowVectorScope
```
> EXAMPLE 2

```PowerShell
Edit-Media -InputPath .\a.mp3 -ShowVectorScope -OutputPath .\a.mp4
```

---

### Parameters
#### **ShowVectorScope**
If set, will show volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ShowVectorScopeSize**
Specify the video size for the output.  Default value is 400x400

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[String]`|false   |1       |false        |avectorscope_size|

#### **ShowVectorScopeMode**
Set the vectorscope mode.
Valid Values:

* lissajous
* lissajous_xy
* polar

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[String]`|false   |2       |false        |avectorscope_mode|

#### **ShowVectorScopeZoom**
Set the zoom factor.
Default value is 1.
Allowed range is [0, 10].
Values lower than 1 will auto adjust zoom factor to maximal possible value.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Double]`|false   |3       |false        |avectorscope_zoom|

#### **ShowVectorScopeDrawMode**
Set the vectorscope drawing mode.
Valid Values:

* dot
* line

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[String]`|false   |4       |false        |avectorscope_draw|

#### **ShowVectorScopeScale**
Specify amplitude scale of audio samples
Valid Values:

* lin
* log
* sqrt
* cbrt

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[String]`|false   |5       |false        |avectorscope_scale|

#### **ShowVectorScopeSwap**
Swap left channel axis with right channel axis.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|false   |named   |false        |avectorscope_swap|

#### **ShowVectorScopeMirror**
Mirror axis.
Valid Values:

* none
* x
* y
* xy

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |6       |false        |avectorscope_mirror|

#### **ShowVectorScopeRedContrast**
Specify the red contrast. Default values is 40.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |7       |false        |avectorscope_rc|

#### **ShowVectorScopeGreenContrast**
Specify the green contrast. Default value is 160.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |8       |false        |avectorscope_gc|

#### **ShowVectorScopeBlueContrast**
Specify the blue contrast. Default value is 80.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |9       |false        |avectorscope_bc|

#### **ShowVectorScopeAlphaContrast**
Specify the alpha contrast. Default values is 255.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |10      |false        |avectorscope_ac|

#### **ShowVectorScopeRedFade**
Specify the red, green, blue and alpha fade. Default values is 15.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |11      |false        |avectorscope_rf|

#### **ShowVectorScopeGreenFade**
Specify the green fade. Default values is 10.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |12      |false        |avectorscope_gf|

#### **ShowVectorScopeBlueFade**
Specify the blue fade. Default values is 5.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |13      |false        |avectorscope_bf|

#### **ShowVectorScopeAlphaFade**
Specify the alpha fade. Default values is 5.

|Type     |Required|Position|PipelineInput|Aliases        |
|---------|--------|--------|-------------|---------------|
|`[Int32]`|false   |14      |false        |avectorscope_af|

---

### Syntax
```PowerShell
Extension/ShowVectorScope.RoughDraft.Extension.ps1 -ShowVectorScope [[-ShowVectorScopeSize] <String>] [[-ShowVectorScopeMode] <String>] [[-ShowVectorScopeZoom] <Double>] [[-ShowVectorScopeDrawMode] <String>] [[-ShowVectorScopeScale] <String>] [-ShowVectorScopeSwap] [[-ShowVectorScopeMirror] <String>] [[-ShowVectorScopeRedContrast] <Int32>] [[-ShowVectorScopeGreenContrast] <Int32>] [[-ShowVectorScopeBlueContrast] <Int32>] [[-ShowVectorScopeAlphaContrast] <Int32>] [[-ShowVectorScopeRedFade] <Int32>] [[-ShowVectorScopeGreenFade] <Int32>] [[-ShowVectorScopeBlueFade] <Int32>] [[-ShowVectorScopeAlphaFade] <Int32>] [<CommonParameters>]
```
