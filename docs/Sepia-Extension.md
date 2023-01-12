
Extension/Sepia.RoughDraft.ext.ps1
----------------------------------
### Synopsis
Applies a Sepia Filter

---
### Description

Uses the ffmpeg colorchannelmixer to apply a Sepia filter.

---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "TestSource.mp4" -Sepia
```

---
### Parameters
#### **Sepia**

If set, will apply a sepia filter.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
### Syntax
```PowerShell
Extension/Sepia.RoughDraft.ext.ps1 -Sepia [<CommonParameters>]
```
---




