
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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **FiniteEqualizerGainentry**

Set gain entry for gain_interpolate function. The expression can contain functions:

entry(f, g)
store gain entry at frequency f with value g

This option is also available as command.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **FiniteEqualizerDelay**

Set filter delay in seconds. Higher value means more accurate.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |



---
#### **FiniteEqualizerAccuracy**

Set filter accuracy in Hz. Lower value means more accurate.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |



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






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **FiniteEqualizerFixed**

If enabled, use fixed number of audio samples. This improves speed when filtering with large delay. Default is disabled.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **FiniteEqualizerMultichannel**

Enable multichannels evaluation on gain.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **FiniteEqualizerZeroPhase**

Enable zero phase mode by subtracting timestamp to compensate delay.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **FiniteEqualizerScale**

set gain scale



Valid Values:

* linlin
* linlog
* loglin
* loglog






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **FiniteEqualizerDumpfile**

set dump file






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |



---
#### **FiniteEqualizerDumpscale**

set dump scale






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **FiniteEqualizerFft2**

Enable 2-channel convolution using complex FFT.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **FiniteEqualizerMinphase**

Enable minimum phase impulse response.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
### Syntax
```PowerShell
Extension/FiniteEqualizer.RoughDraft.Extension.ps1 -FiniteEqualizer [[-FiniteEqualizerGain] <String>] [[-FiniteEqualizerGainentry] <String>] [[-FiniteEqualizerDelay] <Double>] [[-FiniteEqualizerAccuracy] <Double>] [[-FiniteEqualizerWindowFunction] <String>] [-FiniteEqualizerFixed] [-FiniteEqualizerMultichannel] [-FiniteEqualizerZeroPhase] [[-FiniteEqualizerScale] <String>] [[-FiniteEqualizerDumpfile] <String>] [-FiniteEqualizerDumpscale] [-FiniteEqualizerFft2] [-FiniteEqualizerMinphase] [<CommonParameters>]
```
---




