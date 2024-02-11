<#
.SYNOPSIS
    Sets the Comment Metadata
.DESCRIPTION
    Changes the Comment metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{comment="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Comment = $propertyToSet.comment
Set-Media -InputPath $this.InputPath -Property $propertyToSet

