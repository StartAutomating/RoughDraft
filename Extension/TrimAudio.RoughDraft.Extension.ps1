<#
.Synopsis
    Trim Audio
.Description
    Trims Audio, using the `atrim` filter.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#atrim
#>
[Management.Automation.Cmdlet("(?>Edit|Convert)","Media")]
param(
# If set, will use the `atrim` filter
[Parameter(Mandatory)]
[switch]
$TrimAudio,

# Timestamp (in seconds) of the start of the section to keep. 
# The audio sample with the timestamp start will be the first sample.
[TimeSpan]
$TrimStart,

# Specify time of the first audio sample that will be dropped, 
# The audio sample immediately preceding the one with the timestamp end 
# will be the last sample.
[TimeSpan]
$TrimEnd,

# Same as TrimStart, in samples instead of seconds.
[Alias('start_pts')]
[int]
$TrimStartPoint,

# Same as TrimEnd, in samples instead of seconds.
[Alias('end_pts')]
[int]
$TrimEndPoint,

# The number of the first sample that should be output.
[Alias('start_sample')]
[int]
$TrimStartSample,

# The number of the first sample that should be dropped.
[Alias('end_sample')]
[int]
$TrimEndSample,

# The maximum duration of the output.
[TimeSpan]
$TrimDuration
)

"-af" #Audio Filter

$filterArgs =@(
    if ($TrimStart){ "start=$($TrimStart.TotalSeconds)" }
    if ($TrimEnd) { "end=$($TrimEnd.TotalSeconds)" }
    if ($TrimStartPoint) { "start_pts=$TrimStartPoint" }
    if ($TrimEndPoint) { "end_pts=$TrimEndPoint" }
    if ($TrimStartSample) { "start_sample=$TrimStartSample" }
    if ($TrimEndSample) { "end_sample=$TrimEndSample" }
    if ($TrimDuration) { "duration=$($trimDuration.TotalSeconds)" }
) -join ':'

"atrim=$FilterArgs" -replace '=$'