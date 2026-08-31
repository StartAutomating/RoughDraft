Extension/Trim.RoughDraft.Extension.ps1
---------------------------------------

### Synopsis
Trim Video

---

### Description

Trims Video, using the `trim` filter.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#trim](https://ffmpeg.org/ffmpeg-filters.html#trim)

---

### Parameters
#### **TrimAudio**
If set, will use the `atrim` filter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **TrimStart**
Timestamp (in seconds) of the start of the section to keep. 
The audio sample with the timestamp start will be the first sample.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |1       |false        |

#### **TrimEnd**
Specify time of the first audio sample that will be dropped, 
The audio sample immediately preceding the one with the timestamp end 
will be the last sample.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |2       |false        |

#### **TrimStartPoint**
Same as TrimStart, in timebase units instead of seconds.

|Type     |Required|Position|PipelineInput|Aliases  |
|---------|--------|--------|-------------|---------|
|`[Int32]`|false   |3       |false        |start_pts|

#### **TrimEndPoint**
Same as TrimEnd, in timebase units instead of seconds.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|false   |4       |false        |end_pts|

#### **TrimStartFrame**
The number of the first frame that should be output.

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|false   |5       |false        |start_frame|

#### **TrimEndFrame**
The number of the first frame that should be dropped.

|Type     |Required|Position|PipelineInput|Aliases  |
|---------|--------|--------|-------------|---------|
|`[Int32]`|false   |6       |false        |end_frame|

#### **TrimDuration**
The maximum duration of the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |7       |false        |

---

### Syntax
```PowerShell
Extension/Trim.RoughDraft.Extension.ps1 -TrimAudio [[-TrimStart] <TimeSpan>] [[-TrimEnd] <TimeSpan>] [[-TrimStartPoint] <Int32>] [[-TrimEndPoint] <Int32>] [[-TrimStartFrame] <Int32>] [[-TrimEndFrame] <Int32>] [[-TrimDuration] <TimeSpan>] [<CommonParameters>]
```
