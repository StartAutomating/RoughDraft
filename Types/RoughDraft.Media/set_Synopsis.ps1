<#
.SYNOPSIS
    Sets the Synopsis Metadata
.DESCRIPTION
    Changes the Synopsis metadata for a media file (persistently, if possible)
.NOTES
    Synopsis is stored within the ID3 tag `ldes`.
#>
param()
$propertyToSet = @{ldes="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Synopsis = $propertyToSet.ldes
Set-Media -InputPath $this.InputPath -Property $propertyToSet

