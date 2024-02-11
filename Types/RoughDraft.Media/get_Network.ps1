<#
.SYNOPSIS
    Gets Network Metadata
.DESCRIPTION
    Gets the Network Metadata, if present.
#>
param()
if ($this.'.Metadata'.Network) {
    return ($this.'.Metadata'.Network)
} elseif ($this.'.Metadata'.tvnn) {
    return ($this.'.Metadata'.tvnn)
}

