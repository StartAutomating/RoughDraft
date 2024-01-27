Extension/SwapRect.RoughDraft.Extension.ps1
-------------------------------------------

### Synopsis
swaprect

---

### Description

Swap 2 rectangular objects in video.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#swaprect](https://ffmpeg.org/ffmpeg-filters.html#swaprect)

---

### Parameters
#### **Swaprect**
Swap 2 rectangular objects in video.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **SwapRectWidth**
set rect width

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |swaprect_w|

#### **SwapRectHeight**
set rect height

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |swaprect_h|

#### **SwapRectX1**
set 1st rect x top left coordinate

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |3       |false        |swaprect_x1|

#### **SwapRectY1**
set 1st rect y top left coordinate

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |4       |false        |swaprect_y1|

#### **SwapRectX2**
set 2nd rect x top left coordinate

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |5       |false        |swaprect_x2|

#### **SwapRectY2**
set 2nd rect y top left coordinate

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |6       |false        |swaprect_y2|

---

### Notes
All options support expressions containing the following variables:

|Variable|Description|
|-|-|
|w|The input width|
|h|The input height|
|a|The input width/ The Input Height|
|sar|input sample aspect ratio|
|dar|input display aspect ratio, it is the same as (w / h) * sar|
|n|The number of the input frame, starting from 0.
|t|The timestamp expressed in seconds. It’s NAN if the input timestamp is unknown.
|pos|the position in the file of the input frame, NAN if unknown; deprecated, do not use|

---

### Syntax
```PowerShell
Extension/SwapRect.RoughDraft.Extension.ps1 -Swaprect [[-SwapRectWidth] <String>] [[-SwapRectHeight] <String>] [[-SwapRectX1] <String>] [[-SwapRectY1] <String>] [[-SwapRectX2] <String>] [[-SwapRectY2] <String>] [<CommonParameters>]
```
