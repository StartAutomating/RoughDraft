<#
.SYNOPSIS
    Sets the Genre Metadata
.DESCRIPTION
    Changes the Genre metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{genre="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.genre = $propertyToSet.genre
Set-Media -InputPath $this.InputPath -Property $propertyToSet

