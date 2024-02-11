<#
.SYNOPSIS
    Sets the Show Metadata
.DESCRIPTION
    Changes the Show metadata for a media file (persistently, if possible)
.NOTES
    Show is stored within the ID3 tag `TVSH`.
#>
param()
$propertyToSet = @{TVSH="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Show = $propertyToSet.TVSH
Set-Media -InputPath $this.InputPath -Property $propertyToSet

