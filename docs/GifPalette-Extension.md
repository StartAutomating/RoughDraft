Extension/GifPalette.RoughDraft.Extension.ps1
---------------------------------------------

### Synopsis
Gif Palette Extension

---

### Description

The Gif Palette Extension generates a palette for high quality gif creation.

It will be automatically called when converting .gif files.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-Media -InputPath .\a.mp4 -OutputPath .gif
```

---

### Parameters
#### **DifferenceBasedPalette**
If set, will use a difference-based palette.  These put more focus on the motion than the background.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Extension/GifPalette.RoughDraft.Extension.ps1 [-DifferenceBasedPalette] [<CommonParameters>]
```
