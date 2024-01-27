Extension/ChromaHold.RoughDraft.Extension.ps1
---------------------------------------------

### Synopsis
chromahold

---

### Description

Turns a certain color range into gray.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#chromahold](https://ffmpeg.org/ffmpeg-filters.html#chromahold)

---

### Parameters
#### **Chromahold**
Turns a certain color range into gray.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ChromaholdColor**
set the chromahold key color

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |1       |false        |chromahold_color|

#### **ChromaholdSimilarity**
set the chromahold similarity value

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[Single]`|false   |2       |false        |chromahold_similarity|

#### **ChromaholdBlend**
set the chromahold blend value

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Single]`|false   |3       |false        |chromahold_blend|

#### **ChromaholdYuv**
color parameter is in yuv instead of rgb

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |chromahold_yuv|

---

### Syntax
```PowerShell
Extension/ChromaHold.RoughDraft.Extension.ps1 -Chromahold [[-ChromaholdColor] <String>] [[-ChromaholdSimilarity] <Single>] [[-ChromaholdBlend] <Single>] [-ChromaholdYuv] [<CommonParameters>]
```
