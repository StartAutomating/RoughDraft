
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

> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



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



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **DataScopeBackgroundOpacity**

Set background opacity.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **DataScopeAxis**

Draw rows and columns numbers on left and top of video.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **DataScopeFormat**

Set display number format. Can be hex, or dec. Default is hex.



Valid Values:

* hex
* dec



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **DataScopeX**

Set x offset from where to pick pixels.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **DataScopeY**

Set y offset from where to pick pixels.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **DataScopeComponent**

Set pixel components to display. By default all pixel components are displayed.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/DataScope.RoughDraft.Extension.ps1 -DataScope [[-DataScopeMode] <String>] [[-DataScopeBackgroundOpacity] <Double>] [-DataScopeAxis] [[-DataScopeFormat] <String>] [[-DataScopeX] <Int32>] [[-DataScopeY] <Int32>] [[-DataScopeComponent] <String>] [<CommonParameters>]
```
---



