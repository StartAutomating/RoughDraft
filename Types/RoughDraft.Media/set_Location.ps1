<#
.SYNOPSIS
    Sets the Location Metadata
.DESCRIPTION
    Changes the Location metadata for a media file (persistently, if possible)

    Location should be a pair of coordinates (without space), followed by a slash.

    Location _can_ include additional coordinates or a description, followed by an additional slash.
#>
param()
$unrolledArgs = $args | . { process { $_ } }

$propertyToSet = @{location=$args}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.location = $propertyToSet.location
Set-Media -InputPath $this.InputPath -Property $propertyToSet

