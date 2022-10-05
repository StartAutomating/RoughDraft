
Extension/ReverseVideo.RoughDraft.Extension.ps1
-----------------------------------------------
### Synopsis
Reverses video

---
### Description

Reverses video, using the reverse filter.

Warning: This filter requires memory to buffer the entire clip.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#reverse](https://ffmpeg.org/ffmpeg-filters.html#reverse)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "TestSource.gif" -ReverseVideo
```

---
### Parameters
#### **ReverseVideo**

If set, will reverse audio



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/ReverseVideo.RoughDraft.Extension.ps1 -ReverseVideo [<CommonParameters>]
```
---




