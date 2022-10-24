[Diagnostics.CodeAnalysis.SuppressMessageAttribute("Test-ForSlowScript", "", Justification="Slightly slow scripts will always be faster than media processing.")]
param()
#region RoughDraft FFMPEG wrappers
. $psScriptRoot\Convert-Media.ps1
. $psScriptRoot\Edit-Media.ps1
. $psScriptRoot\Get-Media.ps1
. $psScriptRoot\Join-Media.ps1
. $psScriptRoot\New-Media.ps1
. $psScriptRoot\Receive-Media.ps1
. $psScriptRoot\Set-Media.ps1
. $psScriptRoot\Send-Media.ps1
. $psScriptRoot\Show-Media.ps1
. $psScriptRoot\Split-Media.ps1


. $psScriptRoot\ConvertTo-Gif.ps1

. $psScriptRoot\Get-FFMpeg.ps1
. $psScriptRoot\Get-FFPlay.ps1
. $psScriptRoot\Get-FFProbe.ps1

. $psScriptRoot\Use-FFMpeg.ps1
. $psScriptRoot\Use-FFPlay.ps1
. $psScriptRoot\Use-FFProbe.ps1
#endregion RoughDraft FFMPEG wrappers
. $psScriptRoot\Get-RoughDraftExtension.ps1

. $psScriptRoot\RoughDraft.Irregular.ps1


#region Import Parts

# Parts are simple .ps1 files beneath a /Parts directory that can be used throughout the module.
$partsDirectory = $( # Because we want to be case-insensitive, and because it's fast
    foreach ($dir in [IO.Directory]::GetDirectories($psScriptRoot)) { # [IO.Directory]::GetDirectories()
        if ($dir -imatch "\$([IO.Path]::DirectorySeparatorChar)Parts$") { # and some Regex
            [IO.DirectoryInfo]$dir;break # to find our parts directory.
        }
    })

if ($partsDirectory) { # If we have parts directory
    foreach ($partFile in $partsDirectory.EnumerateFileSystemInfos()) { # enumerate all of the files.
        if ($partFile.Extension -ne '.ps1') { continue } # Skip anything that's not a PowerShell script.
        $partName = # Get the name of the script.
            $partFile.Name.Substring(0, $partFile.Name.Length - $partFile.Extension.Length)
        $ExecutionContext.SessionState.PSVariable.Set( # Set a variable
            $partName, # named the script that points to the script (e.g. $foo = gcm .\Parts\foo.ps1)
            $ExecutionContext.SessionState.InvokeCommand.GetCommand($partFile.Fullname, 'ExternalScript')
        )
    }
}
#endregion Import Parts
Export-ModuleMember -Function *-* -Alias *
