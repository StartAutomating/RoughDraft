
Extension/Overlay.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
overlay

---
### Description

Overlay a video source on top of the input.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#overlay](https://ffmpeg.org/ffmpeg-filters.html#overlay)



---
### Parameters
#### **Overlay**

Overlay a video source on top of the input.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **OverlayX**

set the x expression






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **OverlayY**

set the y expression






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **OverlayEof_action**

Action to take when encountering EOF from secondary input






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **OverlayEval**

specify when to evaluate expressions






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **OverlayShortest**

force termination when the shortest input terminates






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **OverlayFormat**

set output format






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **OverlayRepeatlast**

repeat overlay of the last overlay frame






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **OverlayAlpha**

alpha format






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/Overlay.RoughDraft.Extension.ps1 -Overlay [[-OverlayX] <String>] [[-OverlayY] <String>] [-OverlayEof_action] [-OverlayEval] [-OverlayShortest] [-OverlayFormat] [-OverlayRepeatlast] [-OverlayAlpha] [<CommonParameters>]
```
---




