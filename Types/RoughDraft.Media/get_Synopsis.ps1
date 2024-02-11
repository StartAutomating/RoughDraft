<#
.SYNOPSIS
    Gets Synopsis Metadata
.DESCRIPTION
    Gets the Synopsis Metadata, if present.
#>
param()
if ($this.'.Metadata'.Synopsis) {
    return ($this.'.Metadata'.Synopsis)
} elseif ($this.'.Metadata'.ldes) {
    return ($this.'.Metadata'.ldes)
}

