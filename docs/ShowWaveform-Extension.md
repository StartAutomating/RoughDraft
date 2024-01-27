Extension/ShowWaveform.RoughDraft.Extension.ps1
-----------------------------------------------

### Synopsis
Shows audio waveform.

---

### Description

Shows a waveform of the audio, using the [showwaves filter](https://ffmpeg.org/ffmpeg-filters.html#showwaves)

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#showwaves](https://ffmpeg.org/ffmpeg-filters.html#showwaves)

---

### Examples
> EXAMPLE 1

```PowerShell
Show-Media -InputPath .\a.mp3 -ShowWaveform
```
> EXAMPLE 2

```PowerShell
Edit-Media -InputPath .\a.mp3 -ShowWaveform -OutputPath .\a.mp4
```

---

### Parameters
#### **ShowWaveform**
If set, will show a line waveform

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[Switch]`|true    |named   |false        |ShowWaves|

#### **ShowWaveformMode**
Set display mode
Valid Values:

* point
* line
* p2p
* cline

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |1       |false        |showwaves_mode|

#### **ShowWaveformSize**
Specify the video size for the output.  Default value is 600x200

|Type      |Required|Position|PipelineInput|Aliases                         |
|----------|--------|--------|-------------|--------------------------------|
|`[String]`|false   |2       |false        |showwaves_size<br/>ShowWavesSize|

#### **ShowWaveformSplitChannel**
Set if channels should be drawn separately or overlap

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[Switch]`|false   |named   |false        |showwaves_split_channel|

#### **ShowWaveformColor**
Show waves color

|Type        |Required|Position|PipelineInput|Aliases                            |
|------------|--------|--------|-------------|-----------------------------------|
|`[String[]]`|false   |3       |false        |showwaves_colors<br/>ShowWavesColor|

#### **ShowWaveformScale**
Set amplitude scale.
Valid Values:

* lin
* log
* sqrt
* cbrt

|Type      |Required|Position|PipelineInput|Aliases                           |
|----------|--------|--------|-------------|----------------------------------|
|`[String]`|false   |4       |false        |showwaves_scale<br/>ShowWavesScale|

---

### Syntax
```PowerShell
Extension/ShowWaveform.RoughDraft.Extension.ps1 -ShowWaveform [[-ShowWaveformMode] <String>] [[-ShowWaveformSize] <String>] [-ShowWaveformSplitChannel] [[-ShowWaveformColor] <String[]>] [[-ShowWaveformScale] <String>] [<CommonParameters>]
```
