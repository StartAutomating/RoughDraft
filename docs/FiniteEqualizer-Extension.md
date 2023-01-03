
Extension/FiniteEqualizer.RoughDraft.Extension.ps1
--------------------------------------------------
### Synopsis
Finite Equalizer

---
### Description

Finite Impulse Response Equalizer.

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#firequalizer](https://ffmpeg.org/ffmpeg-filters.html#firequalizer)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath .\a.mp3 -FiniteEqualizer -FiniteEqualizerGain @'
if(eq(chid,1), gain_interpolate(f), if(eq(chid,2), gain_interpolate(1e6+f), 0))
'@ -FiniteEqualizerGainentry @'
entry(1000, 0); entry(1001,-INF); entry(1e6+1000,0)
'@
```

---
### Parameters
#### **FiniteEqualizer**

Finite Impulse Response Equalizer.



> **Type**: ```[Switch]```

> **Required**: true

> **Position**: named

> **PipelineInput**:false



---
#### **FiniteEqualizerGain**

Set gain curve equation (in dB).


The expression can contain variables:

f
the evaluated frequency

sr
sample rate

ch
channel number, set to 0 when multichannels evaluation is disabled

chid
channel id, see libavutil/channel_layout.h, set to the first channel id when multichannels evaluation is disabled

chs
number of channels

chlayout
channel_layout, see libavutil/channel_layout.h

and functions:

gain_interpolate(f)
interpolate gain on frequency f based on gain_entry

cubic_interpolate(f)
same as gain_interpolate, but smoother



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **FiniteEqualizerGainentry**

Set gain entry for gain_interpolate function. The expression can contain functions:

entry(f, g)
store gain entry at frequency f with value g

This option is also available as command.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
#### **FiniteEqualizerDelay**

Set filter delay in seconds. Higher value means more accurate.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **FiniteEqualizerAccuracy**

Set filter accuracy in Hz. Lower value means more accurate.



> **Type**: ```[Double]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **FiniteEqualizerWindowFunction**

set window function



Valid Values:

* rectangular
* hann
* hamming
* blackman
* nuttall3
* mnuttall3
* nuttall
* bnuttall
* bharris
* tukey



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
#### **FiniteEqualizerFixed**

If enabled, use fixed number of audio samples. This improves speed when filtering with large delay. Default is disabled.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FiniteEqualizerMultichannel**

Enable multichannels evaluation on gain.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FiniteEqualizerZeroPhase**

Enable zero phase mode by subtracting timestamp to compensate delay.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FiniteEqualizerScale**

set gain scale



Valid Values:

* linlin
* linlog
* loglin
* loglog



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:false



---
#### **FiniteEqualizerDumpfile**

set dump file



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:false



---
#### **FiniteEqualizerDumpscale**

set dump scale



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FiniteEqualizerFft2**

Enable 2-channel convolution using complex FFT.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **FiniteEqualizerMinphase**

Enable minimum phase impulse response.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
### Syntax
```PowerShell
Extension/FiniteEqualizer.RoughDraft.Extension.ps1 -FiniteEqualizer [[-FiniteEqualizerGain] <String>] [[-FiniteEqualizerGainentry] <String>] [[-FiniteEqualizerDelay] <Double>] [[-FiniteEqualizerAccuracy] <Double>] [[-FiniteEqualizerWindowFunction] <String>] [-FiniteEqualizerFixed] [-FiniteEqualizerMultichannel] [-FiniteEqualizerZeroPhase] [[-FiniteEqualizerScale] <String>] [[-FiniteEqualizerDumpfile] <String>] [-FiniteEqualizerDumpscale] [-FiniteEqualizerFft2] [-FiniteEqualizerMinphase] [<CommonParameters>]
```
---



