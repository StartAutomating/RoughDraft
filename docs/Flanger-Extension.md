
Extension/Flanger.RoughDraft.Extension.ps1
------------------------------------------
### Synopsis
Audio Flanger.

---
### Description

Apply a flanging effect to the audio

---
### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#flanger](https://ffmpeg.org/ffmpeg-filters.html#flanger)



---
### Examples
#### EXAMPLE 1
```PowerShell
Edit-Media -InputPath "a.mp3" -Flanger -FlangerDelay 3 -FlangerDepth 4
```

#### EXAMPLE 2
```PowerShell
Show-Media -InputPath "a.mp3" -Flanger
```

---
### Parameters
#### **Flanger**

If set, will apply a flanger filter.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |



---
#### **FlangerDelay**

Set base delay in milliseconds. Range from 0 to 30. Default value is 0.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |



---
#### **FlangerDepth**

Set added sweep delay in milliseconds. Range from 0 to 10. Default value is 2.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |



---
#### **FlangerRegeneration**

Set percentage regeneration (delayed signal feedback). Range from -95 to 95. Default value is 0.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |



---
#### **FlangerWidth**

Set percentage of delayed signal mixed with original. Range from 0 to 100. Default value is 71.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |



---
#### **FlangerSpeed**

Set sweeps per second (Hz). Range from 0.1 to 10. Default value is 0.5.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |



---
#### **FlangerShape**

Set swept wave shape, can be triangular or sinusoidal. Default value is sinusoidal.



Valid Values:

* Triangular
* Sinusoidal






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



---
#### **FlangerPhase**

Set swept wave percentage-shift for multi channel. Range from 0 to 100. Default value is 25.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |



---
#### **FlangerInteroplation**

Set delay-line interpolation, linear or quadratic. Default is linear.



Valid Values:

* Linear
* Quadratic






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



---
### Syntax
```PowerShell
Extension/Flanger.RoughDraft.Extension.ps1 -Flanger [[-FlangerDelay] <Int32>] [[-FlangerDepth] <Int32>] [[-FlangerRegeneration] <Int32>] [[-FlangerWidth] <Int32>] [[-FlangerSpeed] <Double>] [[-FlangerShape] <String>] [[-FlangerPhase] <Int32>] [[-FlangerInteroplation] <String>] [<CommonParameters>]
```
---




