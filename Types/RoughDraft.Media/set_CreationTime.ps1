<#
.SYNOPSIS
    Sets the Creation Time Metadata
.DESCRIPTION
    Changes the Creation Time metadata for a media file (persistently, if possible)
#>
param()

$dateTimeArgs = [DateTime]$($args[0])
$datePortion = @($dateTimeArgs.ToString('s') -split '-', 2)[0]
$propertyToSet = @{creation_time="$datePortion"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.CreationTime = $propertyToSet.creation_time
Set-Media -InputPath $this.InputPath -Property $propertyToSet

