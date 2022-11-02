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



> **Type**: ```[String[]]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **Property**

A dictionary of properties to update



> **Type**: ```[PSObject[]]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:true (ByValue)



---
#### **ClearProperty**

A collection of properties to clear



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **FFMpegPath**

The path to FFMpeg.exe.  Download it from http://ffmpeg.org/



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:true (ByPropertyName)



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
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)




---
### Syntax
```PowerShell
Set-Media [-InputPath] <String[]> [[-Property] <PSObject[]>] [[-ClearProperty] <String[]>] [[-FFMpegPath] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
---
