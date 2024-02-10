<#
.SYNOPSIS
    Gets Audio Bitrate
.DESCRIPTION
    Gets an Audio's Bitrate, if the information is available in any Audio stream.
#>
foreach ($streamInfo in $this.Streams) {
    if ($streamInfo.codec_type -ne 'audio') { continue }
    if ($streamInfo.bit_rate) {
        return ($streamInfo.bit_rate -as [int])
    }
}