<#
.SYNOPSIS
    Gets InitialKey Metadata
.DESCRIPTION
    Gets the InitialKey Metadata, if present.
#>
param()
if ($this.'.Metadata'.Lyrics) {
    return ($this.'.Metadata'.Lyrics)
} elseif ($this.'.Metadata'."lyrics-$([cultureinfo]::ThreeLetterISOLanguageName)") {
    return ($this.'.Metadata'."lyrics-$([cultureinfo]::ThreeLetterISOLanguageName)")
}
