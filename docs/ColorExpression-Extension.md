
Extension/ColorExpression.RoughDraft.Extension.ps1
--------------------------------------------------
### Synopsis
Color Expression

---
### Description

Applies an expression to each color.

Color Expressions can be used to tweak color in a single video stream,
and can also be used to join two streams together based on the values of each pixel.

---
### Parameters
#### **ColorExpression**

Up to four Color Expressions.
Color Expressions can use the following variables:

|Name|Description|
|-|-|
|w/h|The input width/height.|
|val|The input value for the pixel component.|

Color Expressions on a single source without blending frames can also use:

|Name|Description|
|-|-|
|maxval|The maximum value for the pixel component.|
|minval|The minimum value for the pixel component.|
|negval|The negated value for the pixel component value, clipped to the minval-maxval range; it corresponds to the expression "maxval-clipval+minval".|
|clip(val)|The computed value in val, clipped to the minval-maxval range.|
|gammaval(gamma)|The computed gamma correction value of the pixel component value, clipped to the minval-maxval range. It corresponds to the expression "pow((clipval-minval)/(maxval-minval)\,gamma)*(maxval-minval)+minval"|

Color Expressions that combine sources or blend frames can also use:

|Name|Description|
|-|-|
|x|The first value for the pixel component.|
|y|The second value for the pixel component.|
|bdx|The first input video bit depth.|
|bdy|The second input video bit depth.|






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |



---
#### **ColorExpressionColorSpace**

The color expression color space.  Ignored when joining files.



Valid Values:

* rgb
* yuv






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **BlendFrameColor**

If set, will blend sucessive frames together.  Ignored when joining files.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/ColorExpression.RoughDraft.Extension.ps1 [-ColorExpression] <String[]> [[-ColorExpressionColorSpace] <String>] [-BlendFrameColor] [<CommonParameters>]
```
---




