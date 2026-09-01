<#
.Synopsis
    Trim Video
.Description
    Trims Video, using the `trim` filter.
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#trim
#>
[Management.Automation.Cmdlet("(?>Convert|Edit)","Media")]
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

# Same as TrimStart, in timebase units instead of seconds.
[Alias('start_pts')]
[int]
$TrimStartPoint,

# Same as TrimEnd, in timebase units instead of seconds.
[Alias('end_pts')]
[int]
$TrimEndPoint,

# The number of the first frame that should be output.
[Alias('start_frame')]
[int]
$TrimStartFrame,

# The number of the first frame that should be dropped.
[Alias('end_frame')]
[int]
$TrimEndFrame,

# The maximum duration of the output.
[TimeSpan]
$TrimDuration
)

"-vf" # Video Filter

$filterArgs =@(
    if ($TrimStart){ "start=$($TrimStart.TotalSeconds)" }
    if ($TrimEnd) { "end=$($TrimEnd.TotalSeconds)" }
    if ($TrimStartPoint) { "start_pts=$TrimStartPoint" }
    if ($TrimEndPoint) { "end_pts=$TrimEndPoint" }
    if ($TrimStartFrame) { "start_frame=$TrimStartSample" }
    if ($TrimEndFrame) { "end_frame=$TrimEndSample" }
    if ($TrimDuration) { "duration=$($trimDuration.TotalSeconds)" }
) -join ':'

"trim=$FilterArgs" -replace '=$'