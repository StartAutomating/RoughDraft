<#
.SYNOPSIS
    Gets Disc Metadata
.DESCRIPTION
    Gets the Disc Metadata, if present.
#>
param()
if ($this.'.Metadata'.disc) {
    return $this.'.Metadata'.disc
}