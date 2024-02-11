<#
.SYNOPSIS
    Sets the Mood Metadata
.DESCRIPTION
    Changes the Mood metadata for a media file (persistently, if possible)
.NOTES
    Mood is stored within the ID3 tag `WM/MOOD`.
#>
param()
$propertyToSet = @{"WM/MOOD"="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Mood = $propertyToSet."WM/MOOD"
Set-Media -Property $propertyToSet
