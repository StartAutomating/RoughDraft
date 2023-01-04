
Extension/TestSource.RoughDraft.Extension.ps1
---------------------------------------------
### Synopsis
Generates test sources

---
### Description

Generates test sources using lavfi

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#allrgb_002c-allyuv_002c-color_002c-colorspectrum_002c-haldclutsrc_002c-nullsrc_002c-pal75bars_002c-pal100bars_002c-rgbtestsrc_002c-smptebars_002c-smptehdbars_002c-testsrc_002c-testsrc2_002c-yuvtestsrc](https://ffmpeg.org/ffmpeg-filters.html#allrgb_002c-allyuv_002c-color_002c-colorspectrum_002c-haldclutsrc_002c-nullsrc_002c-pal75bars_002c-pal100bars_002c-rgbtestsrc_002c-smptebars_002c-smptehdbars_002c-testsrc_002c-testsrc2_002c-yuvtestsrc)



---
### Examples
#### EXAMPLE 1
```PowerShell
New-Media -TestSource testsrc2 -Duration "00:00:05" -OutputPath "TestSource.gif"
```

---
### Parameters
#### **TestSource**

The name of the test source



Valid Values:

* allrgb
* allyuv
* pal75bars
* pal100bars
* rgbtestsrc
* smtpebars
* testsrc
* testsrc2
* yuvtestsrc



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/TestSource.RoughDraft.Extension.ps1 [-TestSource] <String> [<CommonParameters>]
```
---




