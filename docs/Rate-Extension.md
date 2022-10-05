
Extension/Rate.rd.ext.ps1
-------------------------
### Synopsis
Adjusts the rate of media.

---
### Description

Adjusts the playback rate of media, making it slower or faster.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#setpts](https://ffmpeg.org/ffmpeg-filters.html#setpts)



* [https://ffmpeg.org/ffmpeg-filters.html#atempo](https://ffmpeg.org/ffmpeg-filters.html#atempo)



---
### Parameters
#### **Rate**

The new rate of the media.



> **Type**: ```[Double]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Rate.rd.ext.ps1 [-Rate] <Double> [<CommonParameters>]
```
---
### Notes
This uses a variety of filters:

* setpts
* atempo
* asetpts




