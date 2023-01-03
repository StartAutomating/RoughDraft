
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ShowVectorScopeSize**

Specify the video size for the output.  Default value is 400x400



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ShowVectorScopeMode**

Set the vectorscope mode.



Valid Values:

* lissajous
* lissajous_xy
* polar



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ShowVectorScopeZoom**

Set the zoom factor.
Default value is 1.
Allowed range is [0, 10].
Values lower than 1 will auto adjust zoom factor to maximal possible value.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ShowVectorScopeDrawMode**

Set the vectorscope drawing mode.



Valid Values:

* dot
* line



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ShowVectorScopeScale**

Specify amplitude scale of audio samples



Valid Values:

* lin
* log
* sqrt
* cbrt



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **ShowVectorScopeSwap**

Swap left channel axis with right channel axis.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ShowVectorScopeMirror**

Mirror axis.



Valid Values:

* none
* x
* y
* xy



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ShowVectorScopeRedContrast**

Specify the red contrast. Default values is 40.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **ShowVectorScopeGreenContrast**

Specify the green contrast. Default value is 160.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **ShowVectorScopeBlueContrast**

Specify the blue contrast. Default value is 80.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **ShowVectorScopeAlphaContrast**

Specify the alpha contrast. Default values is 255.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **ShowVectorScopeRedFade**

Specify the red, green, blue and alpha fade. Default values is 15.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **ShowVectorScopeGreenFade**

Specify the green fade. Default values is 10.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
#### **ShowVectorScopeBlueFade**

Specify the blue fade. Default values is 5.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 13

> **PipelineInput**:false



---
#### **ShowVectorScopeAlphaFade**

Specify the alpha fade. Default values is 5.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 14

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ShowVectorScope.RoughDraft.Extension.ps1 -ShowVectorScope [[-ShowVectorScopeSize] <String>] [[-ShowVectorScopeMode] <String>] [[-ShowVectorScopeZoom] <Double>] [[-ShowVectorScopeDrawMode] <String>] [[-ShowVectorScopeScale] <String>] [-ShowVectorScopeSwap] [[-ShowVectorScopeMirror] <String>] [[-ShowVectorScopeRedContrast] <Int32>] [[-ShowVectorScopeGreenContrast] <Int32>] [[-ShowVectorScopeBlueContrast] <Int32>] [[-ShowVectorScopeAlphaContrast] <Int32>] [[-ShowVectorScopeRedFade] <Int32>] [[-ShowVectorScopeGreenFade] <Int32>] [[-ShowVectorScopeBlueFade] <Int32>] [[-ShowVectorScopeAlphaFade] <Int32>] [<CommonParameters>]
```
---



