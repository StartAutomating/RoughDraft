
Extension/Sine.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Generates a sine wave

---
### Description

Generates an audio sine wave

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#sine](https://ffmpeg.org/ffmpeg-filters.html#sine)



---
### Parameters
#### **Sine**

If set, will generate a sine tone






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **SineFrequency**

The frequency of the sine tone.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
### Syntax
```PowerShell
Extension/Sine.RoughDraft.Extension.ps1 -Sine [[-SineFrequency] <String>] [<CommonParameters>]
```
---




