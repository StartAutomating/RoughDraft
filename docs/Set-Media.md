
Set-Media
---------
### Synopsis
Sets media metadata

---
### Description

Sets media metadata, using ffmpeg

---
### Related Links
* [Get-Media](Get-Media.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
Set-Media -InputPath $home\Music\ASong.mp3 -Property @{
    Title = "A Song"
    Artist = "An Artist"
    Lyrics = "Some lyrics"
}
```

#### EXAMPLE 2
```PowerShell
Set-Media -InputPath $home\Music\ASong.mp3 -AlbumArt $home\Music\Cover.jpg
```

---
### Parameters
#### **InputPath**

The Input Path



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[String[]]```|true    |1      |true (ByPropertyName)|
---
#### **Property**

A dictionary of properties to update



|Type              |Requried|Postion|PipelineInput |
|------------------|--------|-------|--------------|
|```[PSObject[]]```|false   |2      |true (ByValue)|
---
#### **ClearProperty**

A collection of properties to clear



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |3      |false        |
---
#### **FFMpegPath**

The path to FFMpeg.exe.  Download it from http://ffmpeg.org/



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |4      |true (ByPropertyName)|
---
#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.
    
If you pass ```-Confirm:$false``` you will not be prompted.
    
    
If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---
### Outputs
System.Nullable


---
### Syntax
```PowerShell
Set-Media [-InputPath] <String[]> [[-Property] <PSObject[]>] [[-ClearProperty] <String[]>] [[-FFMpegPath] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
---


