<#
.SYNOPSIS
    Gets the Media Type
.DESCRIPTION
    Gets the Media Type of a file discovered by Get-Media.
.NOTES
    Getting the Media Type also decorates the object as that media type, so that extended Audio, Video, and Image functionality are available.
.EXAMPLE
    Get-Media -InputPath .\a.mp4 |
        Select-Object -ExpandProperty MediaType
#>
param()
$allCodecTypes = $this.CodecTypes -join ' '
$thisMediaType = 
    if ($allCodecTypes -eq 'audio') {
        'Audio'
    }
    elseif ($allCodecTypes -match '^video') {
        if ($this.Duration -and $this.Duration.TotalMilliseconds -gt 50) {
            'Video'
        } else {
            'Image'
        }    
    }
if ($this.pstypenames -notcontains "RoughDraft.$thisMediaType") {
    $this.pstypenames.add("RoughDraft.$thisMediaType")
}

$thisMediaType
