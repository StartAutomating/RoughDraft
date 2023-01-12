
Extension/DataScope.RoughDraft.Extension.ps1
--------------------------------------------
### Synopsis
Datascope effect

---
### Description

Applies the datascope filter

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#datascope](https://ffmpeg.org/ffmpeg-filters.html#datascope)



---
### Parameters
#### **DataScope**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **DataScopeMode**

Set scope mode, can be one of the following:

|Value|Description|
|-----|-----------| 
|mono |Draw hexadecimal pixel values with white color on black background.|
|color |Draw hexadecimal pixel values with input video pixel color on black background.|
|color2 |Draw hexadecimal pixel values on color background picked from input video, the text color is picked in such way so its always visible.|
*



Valid Values:

* Mono
* Color
* Color2






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **DataScopeBackgroundOpacity**

Set background opacity.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |



---
#### **DataScopeAxis**

Draw rows and columns numbers on left and top of video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **DataScopeFormat**

Set display number format. Can be hex, or dec. Default is hex.



Valid Values:

* hex
* dec






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **DataScopeX**

Set x offset from where to pick pixels.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
#### **DataScopeY**

Set y offset from where to pick pixels.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |



---
#### **DataScopeComponent**

Set pixel components to display. By default all pixel components are displayed.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
### Syntax
```PowerShell
Extension/DataScope.RoughDraft.Extension.ps1 -DataScope [[-DataScopeMode] <String>] [[-DataScopeBackgroundOpacity] <Double>] [-DataScopeAxis] [[-DataScopeFormat] <String>] [[-DataScopeX] <Int32>] [[-DataScopeY] <Int32>] [[-DataScopeComponent] <String>] [<CommonParameters>]
```
---




