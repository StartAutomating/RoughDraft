<#
.SYNOPSIS
    Sets the Track Metadata
.DESCRIPTION
    Changes the Track metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{track="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Track = $propertyToSet.track
Set-Media -InputPath $this.InputPath -Property $propertyToSet

