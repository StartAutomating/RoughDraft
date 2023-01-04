
Extension/ShowScale.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
Show the tonal scale of the audio

---
### Description

Show the tonal scale of the audio, using the showcqt filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#showqct](https://ffmpeg.org/ffmpeg-filters.html#showqct)



---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -InputPath .\a.mp3 -ShowScale
```

#### EXAMPLE 2
```PowerShell
Edit-Media -InputPath .\a.mp3 -ShowScale -OutputPath .\a.mp4
```

---
### Parameters
#### **ShowScale**

If set, will show volume



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **ShowScaleSize**

Specify the video size for the output.  Default value is 1920x1080



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **ShowScaleBarGraphHeight**

Set the bargraph height. It must be even. Default value is -1 which computes the bargraph height automatically.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **ShowScaleAxisHeight**

Set the axis height. It must be even. Default value is -1 which computes the axis height automatically.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **ShowScaleSonogramHeight**

Set the sonogram height. It must be even. Default value is -1 which computes the sonogram height automatically.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **ShowScaleSonogramVolume**

Specify the sonogram volume expression

It can contain variables:

|Variable|Description|
|-|-|
|bar_v|the bar_v evaluated expression|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|

and functions:

|Function|Description|
|-|-|
|a_weighting(f)|A-weighting of equal loudness|
|b_weighting(f)|B-weighting of equal loudness|
|c_weighting(f)|C-weighting of equal loudness|



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **ShowScaleBarGraphVolume**

Specify the bargraph volume expression

It can contain variables:

|Variable|Description|
|-|-|
|bar_v|the bar_v evaluated expression|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|

and functions:

|Function|Description|
|-|-|
|a_weighting(f)|A-weighting of equal loudness|
|b_weighting(f)|B-weighting of equal loudness|
|c_weighting(f)|C-weighting of equal loudness|



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **ShowScaleSonogramGamma**

Specify the sonogram gamma. Lower gamma makes the spectrum more contrast, higher gamma makes the spectrum having more range. Default value is 3. Acceptable range is [1, 7].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **ShowScaleBarGraphGamma**

Specify the bargraph gamma. Default value is 1.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **ShowScaleBarGraphTransparency**

Specify the bargraph transparency level. Lower value makes the bargraph sharper. Default value is 1



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **ShowScaleTimeclamp**

Specify the transform timeclamp.
At low frequency, there is trade-off between accuracy in time domain and frequency domain.
If timeclamp is lower, event in time domain is represented more accurately (such as fast bass drum),
otherwise event in frequency domain is represented more accurately (such as bass guitar).
Acceptable range is [0.002, 1]. Default value is 0.17.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **ShowScaleAttack**

Set attack time in seconds.
The default is 0 (disabled).
Otherwise, it limits future samples by applying asymmetric windowing in time domain,
useful when low latency is required. Accepted range is [0, 1].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **ShowScaleBaseFrequency**

Specify the transform base frequency.
Default value is 20.01523126408007475, which is frequency 50 cents below E0.
Acceptable range is [10, 100000].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
#### **ShowScaleEndFrequency**

Specify the transform end frequency.
Default value is 20495.59681441799654, which is frequency 50 cents above D#10
Acceptable range is [10, 100000].



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 13

> **PipelineInput**:false



---
#### **ShowScaleTransformLength**

Specify the transform length in time domain.

Use this option to control accuracy trade-off between time domain and frequency domain at every frequency sample.


It can contain variables:


|Variable|Description|
|-|-|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|



> **Type**: ```[String]```

> **Required**: false

> **Position**: 14

> **PipelineInput**:false



---
#### **ShowScaleTransformCount**

Specify the transform count for every video frame. Default value is 6. Acceptable range is [1, 30].



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 15

> **PipelineInput**:false



---
#### **ShowScaleTransformPixelCount**

Specify the transform count for every single pixel. Default value is 0, which makes it computed automatically. Acceptable range is [0, 10].



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 16

> **PipelineInput**:false



---
#### **ShowScaleColorspace**

Set colorspace.



Valid Values:

* unspecified
* bt709
* fcc
* bt470bg
* smpte170m
* smpte240m
* bt2020ncl



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 17

> **PipelineInput**:false



---
#### **ShowScaleFont**

Specify fontconfig pattern. This has lower priority than fontfile.
The : in the pattern may be replaced by | to avoid unnecessary escaping



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 18

> **PipelineInput**:false



---
#### **ShowScaleFontFile**

Specify font file for use with freetype to draw the axis.
If not specified, use embedded font.
Note that drawing with font file or embedded font is not implemented with custom basefreq and endfreq, use axisfile option instead.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 19

> **PipelineInput**:false



---
#### **ShowScaleAxisFile**

Specify image file to draw the axis. This option override fontfile and fontcolor option.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 20

> **PipelineInput**:false



---
#### **ShowScaleHideAxis**

Enable/disable drawing text to the axis.
If it is set to 0, drawing to the axis is disabled, ignoring fontfile and axisfile option.
Default value is 1.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ShowScaleFontColorExpression**

Specify font color expression.

This is arithmetic expression that should return integer value 0xRRGGBB.

It can contain variables:

It can contain variables:

|Variable|Description|
|-|-|
|frequency, freq, f|the frequency where it is evaluated|
|timeclamp, tc|the value of timeclamp option|

and functions:

|Function|Description|
|-|-|
|midi(f)|midi number of frequency f, some midi numbers: E0(16), C1(24), C2(36), A4(69)|
|r(x), g(x), b(x)|red, green, and blue value of intensity x.|

Default value is st(0, (midi(f)-59.5)/12); st(1, if(between(ld(0),0,1), 0.5-0.5*cos(2*PI*ld(0)), 0)); r(1-ld(1)) + b(ld(1)).



> **Type**: ```[String]```

> **Required**: false

> **Position**: 21

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ShowScale.RoughDraft.Extension.ps1 -ShowScale [[-ShowScaleSize] <String>] [[-ShowScaleBarGraphHeight] <Int32>] [[-ShowScaleAxisHeight] <Int32>] [[-ShowScaleSonogramHeight] <Int32>] [[-ShowScaleSonogramVolume] <String>] [[-ShowScaleBarGraphVolume] <String>] [[-ShowScaleSonogramGamma] <Double>] [[-ShowScaleBarGraphGamma] <Double>] [[-ShowScaleBarGraphTransparency] <Double>] [[-ShowScaleTimeclamp] <Double>] [[-ShowScaleAttack] <Double>] [[-ShowScaleBaseFrequency] <Double>] [[-ShowScaleEndFrequency] <Double>] [[-ShowScaleTransformLength] <String>] [[-ShowScaleTransformCount] <Int32>] [[-ShowScaleTransformPixelCount] <Int32>] [[-ShowScaleColorspace] <Int32>] [[-ShowScaleFont] <String[]>] [[-ShowScaleFontFile] <String>] [[-ShowScaleAxisFile] <String>] [-ShowScaleHideAxis] [[-ShowScaleFontColorExpression] <String>] [<CommonParameters>]
```
---



