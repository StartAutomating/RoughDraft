
Extension/Echo.RoughDraft.Extension.ps1
---------------------------------------
### Synopsis
Adds echoes to audio

---
### Description

Apply echoing to the input audio.

Echoes are reflected sound and can occur naturally amongst mountains (and sometimes large buildings) when talking or shouting; 
digital echo effects emulate this behaviour and are often used to help fill out the sound of a single instrument or vocal. 

The time difference between the original signal and the reflection is the delay, 
and the loudness of the reflected signal is the decay. 

Multiple echoes can have different delays and decays.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#aecho](https://ffmpeg.org/ffmpeg-filters.html#aecho)



---
### Parameters
#### **Echo**

If set, will remove a logo



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **EchoInputGain**

Set input gain of reflected signal. Default is 0.6.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **EchoOutputGain**

Set output gain of reflected signal. Default is 0.3.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **EchoDelay**

Set list of time intervals in milliseconds between original signal and reflections. Allowed range for each delay is (0 - 90000.0). Default is 1000



> **Type**: ```[Double[]]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **EchoDecay**

Set list of loudness of reflected signal
Allowed range for each decay is (0 - 1.0)



> **Type**: ```[Double[]]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/Echo.RoughDraft.Extension.ps1 -Echo [[-EchoInputGain] <Double>] [[-EchoOutputGain] <Double>] [[-EchoDelay] <Double[]>] [[-EchoDecay] <Double[]>] [<CommonParameters>]
```
---



