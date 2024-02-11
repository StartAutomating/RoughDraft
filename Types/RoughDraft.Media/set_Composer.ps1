<#
.SYNOPSIS
    Sets the Composer Metadata
.DESCRIPTION
    Changes the Composer metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{composer="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Composer = $propertyToSet.Composer
Set-Media -Property $propertyToSet
