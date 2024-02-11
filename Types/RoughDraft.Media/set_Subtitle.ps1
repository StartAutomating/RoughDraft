<#
.SYNOPSIS
    Sets the Subtitle Metadata
.DESCRIPTION
    Changes the Subtitle metadata for a media file (persistently, if possible)
.NOTES
    Subtitle is stored within the ID3 tag `TIT3`.

    This refers to the subtitle of a file, not the subtitles _for_ a file.
#>
param()
$propertyToSet = @{TIT3="$args"}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Show = $propertyToSet.TIT3
Set-Media -InputPath $this.InputPath -Property $propertyToSet

