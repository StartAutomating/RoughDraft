<#
.SYNOPSIS
    Sets the Album Metadata
.DESCRIPTION
    Changes the Album metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{Album="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Album = $propertyToSet.album
Set-Media -InputPath $this.InputPath -Property $propertyToSet

