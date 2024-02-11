<#
.SYNOPSIS
    Gets Composer Metadata
.DESCRIPTION
    Gets the Composer Metadata, if present.
#>
param()
return $this.'.Metadata'.Composer -split '[\;\\/]'