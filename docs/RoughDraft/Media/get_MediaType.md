RoughDraft.Media.get_MediaType()
--------------------------------

### Synopsis
Gets the Media Type

---

### Description

Gets the Media Type of a file discovered by Get-Media.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Media -InputPath .\a.mp4 |
    Select-Object -ExpandProperty MediaType
```

---

### Notes
Getting the Media Type also decorates the object as that media type, so that extended Audio, Video, and Image functionality are available.

---
