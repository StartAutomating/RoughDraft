Extension/Compressor.RoughDraft.Extension.ps1
---------------------------------------------

### Synopsis
Audio Compressor

---

### Description

Compresses Audio, using the `acompress` filter

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#acompress](https://ffmpeg.org/ffmpeg-filters.html#acompress)

---

### Examples
Default compressor settings make a song muted.    

```PowerShell
Edit-Media -InputPath $song -Compressor
```
Using a makeup amplifies the sound after compression

```PowerShell
Edit-Media -InputPath $song -Compressor -CompressorAttack 5 -CompressorMakeup 2.5
```
Using attack changes how long to wait before compressing

```PowerShell
Edit-Media -InputPath $song -Compressor -CompressorAttack 5 -CompressorMakeup 2.5
```
Using release changes how long we compress

```PowerShell
Edit-Media -InputPath $song -Compressor -CompressorAttack 5 -CompressorRelease 10 -CompressorMakeup 2.5
```
Using knee changes the smoothness of of compression curve.

```PowerShell
Edit-Media -InputPath $song -Compressor -CompressorAttack 5 -CompressorRelease 10 -CompressorKnee 1 -CompressorMakeup 2.5
```
Using threshold changes how closesly the sound fits the curve.

```PowerShell
$AudioCompressor = @{
    CompressorAttack = 5
    CompressorRelease = 10
    CompressorKnee = 1
    CompressorMakeup = 2.5
    CompressorThreshold = 0.05
}
Edit-Media -InputPath $song -Compressor @AudioCompressor
```
Using mix changes how the output is mixed back in.

```PowerShell
$AudioCompressor = @{
    CompressorAttack = 5
    CompressorRelease = 10
    CompressorKnee = 1
    CompressorMakeup = 2.5
    CompressorThreshold = 0.05
    CompressorMix = 0.75
}
Edit-Media -InputPath $song -Compressor @AudioCompressor
```
Using detection changes how we find our point.

```PowerShell
$AudioCompressor = @{
    CompressorAttack = 5
    CompressorRelease = 10
    CompressorKnee = 1
    CompressorMakeup = 2.5
    CompressorThreshold = 0.05
    CompressorMix = 0.75
    CompressorDetection = 'peak'
}
Edit-Media -InputPath $song -Compressor @AudioCompressor
```

---

### Parameters
#### **Compressor**
If set, will use the `acompressor` filter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **CompressorLevelIn**
Set input gain. 
Default is 1. 
Range is between 0.015625 and 64.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |1       |false        |

#### **CompressorMode**
Set mode of compressor operation.
Can be `upward` or `downward`.
Default is `downward`.
Valid Values:

* upward
* downward

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **CompressorThreshold**
If a signal of stream rises above this level it will affect the gain reduction.
By default it is 0.125. Range is between 0.00097563 and 1.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[Double]`|false   |3       |false        |acompress_threshold|

#### **CompressorRatio**
Set a ratio by which the signal is reduced. 
1:2 means that if the level rose 4dB above the threshold, 
it will be only 2dB above after the reduction. 
Default is 2. 
Range is between 1 and 20.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |

#### **CompressorAttack**
Amount of milliseconds the signal has to rise above 
the threshold before gain reduction starts. 
Default is 20. 
Range is between 0.01 and 2000.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |

#### **CompressorRelease**
Amount of milliseconds the signal has to fall below the threshold 
before reduction is decreased again.
Default is 250. 
Range is between 0.01 and 9000.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |6       |false        |

#### **CompressorMakeup**
Set the amount by how much signal will be amplified after processing. 
Default is 1. 
Range is from 1 to 64.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |

#### **CompressorKnee**
Curve the sharp knee around the threshold to 
enter gain reduction more softly.
Default is 2.82843.
Range is between 1 and 8.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |8       |false        |

#### **CompressorLink**

Valid Values:

* average
* maximum

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **CompressorDetection**
Should the exact signal be taken in case of `peak` or 
an RMS one in case of `rms`.
Default is rms which is mostly smoother.
Valid Values:

* peak
* rms

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **CompressorMix**
How much to use compressed signal in output.
Default is 1. 
Range is between 0 and 1.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |11      |false        |

---

### Notes
A compressor is mainly used to reduce the dynamic range of a signal.

Especially modern music is mostly compressed at 
a high ratio to improve the overall loudness.

It’s done to get the highest attention of a listener, 
"fatten" the sound and bring more "power" to the track. 

If a signal is compressed too much it may sound dull or 
"dead" afterwards or it may start to "pump"
(which could be a powerful effect but can also destroy a track completely).

The right compression is the key to reach a professional sound 
and is the high art of mixing and mastering.

Because of its complex settings it may take a long time to get the right feeling for this kind of effect.

Compression is done by detecting the volume above a chosen level threshold
and dividing it by the factor set with ratio.

So if you set the threshold to -12dB and your signal reaches -6dB a ratio of 2:1 will result in a signal at -9dB.

Because an exact manipulation of the signal would cause distortion
of the waveform the reduction can be levelled over the time.

This is done by setting "Attack" and "Release". 

`attack` determines how long the signal has to rise above the threshold
before any reduction will occur.

`release` sets the time the signal has to fall below the threshold 
to reduce the reduction again.

Shorter signals than the chosen attack time will be left untouched.

The overall reduction of the signal can be made up afterwards with the makeup setting.

So compressing the peaks of a signal about 6dB and raising the makeup 
to this level results in a signal twice as loud than the source.

To gain a softer entry in the compression the knee flattens the 
hard edge at the threshold in the range of the chosen decibels.

---

### Syntax
```PowerShell
Extension/Compressor.RoughDraft.Extension.ps1 -Compressor [[-CompressorLevelIn] <Double>] [[-CompressorMode] <String>] [[-CompressorThreshold] <Double>] [[-CompressorRatio] <Double>] [[-CompressorAttack] <Double>] [[-CompressorRelease] <Double>] [[-CompressorMakeup] <Double>] [[-CompressorKnee] <Double>] [[-CompressorLink] <String>] [[-CompressorDetection] <String>] [[-CompressorMix] <Double>] [<CommonParameters>]
```
