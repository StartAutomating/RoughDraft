
Extension/Mirror.RoughDraft.Extension.ps1
-----------------------------------------
### Synopsis
Mirror Extension

---
### Description

Mirrors video vertical, horizontally, or in quadrants.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#crop](https://ffmpeg.org/ffmpeg-filters.html#crop)



* [https://ffmpeg.org/ffmpeg-filters.html#hstack](https://ffmpeg.org/ffmpeg-filters.html#hstack)



* [https://ffmpeg.org/ffmpeg-filters.html#hflip](https://ffmpeg.org/ffmpeg-filters.html#hflip)



* [https://ffmpeg.org/ffmpeg-filters.html#vstack](https://ffmpeg.org/ffmpeg-filters.html#vstack)



* [https://ffmpeg.org/ffmpeg-filters.html#vflip](https://ffmpeg.org/ffmpeg-filters.html#vflip)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "a.mp4" -Mirror # Mirror vertically
```

#### EXAMPLE 2
```PowerShell
Edit-Media -InputPath "a.mp4" -Mirror -HorizontalMirror # Mirror horitonztally
```

#### EXAMPLE 3
```PowerShell
Edit-Media -InputPath "a.mp4" -Mirror -QuadMirror       # Mirror four quadrants.
```

---
### Parameters
#### **Mirror**

If set, will mirror video.  If no other parameters are provided, will mirror horizontally.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **QuadMirror**

If set, will create a QuadMirror, mirroring the upper left.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **HorizontalMirror**

If set, will create a horizontal mirror instead of a vertical mirror.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Mirror.RoughDraft.Extension.ps1 -Mirror [-QuadMirror] [-HorizontalMirror] [<CommonParameters>]
```
---




