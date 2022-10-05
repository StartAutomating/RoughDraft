
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **MandelbrotStartX**

Set the initial x position (from -100 to 100) (default -0.743644)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **MandelbrotStartY**

Set the initial y position (from -100 to 100) (default -0.131826)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **MandelbrotStartScale**

set the initial scale value (from 0 to FLT_MAX) (default 3)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **MandelbrotEndScale**

set the terminal scale value (from 0 to FLT_MAX) (default 0.3)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **MandelbrotEndPTS**

set the terminal pts value (from 0 to I64_MAX) (default 400)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **MandelbrotBailout**

set the bailout value (from 0 to FLT_MAX) (default 10)



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **MandelbrotMorphXFrequency**

set morph x frequency (from -FLT_MAX to FLT_MAX) (default 0.01)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **MandelbrotMorphYFrequency**

set morph y frequency (from -FLT_MAX to FLT_MAX) (default 0.0123)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **MandelbrotMorphAmplitude**

set morph amplitude (from -FLT_MAX to FLT_MAX) (default 0)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **MandelbrotInnerColoringMode**

set inner coloring mode (from 0 to INT_MAX) (default mincol)



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **MandelbrotOuterColoringMode**

set outer coloring mode (from 0 to INT_MAX) (default normalized_iteration_count)



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Mandelbrot.rd.ext.ps1 -Mandelbrot [[-MandelbrotStartX] <Int32>] [[-MandelbrotStartY] <Int32>] [[-MandelbrotStartScale] <Double>] [[-MandelbrotEndScale] <Double>] [[-MandelbrotEndPTS] <Double>] [[-MandelbrotBailout] <Object>] [[-MandelbrotMorphXFrequency] <Double>] [[-MandelbrotMorphYFrequency] <Double>] [[-MandelbrotMorphAmplitude] <Double>] [[-MandelbrotInnerColoringMode] <Object>] [[-MandelbrotOuterColoringMode] <Object>] [<CommonParameters>]
```
---



