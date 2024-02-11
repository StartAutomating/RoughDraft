<#
.SYNOPSIS
    Gets Subtitle Metadata
.DESCRIPTION
    Gets the Subtitle Metadata, if present.
.NOTES
    This refers to the Subtitle of a file, not the Subtitles for a file.
#>
param()
if ($this.'.Metadata'.Subtitle) {
    return ($this.'.Metadata'.Subtitle)
} elseif ($this.'.Metadata'.TIT3) {
    return ($this.'.Metadata'.TIT3)
}

