Extension/TrimAudio.RoughDraft.Extension.ps1
--------------------------------------------

### Synopsis
Trim Audio

---

### Description

Trims Audio, using the `atrim` filter.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#atrim](https://ffmpeg.org/ffmpeg-filters.html#atrim)

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
Same as TrimStart, in samples instead of seconds.

|Type     |Required|Position|PipelineInput|Aliases  |
|---------|--------|--------|-------------|---------|
|`[Int32]`|false   |3       |false        |start_pts|

#### **TrimEndPoint**
Same as TrimEnd, in samples instead of seconds.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|false   |4       |false        |end_pts|

#### **TrimStartSample**
The number of the first sample that should be output.

|Type     |Required|Position|PipelineInput|Aliases     |
|---------|--------|--------|-------------|------------|
|`[Int32]`|false   |5       |false        |start_sample|

#### **TrimEndSample**
The number of the first sample that should be dropped.

|Type     |Required|Position|PipelineInput|Aliases   |
|---------|--------|--------|-------------|----------|
|`[Int32]`|false   |6       |false        |end_sample|

#### **TrimDuration**
The maximum duration of the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |7       |false        |

---

### Syntax
```PowerShell
Extension/TrimAudio.RoughDraft.Extension.ps1 -TrimAudio [[-TrimStart] <TimeSpan>] [[-TrimEnd] <TimeSpan>] [[-TrimStartPoint] <Int32>] [[-TrimEndPoint] <Int32>] [[-TrimStartSample] <Int32>] [[-TrimEndSample] <Int32>] [[-TrimDuration] <TimeSpan>] [<CommonParameters>]
```
