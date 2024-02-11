<#
.SYNOPSIS
    Gets BPM Metadata
.DESCRIPTION
    Gets the BPM Metadata, if present.
#>
param()
if ($this.'.Metadata'.BPM) {
    return ($this.'.Metadata'.BPM -as [double])
} elseif ($this.'.Metadata'.TBPM) {
    return ($this.'.Metadata'.TBPM -as [double])
}