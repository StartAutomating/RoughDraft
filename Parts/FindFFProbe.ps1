param(
$FFProbePath
)

if ($script:KnownFFProbePath) {
    return $script:KnownFFProbePath
}


if ($FFProbePath) {
    $FFProbeAtPath = $ExecutionContext.SessionState.InvokeCommand.GetCommand($FFProbePath, 'Application')
    if ($FFProbeAtPath) {
        $script:KnownFFProbePath = $FFProbeAtPath.Source
        return $script:KnownFFProbePath
    }
}

$FFProbeInPath = $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffprobe', 'Application')
if ($FFProbeInPath) {
    $script:KnownFFProbePath = $FFProbeInPath.Source
    return $script:KnownFFProbePath
}

if ($env:ProgramFiles) {
    $FFProbeInProgramFiles = 
        $ExecutionContext.SessionState.InvokeCommand.GetCommand((
            Join-Path (Join-Path (Join-Path $env:ProgramFiles ffmpeg) 'bin') 'FFProbe.exe'
        ), 'Application')
    
    if ($FFProbeInProgramFiles) {
        $script:KnownFFProbePath = $FFProbeInProgramFiles.Source
        return $script:KnownFFProbePath
    }
}

throw "Cannot find FFProbe"


