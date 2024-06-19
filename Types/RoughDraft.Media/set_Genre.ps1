<#
.SYNOPSIS
    Sets the Genre Metadata
.DESCRIPTION
    Changes the Genre metadata for a media file (persistently, if possible)
#>
param()
$unrolledArgs = $args | . { process { $_ } }
$propertyToSet = @{genre=$unrolledArgs -join ' ; '}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.genre = $propertyToSet.genre
Set-Media -InputPath $this.InputPath -Property $propertyToSet

