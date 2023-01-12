
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



---
#### **ChorusInGain**

set input gain






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |1       |false        |



---
#### **ChorusOutGain**

set output gain






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |2       |false        |



---
#### **ChorusDelay**

set delays






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |



---
#### **ChorusDecay**

set decays






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |



---
#### **ChorusSpeed**

set speeds






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |



---
#### **ChorusDepth**

set depths






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |



---
### Syntax
```PowerShell
Extension/Chorus.RoughDraft.Extension.ps1 -Chorus [[-ChorusInGain] <Single>] [[-ChorusOutGain] <Single>] [[-ChorusDelay] <String[]>] [[-ChorusDecay] <String[]>] [[-ChorusSpeed] <String[]>] [[-ChorusDepth] <String[]>] [<CommonParameters>]
```
---




