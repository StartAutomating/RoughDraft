<#
.SYNOPSIS
    Sets the Lyric Metadata
.DESCRIPTION
    Changes the Lyric metadata for a media file (persistently, if possible)
.NOTES
    Lyric is stored within a localized ID3 tag `lyrics-locale` (for example `lyrics-eng`).
#>
param()
$lyricCulture = [cultureinfo]::CurrentUICulture
$lyricLines = @(foreach ($arg in $args) {
    if ($arg -is [cultureinfo]) {
        $lyricCulture = $arg
    } 
    elseif ($arg -as [cultureinfo]) {
        $lyricCulture = $arg -as [cultureinfo]
    }
    else {
        "$arg"
    }
})

$lyricProperty = "lyrics-$($lyricCulture.ThreeLetterISOLanguageName)"
$propertyToSet = @{"lyrics-$($lyricCulture.ThreeLetterISOLanguageName)"=$lyricLines -join [Environment]::NewLine}
if (-not $this.'.Metadata') {
    $this.'.Metadata' = [Ordered]@{}
}
$this.'.Metadata'.Lyrics = $propertyToSet.TKEY
Set-Media -InputPath $this.InputPath -Property $propertyToSet

