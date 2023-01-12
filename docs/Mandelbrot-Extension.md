
Extension/Mandelbrot.rd.ext.ps1
-------------------------------
### Synopsis
Generates fractals

---
### Description

Generates fractals using the mandelbrot filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#mandelbrot](https://ffmpeg.org/ffmpeg-filters.html#mandelbrot)



---
### Examples
#### EXAMPLE 1
```PowerShell
New-Media -OutputPath "Mandelbrot.gif" -Duration "00:00:05" -Mandelbrot
```

---
### Parameters
#### **Mandelbrot**

The type of fractal source






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **MandelbrotStartX**

Set the initial x position (from -100 to 100) (default -0.743644)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **MandelbrotStartY**

Set the initial y position (from -100 to 100) (default -0.131826)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **MandelbrotStartScale**

set the initial scale value (from 0 to FLT_MAX) (default 3)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **MandelbrotEndScale**

set the terminal scale value (from 0 to FLT_MAX) (default 0.3)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



---
#### **MandelbrotEndPTS**

set the terminal pts value (from 0 to I64_MAX) (default 400)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |



---
#### **MandelbrotBailout**

set the bailout value (from 0 to FLT_MAX) (default 10)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |



---
#### **MandelbrotMorphXFrequency**

set morph x frequency (from -FLT_MAX to FLT_MAX) (default 0.01)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |



---
#### **MandelbrotMorphYFrequency**

set morph y frequency (from -FLT_MAX to FLT_MAX) (default 0.0123)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |8       |false        |



---
#### **MandelbrotMorphAmplitude**

set morph amplitude (from -FLT_MAX to FLT_MAX) (default 0)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |9       |false        |



---
#### **MandelbrotInnerColoringMode**

set inner coloring mode (from 0 to INT_MAX) (default mincol)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |



---
#### **MandelbrotOuterColoringMode**

set outer coloring mode (from 0 to INT_MAX) (default normalized_iteration_count)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |false        |



---
### Syntax
```PowerShell
Extension/Mandelbrot.rd.ext.ps1 -Mandelbrot [[-MandelbrotStartX] <Int32>] [[-MandelbrotStartY] <Int32>] [[-MandelbrotStartScale] <Double>] [[-MandelbrotEndScale] <Double>] [[-MandelbrotEndPTS] <Double>] [[-MandelbrotBailout] <Object>] [[-MandelbrotMorphXFrequency] <Double>] [[-MandelbrotMorphYFrequency] <Double>] [[-MandelbrotMorphAmplitude] <Double>] [[-MandelbrotInnerColoringMode] <Object>] [[-MandelbrotOuterColoringMode] <Object>] [<CommonParameters>]
```
---




