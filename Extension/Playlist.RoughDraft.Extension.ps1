<#
.Synopsis
    Creates a playlist
.Description
    Creates a playlist out of several audio files.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Join-Media            
[Management.Automation.Cmdlet("Join","Media")]
# that is not inherited
[ComponentModel.Inheritance("NotInherited")]
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
