<#
.SYNOPSIS
    Sets the Description Metadata
.DESCRIPTION
    Changes the Description metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{desc="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Description = $propertyToSet.desc
Set-Media -InputPath $this.InputPath -Property $propertyToSet

