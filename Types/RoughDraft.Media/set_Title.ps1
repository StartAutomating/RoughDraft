<#
.SYNOPSIS
    Sets the Title Metadata
.DESCRIPTION
    Changes the Title metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{title="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.title = $propertyToSet.title
Set-Media -InputPath $this.InputPath -Property $propertyToSet

