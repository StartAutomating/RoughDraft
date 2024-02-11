<#
.SYNOPSIS
    Gets Grouping Metadata
.DESCRIPTION
    Gets the Grouping Metadata, if present.
#>
param()
return $this.'.Metadata'.Grouping -split '[\;/]'