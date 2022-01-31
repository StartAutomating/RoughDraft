<#
.Synopsis
    Sets album artwork
.Description
    Sets album artwork by adding a secondary stream to an audio file and setting the appropriate metadata.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Set-Media            
[Management.Automation.Cmdlet("Set","Media")]
param(
# The path to album art.
[Parameter(Mandatory)]
[string]
$AlbumArt,

# The type of album art.  By default 'Cover (front)'
[string]
$AlbumArtType = 'Cover (front)'
)

# If we're setting album art, resolve the path
$raa =
    if ([IO.File]::Exists($AlbumArt)) {
        $AlbumArt
    } else {
        $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($AlbumArt) |
            Get-item -literalPath { $_ } -Force |Select-Object -ExpandProperty Fullname
    }

# Then we copy the image stream in
if (-not $raa) { continue }
'-i'
"`"$raa`""
'-c:a'
'copy'
'-c:v'
'copy'
'-map'
'0:0'
'-map'
'1:0'
'-id3v2_version'
3
'-metadata:s:v'
'title="Album Cover"'  # indicate it's an album cover
'-metadata:s:v'
"comment=`"$AlbumArtType`"" # and then add a comment about what album art type it is.
