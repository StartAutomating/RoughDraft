
Extension/DrawText.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Draws Text on Video

---
### Description

Draws Text on Video, using the [drawtext filter](http://ffmpeg.org/ffmpeg-filters.html#drawtext)

---
### Related Links
* [http://ffmpeg.org/ffmpeg-filters.html#drawtext](http://ffmpeg.org/ffmpeg-filters.html#drawtext)



---
### Examples
#### EXAMPLE 1
```PowerShell
New-Media -Color "Black" -Duration "00:00:05" -Resolution 1920x1080 -OutputPath .\BlackBackground.mp4 |
    Edit-Media -DrawText -DrawTextText "Hello World" -DrawTextCenter -DrawTextFontSize 36
```

---
### Parameters
#### **DrawText**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **DrawTextFontFile**

set font file






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **DrawTextText**

set text






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **DrawTextTextFile**

set text file






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **DrawTextFontColor**

set foreground color (default "black")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **DrawTextFontColorExpression**

set foreground color expression (default "")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **DrawTextBoxColor**

set box color (default "white")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **DrawTextBorderColor**

set border color (default "black")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
#### **DrawTextShadowColor**

set shadow color (default "black")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
#### **DrawTextBox**

set box (default false)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **DrawTextBoxBorderWidth**

set box border width (from INT_MIN to INT_MAX) (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |



---
#### **DrawTextLineSpacing**

set line spacing in pixels (from INT_MIN to INT_MAX) (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |



---
#### **DrawTextFontSize**

set font size






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |



---
#### **DrawTextX**

set x expression (default "0")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |



---
#### **DrawTextY**

set y expression (default "0")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |



---
#### **DrawTextShadowX**

set shadow x offset (from INT_MIN to INT_MAX) (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |14      |false        |



---
#### **DrawTextShadowY**

set shadow y offset (from INT_MIN to INT_MAX) (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |15      |false        |



---
#### **DrawTextBorderWidth**

set border width (from INT_MIN to INT_MAX) (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |16      |false        |



---
#### **DrawTextTabSize**

set tab size (from 0 to INT_MAX) (default 4)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |17      |false        |



---
#### **DrawTextBasetime**

set base time (from I64_MIN to I64_MAX) (default I64_MIN)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |18      |false        |



---
#### **DrawTextFont**

Font name (default "Sans")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |



---
#### **DrawTextExpansion**

set the expansion mode (from 0 to 2) (default normal)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |20      |false        |



---
#### **DrawTextTimeCode**

set initial timecode






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |21      |false        |



---
#### **DrawTextTc24hmax**

set 24 hours max (timecode only) (default false)






|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |22      |false        |



---
#### **DrawTextTimecodeRate**

set rate (timecode only) (from 0 to INT_MAX) (default 0/1)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |23      |false        |



---
#### **DrawTextRate**

set rate (timecode only) (from 0 to INT_MAX) (default 0/1)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |24      |false        |



---
#### **DrawTextReload**

reload text file for each frame (default false)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **DrawTextAlpha**

apply alpha while rendering (default "1")






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |



---
#### **DrawTextFixBounds**

check and fix text coords to avoid clipping (default false)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **DrawTextStartNumber**

start frame number for n/frame_num variable (from 0 to INT_MAX) (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |26      |false        |



---
#### **DrawTextTextSource**

the source of text






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |27      |false        |



---
#### **DrawTextTextShaping**

attempt to shape text before drawing (default true)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **DrawTextFontLoadFlags**

set font loading flags for libfreetype (default 0)






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |28      |false        |



---
#### **DrawTextCenter**

If set, will draw text in the center.  
This will provide -DrawTextX '(w-text_w)/2' and -DrawTextY '(h-text_h)/2'






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/DrawText.RoughDraft.Extension.ps1 -DrawText [[-DrawTextFontFile] <String>] [[-DrawTextText] <String>] [[-DrawTextTextFile] <String>] [[-DrawTextFontColor] <String>] [[-DrawTextFontColorExpression] <String>] [[-DrawTextBoxColor] <String>] [[-DrawTextBorderColor] <String>] [[-DrawTextShadowColor] <String>] [-DrawTextBox] [[-DrawTextBoxBorderWidth] <Int32>] [[-DrawTextLineSpacing] <Int32>] [[-DrawTextFontSize] <String>] [[-DrawTextX] <String>] [[-DrawTextY] <String>] [[-DrawTextShadowX] <Int32>] [[-DrawTextShadowY] <Int32>] [[-DrawTextBorderWidth] <Int32>] [[-DrawTextTabSize] <Int32>] [[-DrawTextBasetime] <Int64>] [[-DrawTextFont] <String>] [[-DrawTextExpansion] <Int32>] [[-DrawTextTimeCode] <String>] [[-DrawTextTc24hmax] <Boolean>] [[-DrawTextTimecodeRate] <Double>] [[-DrawTextRate] <Double>] [-DrawTextReload] [[-DrawTextAlpha] <String>] [-DrawTextFixBounds] [[-DrawTextStartNumber] <Int32>] [[-DrawTextTextSource] <String>] [-DrawTextTextShaping] [[-DrawTextFontLoadFlags] <Int32>] [-DrawTextCenter] [<CommonParameters>]
```
---




