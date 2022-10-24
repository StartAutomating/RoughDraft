
Extension/Life.rd.ext.ps1
-------------------------
### Synopsis
Generates life

---
### Description

Uses the ffmpeg filter for life

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#life](https://ffmpeg.org/ffmpeg-filters.html#life)



---
### Examples
#### EXAMPLE 1
```PowerShell
New-Media -OutputPath "Life.gif" -Duration "00:00:05" -Life
```

---
### Parameters
#### **Life**

If set, will generate life



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **LifeStateFile**

Set the file from which to read the initial grid state. 
In the file, each non-whitespace character is considered an alive cell, and newline is used to delimit the end of each row.
If this option is not specified, the initial grid is generated randomly.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **LifeFillRatio**

Set the random fill ratio for the initial random grid.
It is a floating point number value ranging from 0 to 1, defaults to 1/PHI. 
It is ignored when a file is specified.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **LifeSeed**

Set the seed for filling the initial random grid, must be an integer included between 0 and UINT32_MAX. 
If not specified, or if explicitly set to -1, the filter will try to use a good random seed on a best effort basis.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **LifeRule**

Default value is "S23/B3", which is the original Conway’s game of life rule, 
and will keep a cell alive if it has 2 or 3 neighbor alive cells, 
and will born a new cell if there are three alive cells around a dead cell.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **DoNotStitchLifeGrid**

If not set, will not stitch the left/right top/bottom grid edges together.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **LifeMoldSpeed**

$ Set cell mold speed. 
 If set, a dead cell will go from death_color to mold_color with a step of mold. mold can have a value from 0 to 255



> **Type**: ```[Byte]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **LifeLivingColor**

Set the color of living (or new born) cells.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **LifeDeathColor**

Set the color of dead cells. 
If mold is set, this is the first color used to represent a dead cell.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **LifeMoldColor**

Set mold color, for definitely dead and moldy cells.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Life.rd.ext.ps1 -Life [[-LifeStateFile] <String>] [[-LifeFillRatio] <Double>] [[-LifeSeed] <Int32>] [[-LifeRule] <String>] [-DoNotStitchLifeGrid] [[-LifeMoldSpeed] <Byte>] [[-LifeLivingColor] <String>] [[-LifeDeathColor] <String>] [[-LifeMoldColor] <String>] [<CommonParameters>]
```
---



