<#
.SYNOPSIS
    Gets InitialKey Metadata
.DESCRIPTION
    Gets the InitialKey Metadata, if present.
#>
param()
if ($this.'.Metadata'.InitialKey) {
    return ($this.'.Metadata'.InitialKey)
} elseif ($this.'.Metadata'.TKEY) {
    return ($this.'.Metadata'.TKEY)
}

