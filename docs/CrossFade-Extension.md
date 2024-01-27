Extension/CrossFade.RoughDraft.Extension.ps1
--------------------------------------------

### Synopsis
acrossfade

---

### Description

Cross fade two input audio streams.

---

### Related Links
* [https://ffmpeg.org/ffmpeg-filters.html#acrossfade](https://ffmpeg.org/ffmpeg-filters.html#acrossfade)

---

### Parameters
#### **CrossFade**
Cross fade two input audio streams.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|true    |named   |false        |ACrossFade|

#### **CrossfadeSampleCount**
Set number of samples for cross fade duratio.  Default is 44100.

|Type     |Required|Position|PipelineInput|Aliases              |
|---------|--------|--------|-------------|---------------------|
|`[Int32]`|false   |1       |false        |acrossfade_nb_samples|

#### **CrossfadeDuration**
set cross fade duration

|Type        |Required|Position|PipelineInput|Aliases            |
|------------|--------|--------|-------------|-------------------|
|`[TimeSpan]`|false   |2       |false        |acrossfade_duration|

#### **CrossfadeOverlap**
overlap 1st stream end with 2nd stream start

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |acrossfade_overlap|

#### **CrossfadeCurve1**
set fade curve type for 1st stream 
|Setting|Description|
|-|-|
|tri|triangular, linear slope (default)|
|qsin  |quarter of sine wave|
|hsin  |half of sine wave|
|esin  |exponential sine wave|
|log   |logarithmic|
|ipar  |inverted parabola|
|qua   |quadratic|
|cub   |cubic|
|squ   |square root|
|cbr   |cubic root|
|par   |parabola|
|exp   |exponential|
|iqsin |inverted quarter of sine wave|
|ihsin |inverted half of sine wave|
|dese  |double-exponential seat|
|desi  |double-exponential sigmoid|
|losi  |logistic sigmoid|
|sinc  |sine cardinal function|
|isinc |inverted sine cardinal function|
|nofade|no fade applied|
Valid Values:

* tri
* qsin
* hsin
* esin
* log
* ipar
* qua
* cub
* squ
* cbr
* par
* exp
* iqsin
* ihsin
* dese
* desi
* losi
* sinc
* isinc
* nofade

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |3       |false        |acrossfade_c1|

#### **CrossfadeCurve2**
set fade curve type for 2nd stream 
|Setting|Description|
|-|-|
|tri|triangular, linear slope (default)|
|qsin  |quarter of sine wave|
|hsin  |half of sine wave|
|esin  |exponential sine wave|
|log   |logarithmic|
|ipar  |inverted parabola|
|qua   |quadratic|
|cub   |cubic|
|squ   |square root|
|cbr   |cubic root|
|par   |parabola|
|exp   |exponential|
|iqsin |inverted quarter of sine wave|
|ihsin |inverted half of sine wave|
|dese  |double-exponential seat|
|desi  |double-exponential sigmoid|
|losi  |logistic sigmoid|
|sinc  |sine cardinal function|
|isinc |inverted sine cardinal function|
|nofade|no fade applied|
Valid Values:

* tri
* qsin
* hsin
* esin
* log
* ipar
* qua
* cub
* squ
* cbr
* par
* exp
* iqsin
* ihsin
* dese
* desi
* losi
* sinc
* isinc
* nofade

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |4       |false        |acrossfade_c2|

---

### Syntax
```PowerShell
Extension/CrossFade.RoughDraft.Extension.ps1 -CrossFade [[-CrossfadeSampleCount] <Int32>] [[-CrossfadeDuration] <TimeSpan>] [-CrossfadeOverlap] [[-CrossfadeCurve1] <String>] [[-CrossfadeCurve2] <String>] [<CommonParameters>]
```
