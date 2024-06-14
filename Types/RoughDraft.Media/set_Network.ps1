<#
.SYNOPSIS
    Sets the Network Metadata
.DESCRIPTION
    Changes the Network metadata for a media file (persistently, if possible)
.NOTES
    Network is stored within the ID3 tag `tvnn`.
#>
param()
$propertyToSet = @{network="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Network = $propertyToSet.tvnn
Set-Media -InputPath $this.InputPath -Property $propertyToSet

