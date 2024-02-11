<#
.SYNOPSIS
    Gets a Video or Image PixelFormat
.DESCRIPTION
    Gets the pixel format the first video or image stream.
#>
foreach ($streamInfo in $this.Streams) {
    if ($streamInfo.codec_type -ne 'video') { continue }
    if ($streamInfo.pix_fmt) {
        return $streamInfo.pix_fmt
    }
}



