<#
.SYNOPSIS
    Sets the Album Artist Metadata
.DESCRIPTION
    Changes the Album Artist metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{album_artist="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.AlbumArtist = $propertyToSet.album_artist
Set-Media -InputPath $this.InputPath -Property $propertyToSet

