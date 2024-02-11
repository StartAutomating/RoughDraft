<#
.SYNOPSIS
    Gets a Video or Image Aspect Ratio
.DESCRIPTION
    Gets the aspect ratio of the first video or image stream.
#>
foreach ($streamInfo in $this.Streams) {
    if ($streamInfo.codec_type -ne 'video') { continue }
    if ($streamInfo.display_aspect_ratio) {
        return $streamInfo.display_aspect_ratio
    }
}