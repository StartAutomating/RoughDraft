<#
.SYNOPSIS
    Gets a Video's Bitrate
.DESCRIPTION
    Gets a Video's Bitrate, if the information is available in any Video stream.
#>
foreach ($streamInfo in $this.Streams) {
    if ($streamInfo.codec_type -ne 'video') { continue }
    if ($streamInfo.bit_rate) {
        return ($streamInfo.bit_rate -as [int])
    }
}


