<#
.SYNOPSIS
    Sets the Producer Metadata
.DESCRIPTION
    Changes the Producer metadata for a media file (persistently, if possible)
#>
param()
$propertyToSet = @{producer=$args -join '/'}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Producer = $propertyToSet.producer
Set-Media -InputPath $this.InputPath -Property $propertyToSet

