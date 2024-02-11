<#
.SYNOPSIS
    Sets the Publisher Metadata
.DESCRIPTION
    Changes the Publisher metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{publisher="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Publisher = $propertyToSet.publisher
Set-Media -InputPath $this.InputPath -Property $propertyToSet

