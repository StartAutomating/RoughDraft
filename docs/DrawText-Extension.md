
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

> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **DrawTextFontFile**

set font file



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **DrawTextText**

set text



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **DrawTextTextFile**

set text file



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **DrawTextFontColor**

set foreground color (default "black")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **DrawTextFontColorExpression**

set foreground color expression (default "")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **DrawTextBoxColor**

set box color (default "white")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **DrawTextBorderColor**

set border color (default "black")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **DrawTextShadowColor**

set shadow color (default "black")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **DrawTextBox**

set box (default false)



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **DrawTextBoxBorderWidth**

set box border width (from INT_MIN to INT_MAX) (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **DrawTextLineSpacing**

set line spacing in pixels (from INT_MIN to INT_MAX) (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **DrawTextFontSize**

set font size



> **Type**: ```[String]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **DrawTextX**

set x expression (default "0")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
#### **DrawTextY**

set y expression (default "0")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 13

> **PipelineInput**:false



---
#### **DrawTextShadowX**

set shadow x offset (from INT_MIN to INT_MAX) (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 14

> **PipelineInput**:false



---
#### **DrawTextShadowY**

set shadow y offset (from INT_MIN to INT_MAX) (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 15

> **PipelineInput**:false



---
#### **DrawTextBorderWidth**

set border width (from INT_MIN to INT_MAX) (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 16

> **PipelineInput**:false



---
#### **DrawTextTabSize**

set tab size (from 0 to INT_MAX) (default 4)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 17

> **PipelineInput**:false



---
#### **DrawTextBasetime**

set base time (from I64_MIN to I64_MAX) (default I64_MIN)



> **Type**: ```[Int64]```

> **Required**: false

> **Position**: 18

> **PipelineInput**:false



---
#### **DrawTextFont**

Font name (default "Sans")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 19

> **PipelineInput**:false



---
#### **DrawTextExpansion**

set the expansion mode (from 0 to 2) (default normal)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 20

> **PipelineInput**:false



---
#### **DrawTextTimeCode**

set initial timecode



> **Type**: ```[String]```

> **Required**: false

> **Position**: 21

> **PipelineInput**:false



---
#### **DrawTextTc24hmax**

set 24 hours max (timecode only) (default false)



> **Type**: ```[Boolean]```

> **Required**: false

> **Position**: 22

> **PipelineInput**:false



---
#### **DrawTextTimecodeRate**

set rate (timecode only) (from 0 to INT_MAX) (default 0/1)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 23

> **PipelineInput**:false



---
#### **DrawTextRate**

set rate (timecode only) (from 0 to INT_MAX) (default 0/1)



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 24

> **PipelineInput**:false



---
#### **DrawTextReload**

reload text file for each frame (default false)



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **DrawTextAlpha**

apply alpha while rendering (default "1")



> **Type**: ```[String]```

> **Required**: false

> **Position**: 25

> **PipelineInput**:false



---
#### **DrawTextFixBounds**

check and fix text coords to avoid clipping (default false)



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **DrawTextStartNumber**

start frame number for n/frame_num variable (from 0 to INT_MAX) (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 26

> **PipelineInput**:false



---
#### **DrawTextTextSource**

the source of text



> **Type**: ```[String]```

> **Required**: false

> **Position**: 27

> **PipelineInput**:false



---
#### **DrawTextTextShaping**

attempt to shape text before drawing (default true)



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **DrawTextFontLoadFlags**

set font loading flags for libfreetype (default 0)



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 28

> **PipelineInput**:false



---
#### **DrawTextCenter**

If set, will draw text in the center.  
This will provide -DrawTextX '(w-text_w)/2' and -DrawTextY '(h-text_h)/2'



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/DrawText.RoughDraft.Extension.ps1 -DrawText [[-DrawTextFontFile] <String>] [[-DrawTextText] <String>] [[-DrawTextTextFile] <String>] [[-DrawTextFontColor] <String>] [[-DrawTextFontColorExpression] <String>] [[-DrawTextBoxColor] <String>] [[-DrawTextBorderColor] <String>] [[-DrawTextShadowColor] <String>] [-DrawTextBox] [[-DrawTextBoxBorderWidth] <Int32>] [[-DrawTextLineSpacing] <Int32>] [[-DrawTextFontSize] <String>] [[-DrawTextX] <String>] [[-DrawTextY] <String>] [[-DrawTextShadowX] <Int32>] [[-DrawTextShadowY] <Int32>] [[-DrawTextBorderWidth] <Int32>] [[-DrawTextTabSize] <Int32>] [[-DrawTextBasetime] <Int64>] [[-DrawTextFont] <String>] [[-DrawTextExpansion] <Int32>] [[-DrawTextTimeCode] <String>] [[-DrawTextTc24hmax] <Boolean>] [[-DrawTextTimecodeRate] <Double>] [[-DrawTextRate] <Double>] [-DrawTextReload] [[-DrawTextAlpha] <String>] [-DrawTextFixBounds] [[-DrawTextStartNumber] <Int32>] [[-DrawTextTextSource] <String>] [-DrawTextTextShaping] [[-DrawTextFontLoadFlags] <Int32>] [-DrawTextCenter] [<CommonParameters>]
```
---



