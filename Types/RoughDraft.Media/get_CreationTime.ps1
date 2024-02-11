<#
.SYNOPSIS
    Gets Creation Time Metadata
.DESCRIPTION
    Gets the Creation Time Metadata, if present.
#>
param()
if ($this.'.Metadata'.CreationTime) {
    return ($this.'.Metadata'.CreationTime -as [DateTime])
} elseif ($this.'.Metadata'.creation_time) {
    return ($this.'.Metadata'.creation_time -as [DateTime])
}