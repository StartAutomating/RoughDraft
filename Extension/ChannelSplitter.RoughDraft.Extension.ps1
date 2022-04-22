<#
.Synopsis
    Splits audio into channels
.Description
    Splits audio into channels, using the channelsplit filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#channelsplit
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Split-Media            
[Management.Automation.Cmdlet("Split","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will split channels of audio into separate files.
[Parameter(Mandatory)]
[switch]
$ChannelSplit,

# The channel layout of the input stream. The default is "stereo".
[string]
$ChannelLayout,

[Collections.IDictionary]
$ChannelOutputFile
)

if (-not $ChannelLayout) {
    $ChannelLayout = 'stereo','[left]','[right]'
}

if (-not $ChannelOutputFile) {
    $ChannelOutputFile = @{
        "left" = "_Left"
        "right" = "_Right"
    }
}

$outPathBase =
    if (-not $in.OutputPath) {
        $fileInfo.FullName.Substring(0, $fileInfo.FullName.Length - $fileInfo.Extension.Length)
    } else {
        $in.outputPath -replace '\.[^.]+$'
    }

$outputMaps = @()
foreach ($kv in $ChannelOutputFile.GetEnumerator()) {
    $channelOutPath  = 
        if ($kv.Value -notlike '*.*') {
            $fileInfo.Name.Substring(0, $fileInfo.Name.Length - $fileInfo.Extension.Length) + $kv.Value + $fileInfo.Extension
        } else {
            $kv.Value
        }
    $channelOutPath= 
        if ($channelOutPath.Contains([IO.Path]::DirectorySeparatorChar)) {
            $channelOutPath
        } else {
            $channelOutPath
        }
    $outputMaps += '-map', "[$($kv.Key)]", "`"$channelOutPath`""
}

'-vn'
'-ss'
'0'
'-t'
$theDuration.TotalSeconds
'-y'
'-filter_complex'
"[0:a]channelsplit=channel_layout=$ChannelLayout"
foreach ($om in $outputMaps) {
    $om
}

