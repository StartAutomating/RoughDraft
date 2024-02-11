<#
.SYNOPSIS
    Gets Description Metadata
.DESCRIPTION
    Gets the Description Metadata, if present.
#>
param()
if ($this.'.Metadata'.Description) {
    return $this.'.Metadata'.Description
} elseif ($this.'.Metadata'.desc) {
    return $this.'.Metadata'.desc
}