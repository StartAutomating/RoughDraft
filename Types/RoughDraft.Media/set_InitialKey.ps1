<#
.SYNOPSIS
    Sets the InitialKey Metadata
.DESCRIPTION
    Changes the InitialKey metadata for a media file (persistently, if possible)
.NOTES
    InitialKey is stored within the ID3 tag `TKEY`.
#>
param()
$propertyToSet = @{TKEY="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.InitialKey = $propertyToSet.TKEY
Set-Media -InputPath $this.InputPath -Property $propertyToSet

