Send-Media
----------
### Synopsis
Sends Media

---
### Description

Sends media from inputs to a stream.

---
### Parameters
#### **InputType**

The input device type.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **InputDevice**

The input device identifier.  This will be specific to a given input type.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **InputPath**

The input path.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **InitialArgumentList**

A list of initial arguments to FFMpeg.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |



---
#### **FFMpegArgument**

A list of additional arguments to FFMpeg.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |



---
#### **OutputUri**

The outputURI where the broadcast will be sent.






|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|false   |named   |true (ByPropertyName)|



---
#### **OutputProtocol**

The protocol used to broadcast the output.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
#### **AsJob**

If set, will run as a background job.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ThrottleLimit**

If set, will limit the number of background jobs to a throttle limit.
By default 5.
Throttling is only available if running on PowerShell Core.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |



---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in the path.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |



---
#### **Loop**

If set, this will loop the input source.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **LoopCount**

If set, this will loop the input source any number of times.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |



---
### Syntax
```PowerShell
Send-Media [-InputType <String>] [-InputDevice <String>] [-InitialArgumentList <String[]>] [-FFMpegArgument <String[]>] [-OutputUri <Uri>] [-OutputProtocol <String>] [-AsJob] [-ThrottleLimit <Int32>] [-FFMpegPath <String>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
```PowerShell
Send-Media [-InputPath <String>] [-InitialArgumentList <String[]>] [-FFMpegArgument <String[]>] [-OutputUri <Uri>] [-OutputProtocol <String>] [-AsJob] [-ThrottleLimit <Int32>] [-FFMpegPath <String>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
---
