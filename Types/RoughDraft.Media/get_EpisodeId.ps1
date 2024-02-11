<#
.SYNOPSIS
    Gets EpisodeID Metadata
.DESCRIPTION
    Gets the EpisodeID Metadata, if present.
#>
param()
if ($this.'.Metadata'.EpisodeID) {
    return $this.'.Metadata'.EpisodeID
} elseif ($this.'.Metadata'.TVEN) {
    return $this.'.Metadata'.TVEN
}

