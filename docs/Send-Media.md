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



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **InputDevice**

The input device identifier.  This will be specific to a given input type.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **InputPath**

The input path.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **InitialArgumentList**

A list of initial arguments to FFMpeg.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **ArgumentList**

A list of additional arguments to FFMpeg.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **OutputUri**

The outputURI where the broadcast will be sent.



> **Type**: ```[Uri]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputProtocol**

The protocol used to broadcast the output.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AsJob**

If set, will run as a background job.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FFMpegPath**

The path to FFMpeg.exe.  By default, checks in the path.



> **Type**: ```[String]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **Loop**

If set, this will loop the input source.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **LoopCount**

If set, this will loop the input source any number of times.



> **Type**: ```[Int32]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Send-Media [-InputType <String>] [-InputDevice <String>] [-InitialArgumentList <String[]>] [-ArgumentList <String[]>] [-OutputUri <Uri>] [-OutputProtocol <String>] [-AsJob] [-FFMpegPath <String>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
```PowerShell
Send-Media [-InputPath <String>] [-InitialArgumentList <String[]>] [-ArgumentList <String[]>] [-OutputUri <Uri>] [-OutputProtocol <String>] [-AsJob] [-FFMpegPath <String>] [-Loop] [-LoopCount <Int32>] [<CommonParameters>]
```
---
