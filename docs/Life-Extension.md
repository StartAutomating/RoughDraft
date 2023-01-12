
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **LifeStateFile**

Set the file from which to read the initial grid state. 
In the file, each non-whitespace character is considered an alive cell, and newline is used to delimit the end of each row.
If this option is not specified, the initial grid is generated randomly.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **LifeFillRatio**

Set the random fill ratio for the initial random grid.
It is a floating point number value ranging from 0 to 1, defaults to 1/PHI. 
It is ignored when a file is specified.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **LifeSeed**

Set the seed for filling the initial random grid, must be an integer included between 0 and UINT32_MAX. 
If not specified, or if explicitly set to -1, the filter will try to use a good random seed on a best effort basis.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **LifeRule**

Default value is "S23/B3", which is the original Conway’s game of life rule, 
and will keep a cell alive if it has 2 or 3 neighbor alive cells, 
and will born a new cell if there are three alive cells around a dead cell.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **DoNotStitchLifeGrid**

If not set, will not stitch the left/right top/bottom grid edges together.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **LifeMoldSpeed**

$ Set cell mold speed. 
 If set, a dead cell will go from death_color to mold_color with a step of mold. mold can have a value from 0 to 255






|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Byte]`|false   |5       |false        |



---
#### **LifeLivingColor**

Set the color of living (or new born) cells.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **LifeDeathColor**

Set the color of dead cells. 
If mold is set, this is the first color used to represent a dead cell.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
#### **LifeMoldColor**

Set mold color, for definitely dead and moldy cells.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
### Syntax
```PowerShell
Extension/Life.rd.ext.ps1 -Life [[-LifeStateFile] <String>] [[-LifeFillRatio] <Double>] [[-LifeSeed] <Int32>] [[-LifeRule] <String>] [-DoNotStitchLifeGrid] [[-LifeMoldSpeed] <Byte>] [[-LifeLivingColor] <String>] [[-LifeDeathColor] <String>] [[-LifeMoldColor] <String>] [<CommonParameters>]
```
---




