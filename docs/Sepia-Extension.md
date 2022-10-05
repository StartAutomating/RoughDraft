
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



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Sepia.RoughDraft.ext.ps1 -Sepia [<CommonParameters>]
```
---




