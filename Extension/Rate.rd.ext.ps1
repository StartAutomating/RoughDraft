<#
.Synopsis
    Adjusts the rate of media.
.Description
    Adjusts the playback rate of media, making it slower or faster.
.Notes
    This uses a variety of filters:

    * setpts
    * atempo
    * asetpts
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Measure-Media            
[Management.Automation.Cmdlet("Measure","Media")]
param(
[Parameter(Mandatory)]
[double]
$Rate
)

$streams  = $MediaInfo.stream
$hasVideo = $streams | Where-Object { $_.Codec_Type -eq 'Video'}
$hasAudio = $streams | Where-Object { $_.Codec_Type -eq 'Audio'}

if ($hasVideo -and $hasAudio) {
    $videoRate = 1 / $rate
    "-filter_complex"
    if ($rate -ge .05 -and $rate -le 2) {
        "`"[0:v]setpts=$videoRate*PTS[v];[0:a]atempo=$Rate[a]`""
    } else {
        Write-Warning 'Stream Contains Audio and is being adjusted by a factor greater than 2. Audio frames will be dropped rather instead of adjusting the tempo.'
        "`"[0:v]setpts=$videoRate*PTS[v];[0:a]asetpts=$videoRate*PTS[a]`""
    }
    "-map"
    '"[v]"'
    "-map"
    '"[a]"'
} 
elseif ($hasVideo) 
{
    $videoRate = 1 / $rate
    '-vf'
    "setpts=$videoRate*PTS"
}
elseif ($hasAudio) 
{
    '-af'
    if ($rate -ge .05 -and $rate -le 2) {
        "atempo=$Rate"
    } else {
        Write-Warning 'Stream Contains Audio and is being adjusted by a factor greater than 2. Audio frames will be dropped rather instead of adjusting the tempo.'
        "asetpts=$videoRate*PTS"
    }                
}
