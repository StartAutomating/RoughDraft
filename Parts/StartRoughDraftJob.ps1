param()

$callStackPeek = Get-PSCallStack | Select-Object -Skip 1 -First 1

$InvocationInfo = $callStackPeek.InvocationInfo
$myModulePath = # Determine the module path
    if ($InvocationInfo.MyCommand.ScriptBlock.Module.Path) {
        $psd1Path = $InvocationInfo.MyCommand.ScriptBlock.Module.Path -replace '\.psm1', '.psd1'
        if (Test-Path $psd1Path) {
            $psd1Path
        } else {
            $InvocationInfo.MyCommand.ScriptBlock.Module.Path
        }
    } else {
        Join-Path ($psScriptRoot | Split-path) "RoughDraft.psd1"
    }

$myCommandName = $InvocationInfo.MyCommand.Name # and the command name.
            $JobDefinition = [ScriptBlock]::Create({param([Hashtable]$Arguments) # Use it to create a job definition.
}.ToString() + "
`$myArgs = @{} + `$arguments
Import-Module '$myModulePath'
Set-Location `$myArgs.pwd
`$myArgs.Remove('pwd')
$myCommandName @myArgs
")
$null= $InvocationInfo.BoundParameters.Remove("AsJob") # Remove the AsJob parameter
# Pass the current directory
$InvocationInfo.BoundParameters.PWD = "$pwd"
# Keep track of how many jobs we've launched per command.
if (-not $script:JobCounter) { $script:JobCounter = @{} }
if (-not $script:JobCounter[$myCommandName]) {
    $script:JobCounter[$myCommandName] = 1
} else {
    $script:JobCounter[$myCommandName]++
}

# Launch the job and return.


$startJobSplat = [Ordered]@{
    ScriptBlock = $jobDefinition
    Name = "$myCommandName$($script:JobCounter[$myCommandName])"
    ArgumentList = $InvocationInfo.BoundParameters
}

if ($ExecutionContext.SessionState.InvokeCommand.GetCommand('Start-ThreadJob', 'All')) {    
    if ($invocationInfo.BoundParameters.ThrottleLimit) {
        $startJobSplat.ThrottleLimit = $invocationInfo.BoundParameters.ThrottleLimit
    } elseif ($invocationInfo.BoundParameters.Throttle) {
        $startJobSplat.ThrottleLimit = $invocationInfo.BoundParameters.Throttle
    }
    Start-ThreadJob @startJobSplat
} else {
    Start-Job @startJobSplat $JobDefinition -Name "$myCommandName$($script:JobCounter[$myCommandName])" -argumentlist $InvocationInfo.BoundParameters
}

return 
