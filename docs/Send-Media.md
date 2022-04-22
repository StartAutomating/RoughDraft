
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



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **InputDevice**

The input device identifier.  This will be specific to a given input type.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **InputPath**

The input path.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **InitialArgumentList**

A list of initial arguments to FFMpeg.



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **ArgumentList**

A list of additional arguments to FFMpeg.



|Type            |Requried|Postion|PipelineInput|
|----------------|--------|-------|-------------|
|```[String[]]```|false   |named  |false        |
---
#### **OutputUri**

The outputURI where the broadcast will be sent.



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|false   |named  |true (ByPropertyName)|
---
#### **OutputProtocol**

The protocol used to broadcast the output.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **AsJob**

If set, will run as a background job.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in the path.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **Loop**

If set, this will loop the input source.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **LoopCount**

If set, this will loop the input source any number of times.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
### Syntax
```PowerShell
Send-Media [-InputType <String>] [-InputDevice <String>] [-InitialArgumentList <String[]>] [-ArgumentList <String[]>] [-OutputUri <Uri>] [-OutputProtocol <String>] [-AsJob] [-FFMpegPath <String>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
```PowerShell
Send-Media [-InputPath <String>] [-InitialArgumentList <String[]>] [-ArgumentList <String[]>] [-OutputUri <Uri>] [-OutputProtocol <String>] [-AsJob] [-FFMpegPath <String>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
---


