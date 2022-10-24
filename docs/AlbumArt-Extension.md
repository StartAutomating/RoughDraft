
Extension/AlbumArt.RoughDraft.Extension.ps1
-------------------------------------------
### Synopsis
Sets album artwork

---
### Description

Sets album artwork by adding a secondary stream to an audio file and setting the appropriate metadata.

---
### Parameters
#### **AlbumArt**

The path to album art.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
#### **AlbumArtType**

The type of album art.  By default 'Cover (front)'



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/AlbumArt.RoughDraft.Extension.ps1 [-AlbumArt] <String> [[-AlbumArtType] <String>] [<CommonParameters>]
```
---



