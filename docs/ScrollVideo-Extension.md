
Extension/ScrollVideo.RoughDraft.Extension.ps1
----------------------------------------------
### Synopsis
Scrolls video

---
### Description

Scrolls video, using the scroll filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#scroll](https://ffmpeg.org/ffmpeg-filters.html#scroll)



---
### Parameters
#### **Scroll**

If set, will scroll video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **HorizontalScrollSpeed**

Set the horizontal scrolling speed. Default is 0. 
Allowed range is from -1 to 1. 
Negative values changes scrolling direction.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |



---
#### **HorizontalScrollStartPosition**

Set the initial horizontal scrolling position. 
Default is 0. 
Allowed range is from 0 to 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **VerticalScrollSpeed**

Set the vertical scrolling speed. Default is 0. 
Allowed range is from -1 to 1. 
Negative values changes scrolling direction.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **VerticalScrollStartPosition**

Set the initial vertical scrolling position. 
Default is 0. 
Allowed range is from 0 to 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



---
### Syntax
```PowerShell
Extension/ScrollVideo.RoughDraft.Extension.ps1 -Scroll [[-HorizontalScrollSpeed] <Double>] [[-HorizontalScrollStartPosition] <Double>] [[-VerticalScrollSpeed] <Double>] [[-VerticalScrollStartPosition] <Double>] [<CommonParameters>]
```
---




