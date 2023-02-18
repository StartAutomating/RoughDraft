
Extension/DrawSubtitle.RoughDraft.Extension.ps1
-----------------------------------------------
### Synopsis
Draw subtitles on top of input video

---
### Description

Draw subtitles on top of input video using the libass library

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#subtitles-1](https://ffmpeg.org/ffmpeg-filters.html#subtitles-1)



* [https://ffmpeg.org/ffmpeg-filters.html#ass](https://ffmpeg.org/ffmpeg-filters.html#ass)



---
### Examples
#### EXAMPLE 1
```PowerShell
Convert-Media
```

---
### Parameters
#### **SubtitleFile**

Set the filename of the subtitle file to read. It must be specified.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |



---
#### **OriginalVideoSize**

Specify the size of the original video, the video for which the ASS file was composed.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **SubtitleFontDirectory**

Set a directory path containing fonts that can be used by the filter.
These fonts will be used in addition to whatever the font provider uses.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **SubtitleAlpha**

Process alpha channel, by default alpha channel is untouched.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **SubtitleCharacterEncoding**

Set subtitles input character encoding. subtitles filter only. Only useful if not UTF-8.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **SubtitleStreamIndex**

Set subtitles stream index. subtitles filter only.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |



---
#### **SubtitleStyle**

Override default style or script info parameters of the subtitles.
It accepts a string containing ASS style format KEY=VALUE couples separated by ",".






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
### Syntax
```PowerShell
Extension/DrawSubtitle.RoughDraft.Extension.ps1 [-SubtitleFile] <String> [[-OriginalVideoSize] <String>] [[-SubtitleFontDirectory] <String>] [[-SubtitleAlpha] <String>] [[-SubtitleCharacterEncoding] <String>] [[-SubtitleStreamIndex] <Int32>] [[-SubtitleStyle] <String>] [<CommonParameters>]
```
---




