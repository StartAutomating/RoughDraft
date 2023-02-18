
Extension/AudioExpression.RoughDraft.Extension.ps1
--------------------------------------------------
### Synopsis
Evaluates Audio Expressions

---
### Description

Generate or Modify an audio signal using an expression.

All Expressions can use the following variables:

|Variable|Description|
|-:|:-|
|ch             |channel number of the current expression|
|n              |number of the evaluated sample, starting from 0|
|s              |sample rate|
|t              |time of the evaluated sample expressed in seconds|
|nb_in_channels||
|nb_out_channels|input and output number of channels|
|val(CH)        |the value of input channel with number CH|

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#aevalsrc](https://ffmpeg.org/ffmpeg-filters.html#aevalsrc)



* [https://ffmpeg.org/ffmpeg-filters.html#aeval](https://ffmpeg.org/ffmpeg-filters.html#aeval)



---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -AudioExpression "-2+random(0)" # Play white noise
```

#### EXAMPLE 2
```PowerShell
Show-Media -AudioExpression "0.5*tan(PI*(360-2.5/2)*t)"
```

#### EXAMPLE 3
```PowerShell
New-Media -AudioExpression "0.5*sin(PI*(720-2.5/2)*t)","0.5*cos(2*PI*(360+2.5/2)*t)" -OutputPath .\Test.mp3 -Duration "00:00:15"
```

#### EXAMPLE 4
```PowerShell
Edit-Media -AudioExpression "val(0)","-val(1)" -InputPath .\Test.mp3
```

---
### Parameters
#### **AudioExpression**

The audio expression.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |



---
#### **AudioExpressionChannelLayout**

Set the channel layout. The number of channels in the specified layout must be equal to the number of specified expressions.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |



---
#### **AudioExpressionSampleCount**

Set the number of samples per channel per each output frame, default to 1024.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **AudioExpressionSampleRate**

Specify the sample rate, default to 44100.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/AudioExpression.RoughDraft.Extension.ps1 [-AudioExpression] <String[]> [[-AudioExpressionChannelLayout] <String[]>] [[-AudioExpressionSampleCount] <Int32>] [[-AudioExpressionSampleRate] <Int32>] [<CommonParameters>]
```
---




