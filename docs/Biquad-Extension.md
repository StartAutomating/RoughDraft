Extension/Biquad.RoughDraft.Extension.ps1
-----------------------------------------

### Synopsis
Biquad Filter

---

### Description

Apply a biquad IIR filter with the given coefficients.

Where b0, b1, b2 and a0, a1, a2 are the numerator and denominator coefficients respectively.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#biquad](https://ffmpeg.org/ffmpeg-filters.html#biquad)

---

### Parameters
#### **Biquad**
If set, will use the `biquad` filter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **BiqaudA0**
Biquad Denominator 0

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |

#### **BiqaudA1**
Biquad Denominator 1

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |2       |false        |

#### **BiqaudA2**
Biquad Denominator 2

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |3       |false        |

#### **BiqaudB0**
Biquad Numerator 0

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |

#### **BiqaudB1**
Biquad Numerator 1

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |

#### **BiqaudB2**
Biquad Numerator 2

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |6       |false        |

#### **BiquadNormalize**
Normalize biquad coefficients, by default is disabled.
Enabling it will normalize magnitude response at DC to 0dB.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BiquadTransform**
Set transform type of IIR filter.
Valid Values:

* di
* dii
* tdi
* tdii
* latt
* svf
* zdf

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BiquadPrecision**
Set precision of filtering.
Valid Values:

* auto
* s16
* s32
* f32
* f64

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **BiquadBlockSize**
Set block size used for reverse IIR processing.
If this value is set to high enough value
(higher than impulse response length truncated when reaches near zero values)
filtering will become linear phase otherwise if not big enough it will just produce nasty artifacts.
Note that filter delay will be exactly this many samples when set to non-zero value.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

#### **BiquadChannel**
Specify which channels to filter, by default all available are filtered.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |10      |false        |BiquadChannels|

#### **BiquadMix**
How much to use biquad signal in output.
Default is 1. 
Range is between 0 and 1.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |11      |false        |

---

### Syntax
```PowerShell
Extension/Biquad.RoughDraft.Extension.ps1 -Biquad [[-BiqaudA0] <Double>] [[-BiqaudA1] <Double>] [[-BiqaudA2] <Double>] [[-BiqaudB0] <Double>] [[-BiqaudB1] <Double>] [[-BiqaudB2] <Double>] [-BiquadNormalize] [[-BiquadTransform] <String>] [[-BiquadPrecision] <String>] [[-BiquadBlockSize] <Int32>] [[-BiquadChannel] <String>] [[-BiquadMix] <Double>] [<CommonParameters>]
```
