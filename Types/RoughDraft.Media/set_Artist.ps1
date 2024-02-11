<#
.SYNOPSIS
    Sets the Artist Metadata
.DESCRIPTION
    Changes the Artist metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{artist="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.AlbumArtist = $propertyToSet.artist
Set-Media -InputPath $this.InputPath -Property $propertyToSet

