<#
.SYNOPSIS
    Sets the Grouping Metadata
.DESCRIPTION
    Changes the Grouping metadata for a media file (persistently, if possible)
#>
param()

$propertyToSet = @{grouping=$args -join '/'}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Grouping = $propertyToSet.grouping
Set-Media -InputPath $this.InputPath -Property $propertyToSet

