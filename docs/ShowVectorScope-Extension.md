
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
#### EXAMPLE 1
```PowerShell
Show-Media -InputPath .\a.mp3 -ShowVectorScope
```

#### EXAMPLE 2
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



---
#### **ShowVectorScopeSize**

Specify the video size for the output.  Default value is 400x400






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **ShowVectorScopeMode**

Set the vectorscope mode.



Valid Values:

* lissajous
* lissajous_xy
* polar






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **ShowVectorScopeZoom**

Set the zoom factor.
Default value is 1.
Allowed range is [0, 10].
Values lower than 1 will auto adjust zoom factor to maximal possible value.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **ShowVectorScopeDrawMode**

Set the vectorscope drawing mode.



Valid Values:

* dot
* line






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **ShowVectorScopeScale**

Specify amplitude scale of audio samples



Valid Values:

* lin
* log
* sqrt
* cbrt






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **ShowVectorScopeSwap**

Swap left channel axis with right channel axis.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ShowVectorScopeMirror**

Mirror axis.



Valid Values:

* none
* x
* y
* xy






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **ShowVectorScopeRedContrast**

Specify the red contrast. Default values is 40.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |



---
#### **ShowVectorScopeGreenContrast**

Specify the green contrast. Default value is 160.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |8       |false        |



---
#### **ShowVectorScopeBlueContrast**

Specify the blue contrast. Default value is 80.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |



---
#### **ShowVectorScopeAlphaContrast**

Specify the alpha contrast. Default values is 255.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |



---
#### **ShowVectorScopeRedFade**

Specify the red, green, blue and alpha fade. Default values is 15.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |11      |false        |



---
#### **ShowVectorScopeGreenFade**

Specify the green fade. Default values is 10.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |12      |false        |



---
#### **ShowVectorScopeBlueFade**

Specify the blue fade. Default values is 5.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |13      |false        |



---
#### **ShowVectorScopeAlphaFade**

Specify the alpha fade. Default values is 5.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |14      |false        |



---
### Syntax
```PowerShell
Extension/ShowVectorScope.RoughDraft.Extension.ps1 -ShowVectorScope [[-ShowVectorScopeSize] <String>] [[-ShowVectorScopeMode] <String>] [[-ShowVectorScopeZoom] <Double>] [[-ShowVectorScopeDrawMode] <String>] [[-ShowVectorScopeScale] <String>] [-ShowVectorScopeSwap] [[-ShowVectorScopeMirror] <String>] [[-ShowVectorScopeRedContrast] <Int32>] [[-ShowVectorScopeGreenContrast] <Int32>] [[-ShowVectorScopeBlueContrast] <Int32>] [[-ShowVectorScopeAlphaContrast] <Int32>] [[-ShowVectorScopeRedFade] <Int32>] [[-ShowVectorScopeGreenFade] <Int32>] [[-ShowVectorScopeBlueFade] <Int32>] [[-ShowVectorScopeAlphaFade] <Int32>] [<CommonParameters>]
```
---




