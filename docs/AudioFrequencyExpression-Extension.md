
Extension/AudioFrequencyExpression.RoughDraft.Extension.ps1
-----------------------------------------------------------
### Synopsis
Apply expressions to audio frequencies

---
### Description

Apply arbitrary expressions to samples in frequency domain.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#afftfilt](https://ffmpeg.org/ffmpeg-filters.html#afftfilt)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media .\a.mp3 -FrequencyExpression -FrequencyExpressionReal "hypot(re,im)*sin(0)" -FrequencyExpressionImaginary "hypot(re,im)*cos(0)" -FrequencyExpressionWindowSize 512 -FrequencyExpressionOverlap 0.75
```

---
### Parameters
#### **FrequencyExpression**

Apply arbitrary expressions to samples in frequency domain.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **FrequencyExpressionReal**

Set channels real expressions.

Each expression in real and imag can contain the following constants and functions:

|Value|Description|
|-|-|
|sr|sample rate|
|b|current frequency bin number|
|nb|number of available bins|
|ch|channel number of the current expression|
|chs|number of channels|
|pts|current frame pts|
|re|current real part of frequency bin of current channel|
|im|current imaginary part of frequency bin of current channel|
|real(b, ch)|Return the value of real part of frequency bin at location (bin,channel)|
|imag(b, ch)|Return the value of imaginary part of frequency bin at location (bin,channel)|






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |



---
#### **FrequencyExpressionImaginary**

Set channels imaginary expressions.

Each expression in real and imag can contain the following constants and functions:

|Value|Description|
|-|-|
|sr|sample rate|
|b|current frequency bin number|
|nb|number of available bins|
|ch|channel number of the current expression|
|chs|number of channels|
|pts|current frame pts|
|re|current real part of frequency bin of current channel|
|im|current imaginary part of frequency bin of current channel|
|real(b, ch)|Return the value of real part of frequency bin at location (bin,channel)|
|imag(b, ch)|Return the value of imaginary part of frequency bin at location (bin,channel)|






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |



---
#### **FrequencyExpressionWindowSize**

set window size






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **FrequencyExpressionWindowFunction**

set window function



Valid Values:

* rect
* bartlett
* hann
* hanning
* hamming
* blackman
* welch
* flattop
* bharris
* bnuttall
* bhann
* sine
* nuttall
* lanczos
* gauss'tukey
* dolph
* cauchy
* parzen
* poisson
* bohman
* kaiser






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |



---
#### **FrequencyExpressionOverlap**

set window overlap






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |5       |false        |



---
### Syntax
```PowerShell
Extension/AudioFrequencyExpression.RoughDraft.Extension.ps1 -FrequencyExpression [[-FrequencyExpressionReal] <String[]>] [[-FrequencyExpressionImaginary] <String[]>] [[-FrequencyExpressionWindowSize] <Int32>] [[-FrequencyExpressionWindowFunction] <Object>] [[-FrequencyExpressionOverlap] <Single>] [<CommonParameters>]
```
---




