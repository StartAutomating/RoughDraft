param()

$callStackPeek = Get-PSCallStack | Select-Object -Skip 1 -First 1

$InvoationInfo = $callStackPeek.InvocationInfo
$myModulePath = # Determine the module path
    if ($InvoationInfo.MyCommand.ScriptBlock.Module.Path) {
        $psd1Path = $InvoationInfo.MyCommand.ScriptBlock.Module.Path -replace '\.psm1', '.psd1'
        if (Test-Path $psd1Path) {
            $psd1Path
        } else {
            $InvoationInfo.MyCommand.ScriptBlock.Module.Path
        }
    } else {
        Join-Path ($psScriptRoot | Split-path) "RoughDraft.psd1"
    }

$myCommandName = $InvoationInfo.MyCommand.Name # and the command name.
            $JobDefinition = [ScriptBlock]::Create({param([Hashtable]$Arguments) # Use it to create a job definition.
}.ToString() + "
`$myArgs = @{} + `$arguments
Import-Module '$myModulePath'
Set-Location `$myArgs.pwd
`$myArgs.Remove('pwd')
$myCommandName @myArgs
")
$null= $InvoationInfo.BoundParameters.Remove("AsJob") # Remove the AsJob parameter
# Pass the current directory
$InvoationInfo.BoundParameters.PWD = "$pwd"
# Keep track of how many jobs we've launched per command.
if (-not $script:JobCounter) { $script:JobCounter = @{} }
if (-not $script:JobCounter[$myCommandName]) {
    $script:JobCounter[$myCommandName] = 1
} else {
    $script:JobCounter[$myCommandName]++
}

# Launch the job and return.

if ($ExecutionContext.SessionState.InvokeCommand.GetCommand('Start-ThreadJob', 'All')) {
    Start-ThreadJob $JobDefinition -Name "$myCommandName$($script:JobCounter[$myCommandName])" -argumentlist $InvoationInfo.BoundParameters
} else {
    Start-Job $JobDefinition -Name "$myCommandName$($script:JobCounter[$myCommandName])" -argumentlist $InvoationInfo.BoundParameters
}

return 
