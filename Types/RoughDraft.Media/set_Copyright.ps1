<#
.SYNOPSIS
    Sets the Copyright Metadata
.DESCRIPTION
    Changes the Copyright metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{copyright="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Copyright = $propertyToSet.copyright
Set-Media -InputPath $this.InputPath -Property $propertyToSet

