
Show-Media
----------
### Synopsis
Shows media

---
### Description

Shows media, using FFPlay

---
### Related Links
* [Get-RoughDraftExtension](Get-RoughDraftExtension.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -InputPath $home\Music\ASong.mp3
```

#### EXAMPLE 2
```PowerShell
Show-Media -InputPath $home\Videos\AMovie.mp4 -Fullscreen
```

---
### Parameters
#### **InputPath**

The input path.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |1      |true (ByPropertyName)|
---
#### **AsJob**

If set, will run as a background job.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **Resolution**

The resolution of the media player.  This can be passed down to extensions that generate video.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **ShowMode**

The display mode.  When input is audio, defaults to 'Waves'



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Volume**

The volume.



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **Fullscreen**

If set, will run fullscreen



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **KeepOpen**

If set, will keep the player open after the media finishes.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **DoNotAutoRotate**

If set, will not automatically rotate video.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **Left**

Set the x position for the left of the window



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **Top**

Set the y position for the top of the window



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **Width**

If set, will force the displayed width.



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **Height**

If set, will force the displayed height.



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **NoDisplay**

If set, will not display anything.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **NoBorder**

If set, will run in a borderless window.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **AlwaysOnTop**

If set, will run in a window that is always on top.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **Loop**

If set, this will loop the input source.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **LoopCount**

If set, this will loop the input source any number of times.



|Type         |Requried|Postion|PipelineInput        |
|-------------|--------|-------|---------------------|
|```[Int32]```|false   |named  |true (ByPropertyName)|
---
#### **FFPlayPath**

The path to FFPlay.  If not provided, this will be automatically detected.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
### Outputs
System.Nullable


System.Management.Automation.Job


---
### Syntax
```PowerShell
Show-Media [-InputPath] <String> [-AsJob] [-Resolution <String>] [-ShowMode <String>] [-Volume <Int32>] [-Fullscreen] [-KeepOpen] [-DoNotAutoRotate] [-Left <Int32>] [-Top <Int32>] [-Width <Int32>] [-Height <Int32>] [-NoDisplay] [-NoBorder] [-AlwaysOnTop] [-Loop] [-LoopCount <Int32>] [-FFPlayPath <String>] [<CommonParameters>]
```
---


