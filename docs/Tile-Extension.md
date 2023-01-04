
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



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
#### **TileFrameCount**

Set the maximum number of frames to render in the given area.
It must be less than or equal to wxh.
The default value is 0, meaning all the area will be used.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **TileMargin**

Set the outer border margin in pixels.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **TilePadding**

Set the tile padding in pixels.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **TileMarginColor**

Specify the color of the unused area. The default value of color is "black".



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **TileOverlapFrame**

Set the number of frames to overlap when tiling several successive frames together. The value must be between 0 and nb_frames - 1.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **TileInitialPadding**

Set the number of frames to initially be empty before displaying first output frame.
This controls how soon will one get first output frame. The value must be between 0 and nb_frames - 1



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **TileNoPrescale**

If set, will not prescale a video before tiling it.  This will result in _very_ large frames.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Tile.RoughDraft.Extension.ps1 [-Tile] <String> [[-TileFrameCount] <Int32>] [[-TileMargin] <Int32>] [[-TilePadding] <Int32>] [[-TileMarginColor] <String>] [[-TileOverlapFrame] <Int32>] [[-TileInitialPadding] <Int32>] [-TileNoPrescale] [<CommonParameters>]
```
---




