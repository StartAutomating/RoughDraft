<#
.SYNOPSIS
    Sets the BPM Metadata
.DESCRIPTION
    Changes the BPM metadata for a media file (persistently, if possible)
.NOTES
    BPM is stored within the ID3 tag `TBPM`.
#>
param()
$propertyToSet = @{TBPM="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.BPM = $propertyToSet.TBPM
Set-Media -InputPath $this.InputPath -Property $propertyToSet

