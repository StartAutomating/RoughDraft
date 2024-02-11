<#
.SYNOPSIS
    Gets Show Metadata
.DESCRIPTION
    Gets the Show Metadata, if present.
#>
param()
if ($this.'.Metadata'.Show) {
    return ($this.'.Metadata'.Show)
} elseif ($this.'.Metadata'.TVSH) {
    return ($this.'.Metadata'.TVSH)
}

