<#
.SYNOPSIS
    Gets Year Metadata
.DESCRIPTION
    Gets the Year Metadata, if present.
#>
param()
$yearInfo = if ($this.'.Metadata'.Year) {
    $this.'.Metadata'.Year
} elseif ($this.'.Metadata'.date) {
    $this.'.Metadata'.date
}

if ($yearInfo -match '^\d{4}$') {
    return ([datetime]::ParseExact($yearInfo, "yyyy", $null))
} else {
    return $yearInfo
}

