Extension/Vibrance.RoughDraft.Extension.ps1
-------------------------------------------

### Synopsis
vibrance

---

### Description

Boost or alter saturation.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#vibrance](https://ffmpeg.org/ffmpeg-filters.html#vibrance)

---

### Parameters
#### **Vibrance**
Boost or alter saturation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **VibranceIntensity**
set the intensity value

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Single]`|false   |1       |false        |vibrance_intensity|

#### **VibranceRedBalance**
set the red balance value

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Single]`|false   |2       |false        |vibrance_rbal|

#### **VibranceGreenBalance**
set the green balance value

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Single]`|false   |3       |false        |vibrance_gbal|

#### **VibranceBlueBalance**
set the blue balance value

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Single]`|false   |4       |false        |vibrance_bbal|

#### **VibranceRedLuma**
set the red luma coefficient

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Single]`|false   |5       |false        |vibrance_rlum|

#### **VibranceGreenLuma**
set the green luma coefficient

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Single]`|false   |6       |false        |vibrance_glum|

#### **VibranceBlueLuma**
set the blue luma coefficient

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Single]`|false   |7       |false        |vibrance_blum|

#### **VibranceAlternate**
use alternate colors

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |vibrance_alternate|

---

### Syntax
```PowerShell
Extension/Vibrance.RoughDraft.Extension.ps1 -Vibrance [[-VibranceIntensity] <Single>] [[-VibranceRedBalance] <Single>] [[-VibranceGreenBalance] <Single>] [[-VibranceBlueBalance] <Single>] [[-VibranceRedLuma] <Single>] [[-VibranceGreenLuma] <Single>] [[-VibranceBlueLuma] <Single>] [-VibranceAlternate] [<CommonParameters>]
```
