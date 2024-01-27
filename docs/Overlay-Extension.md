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

#### **OverlayX**
set the x expression

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |1       |false        |overlay_x|

#### **OverlayY**
set the y expression

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |2       |false        |overlay_y|

#### **OverlayEof_action**
Action to take when encountering EOF from secondary input

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |overlay_eof_action|

#### **OverlayEval**
specify when to evaluate expressions

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|false   |named   |false        |overlay_eval|

#### **OverlayShortest**
force termination when the shortest input terminates

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |overlay_shortest|

#### **OverlayFormat**
set output format

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |overlay_format|

#### **OverlayRepeatlast**
repeat overlay of the last overlay frame

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |overlay_repeatlast|

#### **OverlayAlpha**
alpha format

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Switch]`|false   |named   |false        |overlay_alpha|

---

### Syntax
```PowerShell
Extension/Overlay.RoughDraft.Extension.ps1 -Overlay [[-OverlayX] <String>] [[-OverlayY] <String>] [-OverlayEof_action] [-OverlayEval] [-OverlayShortest] [-OverlayFormat] [-OverlayRepeatlast] [-OverlayAlpha] [<CommonParameters>]
```
