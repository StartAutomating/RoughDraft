<#
.Synopsis
    Draw subtitles on top of input video
.Description
    Draw subtitles on top of input video using the libass library
.EXAMPLE
    Convert-Media
.Link
    https://ffmpeg.org/ffmpeg-filters.html#subtitles-1
.Link
    https://ffmpeg.org/ffmpeg-filters.html#ass
#>
[Management.Automation.Cmdlet("Convert","Media")]  # It's an extension for Convert/Edit-Media
[Management.Automation.Cmdlet("Edit","Media")]
param(
# Set the filename of the subtitle file to read. It must be specified.
[Parameter(Mandatory)]
[string]
$SubtitleFile,

# Specify the size of the original video, the video for which the ASS file was composed.
[string]
$OriginalVideoSize,

# Set a directory path containing fonts that can be used by the filter.
# These fonts will be used in addition to whatever the font provider uses.
[string]
$SubtitleFontDirectory,

# Process alpha channel, by default alpha channel is untouched.
[string]
$SubtitleAlpha,

# Set subtitles input character encoding. subtitles filter only. Only useful if not UTF-8.
[string]
$SubtitleCharacterEncoding,

# Set subtitles stream index. subtitles filter only.
[int]
$SubtitleStreamIndex,

# Override default style or script info parameters of the subtitles.
# It accepts a string containing ASS style format KEY=VALUE couples separated by ",".
[string]
$SubtitleStyle
)

$filterArgs  =@(
    if ($SubtitleFile) {
        $resolvedSubtitleFile = $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($SubtitleFile)
        "filename='$("$resolvedSubtitleFile".Replace('\', "'\\\\'").Replace("'","'\''").Replace(":", "'\\:'"))'"
    }
    if ($SubtitleFontDirectory) {
        "fontsdir='$($SubtitleFontDirectory.Replace('\', "'\\\\'").Replace("'","'\''").Replace(":", "'\\:'"))'"
    }
    if ($SubtitleAlpha) { 
        "alpha=$SubtitleAlpha"
    }
    if ($SubtitleCharacterEncoding) {
        "charenc=$SubtitleCharacterEncoding"
    }
    if ($SubtitleStreamIndex) {
        "stream_index=$SubtitleStreamIndex"
    }
    if ($SubtitleStyle) {
        "force_style='$($subtitleStyle.Replace('\', "'\\\\'").Replace("'","'\''").Replace(":", "'\\:'"))'"
    }
)

if ($SubtitleFile -like '*.ass') {
    $filterArgs = @($filterArgs -notlike 'charenc=*' -notlike 'stream_index=*') -join ':'
    "-vf"
    "ass=$filterArgs"
} else {
    "-vf"
    "subtitles=$($filterArgs -join ':')"
}
