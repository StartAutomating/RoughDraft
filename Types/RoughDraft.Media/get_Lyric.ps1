<#
.SYNOPSIS
    Gets InitialKey Metadata
.DESCRIPTION
    Gets the InitialKey Metadata, if present.
#>
param()

# If we already have lyrics
if ($this.'.Metadata'.Lyrics) {
    # return them
    return ($this.'.Metadata'.Lyrics)
}
# Otherwise, if lyrics exist for the current UI culture
elseif ($this.'.Metadata'."lyrics-$([cultureinfo]::CurrentUICulture.ThreeLetterISOLanguageName)")
{
    # return them
    return ($this.'.Metadata'."lyrics-$([cultureinfo]::CurrentUICulture.ThreeLetterISOLanguageName)")
} 
# Otherwise, if English lyrics exist
elseif ($this.'.Metadata'.'lyrics-eng') 
{
    # return them.
    return $this.'.Metadata'.'lyrics-eng'
}

