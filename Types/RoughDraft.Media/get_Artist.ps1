<#
.SYNOPSIS
    Gets Artist Metadata
.DESCRIPTION
    Gets the Artist Metadata, if present.
#>
param()
return $(
    if ($this.'.Metadata'.Artist) {
        $this.'.Metadata'.Artist
    } else { $null }
)