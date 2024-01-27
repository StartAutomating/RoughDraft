Extension/NoLogo.RoughDraft.Extension.ps1
-----------------------------------------

### Synopsis
delogo

---

### Description

Remove logo from input video.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#delogo](https://ffmpeg.org/ffmpeg-filters.html#delogo)

---

### Parameters
#### **Delogo**
Remove logo from input video.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |NoLogo |

#### **NoLogoX**
set logo x position

|Type     |Required|Position|PipelineInput|Aliases                            |
|---------|--------|--------|-------------|-----------------------------------|
|`[Int32]`|false   |1       |false        |delogo_x<br/>DeLogoX<br/>NoLogoLeft|

#### **NoLogoY**
set logo y position

|Type     |Required|Position|PipelineInput|Aliases                           |
|---------|--------|--------|-------------|----------------------------------|
|`[Int32]`|false   |2       |false        |delogo_y<br/>DeLogoY<br/>NoLogoTop|

#### **NoLogoWidth**
set logo width

|Type     |Required|Position|PipelineInput|Aliases                 |
|---------|--------|--------|-------------|------------------------|
|`[Int32]`|false   |3       |false        |delogo_w<br/>DeLogoWidth|

#### **NoLogoHeight**
set logo height

|Type     |Required|Position|PipelineInput|Aliases                  |
|---------|--------|--------|-------------|-------------------------|
|`[Int32]`|false   |4       |false        |delogo_h<br/>DeLogoHeight|

#### **NoLogoShow**
show delogo area

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[Switch]`|false   |named   |false        |delogo_show<br/>DeLogoShow|

---

### Syntax
```PowerShell
Extension/NoLogo.RoughDraft.Extension.ps1 -Delogo [[-NoLogoX] <Int32>] [[-NoLogoY] <Int32>] [[-NoLogoWidth] <Int32>] [[-NoLogoHeight] <Int32>] [-NoLogoShow] [<CommonParameters>]
```
