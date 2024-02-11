<#
.SYNOPSIS
    Sets the BPM Metadata
.DESCRIPTION
    Changes the BPM metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{TBPM="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.BPM = $propertyToSet.TBPM
Set-Media -Property $propertyToSet
