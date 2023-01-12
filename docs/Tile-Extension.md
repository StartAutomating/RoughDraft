
Extension/Tile.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Tile Extension

---
### Description

Uses the tile filter to tile video frames.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#tile](https://ffmpeg.org/ffmpeg-filters.html#tile)



---
### Parameters
#### **Tile**

Set the grid size (i.e. the number of lines and columns)






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |



---
#### **TileFrameCount**

Set the maximum number of frames to render in the given area.
It must be less than or equal to wxh.
The default value is 0, meaning all the area will be used.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **TileMargin**

Set the outer border margin in pixels.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **TilePadding**

Set the tile padding in pixels.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
#### **TileMarginColor**

Specify the color of the unused area. The default value of color is "black".






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **TileOverlapFrame**

Set the number of frames to overlap when tiling several successive frames together. The value must be between 0 and nb_frames - 1.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |



---
#### **TileInitialPadding**

Set the number of frames to initially be empty before displaying first output frame.
This controls how soon will one get first output frame. The value must be between 0 and nb_frames - 1






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |



---
#### **TileNoPrescale**

If set, will not prescale a video before tiling it.  This will result in _very_ large frames.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/Tile.RoughDraft.Extension.ps1 [-Tile] <String> [[-TileFrameCount] <Int32>] [[-TileMargin] <Int32>] [[-TilePadding] <Int32>] [[-TileMarginColor] <String>] [[-TileOverlapFrame] <Int32>] [[-TileInitialPadding] <Int32>] [-TileNoPrescale] [<CommonParameters>]
```
---




