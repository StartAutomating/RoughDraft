Extension/FixPlaylistPath.RoughDraft.Extension.ps1
--------------------------------------------------

### Synopsis
FixPlaylistPath

---

### Description

Fixes paths within playlist files.  

If an absolute path is invalid, it will be replaced with a relative path.

(if the file is missing, a warning will be written)

---

### Parameters
#### **FixPlaylistPath**
If set, will fix playlist paths

|Type      |Required|Position|PipelineInput|Aliases                                                        |
|----------|--------|--------|-------------|---------------------------------------------------------------|
|`[Switch]`|true    |named   |false        |FixPlaylistPaths<br/>RepairPlaylistPath<br/>RepairPlaylistPaths|

---

### Syntax
```PowerShell
Extension/FixPlaylistPath.RoughDraft.Extension.ps1 -FixPlaylistPath [<CommonParameters>]
```
