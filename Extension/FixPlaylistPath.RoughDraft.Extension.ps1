<#
.SYNOPSIS
    FixPlaylistPath
.DESCRIPTION
    Fixes paths within playlist files.  
    
    If an absolute path is invalid, it will be replaced with a relative path.

    (if the file is missing, a warning will be written)
#>
[Management.Automation.Cmdlet("Repair","Media")]
param(
# If set, will fix playlist paths
[Parameter(Mandatory)]
[Alias('FixPlaylistPaths','RepairPlaylistPath','RepairPlaylistPaths')]
[switch]
$FixPlaylistPath
)

$CountOfPlaylistsRepaired = 0
$CountOfPlaylistItemsRepaired = 0

if ($FixPlaylistPath -and $InputPath) {
    $playlistsFound = foreach ($inPath in $inputPath) {
        Get-ChildItem -Path $inPath -Filter *.m3u
    }

    foreach ($foundPlaylist in $playlistsFound) {
        $foundPlaylistLines = $foundPlaylist | Get-Content
        $thisPlaylistWasRepaired = $false
        $ThisPlaylistIsBroken = $false
        $repairedLines = @(foreach ($playlistLine in $foundPlaylistLines) {
            if ($playlistLine -match '^\#') {
                $playlistLine
            } else {
                if ($playlistLine -match "[\\/]") {
                    # If we cast the line to a path and it does not have a length, it does not exist (or wouldn't be playable)
                    if (-not ([io.FileInfo]$playlistLine).Length) {
                        $playlistLineLastSegment = @($playlistLine -split "[\\/]")[-1]
                        if (Test-path (Join-Path $foundPlaylist.Directory.FullName $playlistLineLastSegment)) {
                            $playlistLineLastSegment
                            $thisPlaylistWasRepaired = $true
                            $CountOfPlaylistItemsRepaired++
                        } else {
                            Write-Warning "Could not repair $playlistLine in $($foundPlaylist.Name)"
                            $ThisPlaylistIsBroken = $true
                        }
                    }
                } else {
                    $playlistLine
                }
            }
        })

        if ($thisPlaylistWasRepaired -and 
            $PSCmdlet.ShouldProcess("Fix Playlist $($foundPlaylist.FullName)")
        ) {            
            $CountOfPlaylistsRepaired++            
            [IO.File]::WriteAllLines($foundPlaylist.FullName, $repairedLines)
            [IO.FileInfo]$foundPlaylist.FullName
        }
    }    
}

Write-Verbose "$CountOfPlaylistsRepaired playlists repaired ($CountOfPlaylistItemsRepaired items fixed)"