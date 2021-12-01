function Get-FFPlay {
    <#
    .Synopsis
        Gets FFMpeg
    .Description
        Gets FFMpeg, if installed
    .Example
        Get-FFMpeg
    .Link
        Use-FFMpeg
    #>
    [OutputType([string])]
    param(
    # The path to FFMpeg
    [Parameter(ValueFromPipelineByPropertyName)]
    $ffplayPath
    )

    process {
        if ($script:KnownffplayPath) {
            return $script:KnownffplayPath
        }


        if ($ffplayPath) {
            $ffplayAtPath = $ExecutionContext.SessionState.InvokeCommand.GetCommand($ffplayPath, 'Application')
            if ($ffplayAtPath) {
                $script:KnownffplayPath = $ffplayAtPath.Source
                return $script:KnownffplayPath
            }
        }

        $ffplayInPath = $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffplay', 'Application')
        if ($ffplayInPath) {
            $script:KnownffplayPath = $ffplayInPath.Source
            return $script:KnownffplayPath
        }

        if ($env:ProgramFiles) {
            $ffplayInProgramFiles = 
                $ExecutionContext.SessionState.InvokeCommand.GetCommand((
                    Join-Path (Join-Path (Join-Path $env:ProgramFiles ffmpeg) 'bin') 'ffplay.exe'
                ), 'Application')
    
            if ($ffplayInProgramFiles) {
                $script:KnownffplayPath = $ffplayInProgramFiles.Source
                return $script:KnownffplayPath
            }
        }

        throw "Cannot find ffplay"
    }
}