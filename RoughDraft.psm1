#region RoughDraft FFMPEG wrappers
. $psScriptRoot\Convert-Media.ps1
. $psScriptRoot\Edit-Media.ps1
. $psScriptRoot\Get-Media.ps1
. $psScriptRoot\Join-Media.ps1
. $psScriptRoot\New-Media.ps1
. $psScriptRoot\Set-Media.ps1

. $psScriptRoot\ConvertTo-Gif.ps1
. $psScriptRoot\ConvertTo-Waveform.ps1

. $psScriptRoot\Start-MediaRecording.ps1
. $psScriptRoot\Stop-MediaRecording.ps1


. $psScriptRoot\Invoke-FFMpeg.ps1
. $psScriptRoot\Invoke-FFPlay.ps1
. $psScriptRoot\Invoke-FFProbe.ps1
#endregion RoughDraft FFMPEG wrappers
. $psScriptRoot\Get-RoughDraftExtension.ps1
. $psScriptRoot\Use-RoughDraftExtension.ps1

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
