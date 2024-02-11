<#
.SYNOPSIS
    Sets the Disc Metadata
.DESCRIPTION
    Changes the Disc metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{disc="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Disc = $propertyToSet.disc
Set-Media -InputPath $this.InputPath -Property $propertyToSet

