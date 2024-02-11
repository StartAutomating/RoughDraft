<#
.SYNOPSIS
    Sets the Year Metadata
.DESCRIPTION
    Changes the Year metadata for a media file (persistently, if possible)
#>
param()

$dateTimeArgs = [DateTime]$($args[0])
if ($dateTimeArgs.Year -eq 1 -and $dateTimeArgs -and $dateTimeArgs.Ticks) {
    $dateTimeArgs = [datetime]::ParseExact("$($dateTimeArgs.Ticks)", "yyyy", $null)
}
$datePortion = @($dateTimeArgs.ToString('s') -split '-', 2)[0]
# $yearPortion = @($datePortion -split '-')[0]
$propertyToSet = @{date="$datePortion"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Year = $propertyToSet.date
Set-Media -Property $propertyToSet
