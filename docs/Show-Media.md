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

#### EXAMPLE 3
```PowerShell
$cameraName = "NexiGo N60 FHD Webcam" # Replace with your own camera, use Get-FFMpeg -ListCaptureDevice
$ShowSplat = [Ordered]@{
    DirectShow = $true
    VideoDevice = $CameraName
    Mirror = $true
    TimeMix = 5
    EdgeDetect = $true
    DrawText = $true
    DrawTextFontSize = 24            
    DrawTextFontColor = 'white'
    DrawTextShadowColor = 'black'
    DrawTextBorderWidth = 2
    DrawTextBorderColor = 'black'
    DrawTextCenter = $true
}
$showText = @(foreach ($kv in $showSplat.GetEnumerator()) {
    if ($kv.Value -is [bool]) {
        "-$($kv.Key)"
    } else {
        "-$($kv.Key) '$($kv.Value)'"
    }
}) -join [Environment]::Newline
$showSplat.DrawTextText = $showText
Show-Media @showSplat -Fullscreen -Verbose
```

---
### Parameters
#### **InputPath**

The input path.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



---
#### **AsJob**

If set, will run as a background job.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **Resolution**

The resolution of the media player.  This can be passed down to extensions that generate video.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |



---
#### **ShowMode**

The display mode.  When input is audio, defaults to 'Waves'



Valid Values:

* Default
* Waves
* RDFT






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **Volume**

The volume.






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|



---
#### **Fullscreen**

If set, will run fullscreen






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **KeepOpen**

If set, will keep the player open after the media finishes.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **DoNotAutoRotate**

If set, will not automatically rotate video.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **Left**

Set the x position for the left of the window






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|



---
#### **Top**

Set the y position for the top of the window






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|



---
#### **Width**

If set, will force the displayed width.






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|



---
#### **Height**

If set, will force the displayed height.






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|



---
#### **NoDisplay**

If set, will not display anything.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **NoBorder**

If set, will run in a borderless window.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **AlwaysOnTop**

If set, will run in a window that is always on top.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **Loop**

If set, this will loop the input source.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **LoopCount**

If set, this will loop the input source any number of times.






|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|



---
#### **ThreadCount**

The number of threads to use for decoding and filtering.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **FFPlayPath**

The path to FFPlay.  If not provided, this will be automatically detected.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |



---
### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)


* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)




---
### Syntax
```PowerShell
Show-Media [[-InputPath] <String>] [-AsJob] [-Resolution <String>] [-ShowMode <String>] [-Volume <Int32>] [-Fullscreen] [-KeepOpen] [-DoNotAutoRotate] [-Left <Int32>] [-Top <Int32>] [-Width <Int32>] [-Height <Int32>] [-NoDisplay] [-NoBorder] [-AlwaysOnTop] [-Loop] [-LoopCount <Int32>] [-ThreadCount <String>] [-FFPlayPath <String>] [<CommonParameters>]
```
---
