Extension/Chorus.RoughDraft.Extension.ps1
-----------------------------------------

### Synopsis
chorus

---

### Description

Add a chorus effect to the audio.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#chorus](https://ffmpeg.org/ffmpeg-filters.html#chorus)

---

### Parameters
#### **Chorus**
Add a chorus effect to the audio.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ChorusInGain**
set input gain

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Single]`|false   |1       |false        |chorus_in_gain|

#### **ChorusOutGain**
set output gain

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Single]`|false   |2       |false        |chorus_out_gain|

#### **ChorusDelay**
set delays

|Type        |Required|Position|PipelineInput|Aliases                       |
|------------|--------|--------|-------------|------------------------------|
|`[String[]]`|false   |3       |false        |chorus_delays<br/>ChorusDelays|

#### **ChorusDecay**
set decays

|Type        |Required|Position|PipelineInput|Aliases                       |
|------------|--------|--------|-------------|------------------------------|
|`[String[]]`|false   |4       |false        |chorus_decays<br/>ChorusDecays|

#### **ChorusSpeed**
set speeds

|Type        |Required|Position|PipelineInput|Aliases                       |
|------------|--------|--------|-------------|------------------------------|
|`[String[]]`|false   |5       |false        |chorus_speeds<br/>ChorusSpeeds|

#### **ChorusDepth**
set depths

|Type        |Required|Position|PipelineInput|Aliases                       |
|------------|--------|--------|-------------|------------------------------|
|`[String[]]`|false   |6       |false        |chorus_depths<br/>ChorusDepths|

---

### Syntax
```PowerShell
Extension/Chorus.RoughDraft.Extension.ps1 -Chorus [[-ChorusInGain] <Single>] [[-ChorusOutGain] <Single>] [[-ChorusDelay] <String[]>] [[-ChorusDecay] <String[]>] [[-ChorusSpeed] <String[]>] [[-ChorusDepth] <String[]>] [<CommonParameters>]
```
