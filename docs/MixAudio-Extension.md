Extension/MixAudio.RoughDraft.Extension.ps1
-------------------------------------------

### Synopsis
Mix Audio

---

### Description

Audio mixing.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#amix](https://ffmpeg.org/ffmpeg-filters.html#amix)

---

### Parameters
#### **MixAudio**
Audio mixing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **MixAudioInputs**
Number of inputs.

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|false   |1       |false        |amix_inputs|

#### **MixAudioDuration**
How to determine the end-of-stream.
Valid Values:

* longest
* shortest
* first

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |2       |false        |amix_duration|

#### **MixAudioDropoutTransition**
Transition time, in seconds, for volume renormalization when an input stream ends.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[Single]`|false   |3       |false        |amix_dropout_transition|

#### **MixAudioWeight**
Set weight for each input.

|Type        |Required|Position|PipelineInput|Aliases                         |
|------------|--------|--------|-------------|--------------------------------|
|`[String[]]`|false   |4       |false        |amix_weights<br/>MixAudioWeights|

---

### Syntax
```PowerShell
Extension/MixAudio.RoughDraft.Extension.ps1 -MixAudio [[-MixAudioInputs] <Int32>] [[-MixAudioDuration] <String>] [[-MixAudioDropoutTransition] <Single>] [[-MixAudioWeight] <String[]>] [<CommonParameters>]
```
