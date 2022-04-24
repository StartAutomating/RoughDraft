<#
.Synopsis
    Creates a playlist
.Description
    Creates a playlist out of several audio files.
#>
[Runtime.CompilerServices.Extension()]         # It's an extension
[Management.Automation.Cmdlet("Join","Media")] # that extends Join-Media
[ComponentModel.Inheritance("NotInherited")]   # that is not inherited
param(
# If set, will create a playlist
[Parameter(Mandatory)]
[switch]
$Playlist
)

if (-not $IsAllAudio) {
    Write-Warning "-InputPath contains non-audio files, ignoring them"
}

if (-not $audioFiles.Count) {
    Write-Error "-InputPath contains no audio files"
    return
}

if ($OutputPath -notlike '*.m3u') {
    Write-Error "-OutputPath '$OutputPath' must be a .m3u"
    return
}

$audioInputPaths = @($audioFiles | Select-Object -ExpandProperty InputPath)

$audioUniqueDirectories = @($audioInputPaths | Split-Path | Select-Object -Unique)
$outputDirectory = $OutputPath | Split-Path
if ($audioUniqueDirectories.Count -eq 1 -and $audioUniqueDirectories -eq $outputDirectory) {
    $audioInputPaths | 
        Get-Item -LiteralPath { $_ } | 
        Select-Object -ExpandProperty Name | 
        Set-Content -Path $OutputPath
} else {
    $audioInputPaths | 
        Get-Item -LiteralPath { $_ } | 
        Select-Object -ExpandProperty Fullname |
        Set-Content -Path $OutputPath
}
