<#
.SYNOPSIS
    Gets Album Artist Metadata
.DESCRIPTION
    Gets the Album Artist Metadata, if present.
#>
param()
return $(
    if ($this.'.Metadata'.AlbumArtist) {
        $this.'.Metadata'.AlbumArtist
    } elseif ($this.'.Metadata'.album_artist) {
        $this.'.Metadata'.album_artist
    }
)