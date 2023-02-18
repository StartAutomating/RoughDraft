
Extension/ShowSpectrum.RoughDraft.Extension.ps1
-----------------------------------------------
### Synopsis
Shows the audio spectrum

---
### Description

Shows the audio spectrum, using the [showspectrum filter](https://ffmpeg.org/ffmpeg-filters.html#showspectrum)

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#showspectrum](https://ffmpeg.org/ffmpeg-filters.html#showspectrum)



---
### Examples
#### EXAMPLE 1
```PowerShell
Show-Media -InputPath .\a.mp3 -ShowSpectrum
```

#### EXAMPLE 2
```PowerShell
Edit-Media -InputPath .\a.mp3 -ShowSpectrum -OutputPath .\a.mp4
```

---
### Parameters
#### **ShowSpectrum**

If set, will show a line waveform






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **ShowSpectrumMode**

Set display mode



Valid Values:

* combined
* separate






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



---
#### **ShowSpectrumSlide**

Specify how the spectrum should slide along the window.

It accepts the following values:

* replace   - The samples start again on the left when they reach the right
* scroll    - the samples scroll from right to left
* fullframe - frames are only produced when the samples reach the right
* rscroll   - the samples scroll from left to right
* lreplace  - the samples start again on the right when they reach the left



Valid Values:

* replace
* scroll
* fullframe
* rscroll
* lreplace






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



---
#### **ShowSpectrumSize**

Specify the video size for the output.  Default value is 600x200






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



---
#### **ShowSpectrumColorMode**

Show spectrum color mode

* channel     - each channel is displayed in a separate color
* intensity   - each channel is displayed using the same color scheme
* rainbow     - each channel is displayed using the rainbow color scheme
* moreland    - each channel is displayed using the moreland color scheme
* nebulae     - each channel is displayed using the nebulae color scheme
* fire        - each channel is displayed using the fire color scheme
* fiery       - each channel is displayed using the fiery color scheme
* fruit       - each channel is displayed using the fruit color scheme
* cool        - each channel is displayed using the cool color scheme
* magma       - each channel is displayed using the magma color scheme
* green       - each channel is displayed using the green color scheme
* viridis     - each channel is displayed using the viridis color scheme
* plasma      - each channel is displayed using the plasma color scheme
* cividis     - each channel is displayed using the cividis color scheme
* terrain     - each channel is displayed using the terrain color scheme



Valid Values:

* channel
* intensity
* rainbow
* moreland
* nebulae
* fire
* fiery
* fruit
* cool
* magma
* green
* viridis
* plasma
* cividis
* terrain






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



---
#### **ShowSpectrumColorScale**

Specify scale used for calculating intensity color values.



Valid Values:

* lin
* log
* sqrt
* cbrt
* 4thrt
* 5thrt






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



---
#### **ShowSpectrumFrequencyScale**

Specify frequency scale.



Valid Values:

* lin
* log






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **ShowSpectrumSaturation**

Set saturation modifier for displayed colors.
Negative values provide alternative color scheme.
0 is no saturation at all.
Saturation must be in [-10.0, 10.0] range. Default value is 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |



---
#### **ShowSpectrumWindowFunction**

Set window function.



Valid Values:

* rect
* bartlett
* hann
* hanning
* hamming
* blackman
* welch
* flattop
* bharris
* bnuttall
* bhann
* sine
* nuttall
* lanczos
* gauss
* tukey
* dolph
* cauchy
* parzen
* poisson
* bohman






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
#### **ShowSpectrumOrientation**

Set orientation of time vs frequency axis



Valid Values:

* horizontal
* vertical






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |



---
#### **ShowSpectrumOverlap**

Set ratio of overlap window. Default value is 0. When value is 1 overlap is set to recommended size for specific window function currently used.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |10      |false        |



---
#### **ShowSpectrumGain**

Set scale gain for calculating intensity color values. Default value is 1.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |11      |false        |



---
#### **ShowSpectrumData**

Set which data to display. Can be magnitude, default or phase, or unwrapped phase: uphase.



Valid Values:

* magnitude
* phase
* uphase






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |



---
#### **ShowSpectrumColorRotation**

Set color rotation, must be in [-1.0, 1.0] range. Default value is 0






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |13      |false        |



---
#### **ShowSpectrumStartFrequency**

Set start frequency from which to display spectrogram.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |14      |false        |



---
#### **ShowSpectrumStopFrequency**

Set stop frequency to which to display spectrogram.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |15      |false        |



---
#### **ShowSpectrumFramesPerSecond**

Set upper frame rate limit. Default is auto, unlimited.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |



---
#### **ShowSpectrumLegend**

Draw time and frequency axes and legends.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



---
#### **ShowSpectrumDynamicRange**

Set dynamic range used to calculate intensity color values. Default is 120 dBFS. Allowed range is from 10 to 200






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |17      |false        |



---
#### **ShowSpectrumLimit**

Set upper limit of input audio samples volume in dBFS. Default is 0 dBFS. Allowed range is from -100 to 100.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |18      |false        |



---
#### **ShowSpectrumOpacity**

Set opacity strength when using pixel format output with alpha component.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |19      |false        |



---
### Syntax
```PowerShell
Extension/ShowSpectrum.RoughDraft.Extension.ps1 -ShowSpectrum [[-ShowSpectrumMode] <String>] [[-ShowSpectrumSlide] <String>] [[-ShowSpectrumSize] <String>] [[-ShowSpectrumColorMode] <String>] [[-ShowSpectrumColorScale] <String>] [[-ShowSpectrumFrequencyScale] <String>] [[-ShowSpectrumSaturation] <Double>] [[-ShowSpectrumWindowFunction] <String>] [[-ShowSpectrumOrientation] <String>] [[-ShowSpectrumOverlap] <Double>] [[-ShowSpectrumGain] <Double>] [[-ShowSpectrumData] <String>] [[-ShowSpectrumColorRotation] <Double>] [[-ShowSpectrumStartFrequency] <Int32>] [[-ShowSpectrumStopFrequency] <Int32>] [[-ShowSpectrumFramesPerSecond] <String>] [-ShowSpectrumLegend] [[-ShowSpectrumDynamicRange] <Int32>] [[-ShowSpectrumLimit] <Int32>] [[-ShowSpectrumOpacity] <Double>] [<CommonParameters>]
```
---




