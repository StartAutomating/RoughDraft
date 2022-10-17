
Extension/SuperEqualizer.RoughDraft.Extension.ps1
-------------------------------------------------
### Synopsis
Audio 18 band Superequalizer

---
### Description

Modify audio with an 18 band superequalizer, courtesy of the superequalizer filter.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#superequalizer](https://ffmpeg.org/ffmpeg-filters.html#superequalizer)



---
### Examples
#### EXAMPLE 1
```PowerShell
# Make everything much more quiet
Show-Media -InputPath .\test.mp3 -SuperEqualizer @{(1..18)=-50}
```

#### EXAMPLE 2
```PowerShell
# Make everything much more quiet
Show-Media -InputPath .\test.mp3 -SuperEqualizer @{
    (7..18) = 3 
} # Turn up the volume
```

#### EXAMPLE 3
```PowerShell
Show-Media -InputPath .\test.mp3 -SuperEqualizer @{
    1=1
    2=2
    3=3
    4=4
    5=5
    6=6        
} # Turn up the bass
```

---
### Parameters
#### **SuperEqualizer**

If set, apply 18 band equalizer.
The key can either by a number of a digit range.
The value will be interpreted as the change in decibals for that band.



> **Type**: ```[IDictionary]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/SuperEqualizer.RoughDraft.Extension.ps1 [-SuperEqualizer] <IDictionary> [<CommonParameters>]
```
---



