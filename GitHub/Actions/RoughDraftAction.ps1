<#
.Synopsis
    GitHub Action for RoughDraft
.Description
    GitHub Action for RoughDraft.  This will:

    * Run all *.RoughDraft.ps1 files beneath the workflow directory
    * Run a .RoughDraftScript parameter.

    Any files changed can be outputted by the script, and those changes can be checked back into the repo.
    Make sure to use the "persistCredentials" option with checkout.
#>

param(
# A PowerShell Script that uses RoughDraft.  
# Any files outputted from the script will be added to the repository.
# If those files have a .Message attached to them, they will be committed with that message.
[string]
$RoughDraftScript,

# If set, will not process any files named *.RoughDraft.ps1
[switch]
$SkipRoughDraftPS1,

# If provided, will commit any remaining changes made to the workspace with this commit message.
[string]
$CommitMessage,

# The user email associated with a git commit.
[string]
$UserEmail,

# The user name associated with a git commit.
[string]
$UserName
)



"::group::Parameters" | Out-Host
[PSCustomObject]$PSBoundParameters | Format-List | Out-Host
"::endgroup::" | Out-Host

if ($env:GITHUB_ACTION_PATH) {
    $RoughDraftModulePath = Join-Path $env:GITHUB_ACTION_PATH 'RoughDraft.psd1'
    if (Test-path $RoughDraftModulePath) {
        Import-Module $RoughDraftModulePath -Force -PassThru | Out-String
    } else {
        throw "RoughDraft not found"
    }
} elseif (-not (Get-Module RoughDraft)) {    
    throw "Action Path not found"
}

if ($PSVersionTable.Platform -eq 'Unix') {
    $ffMpegInPath =  $ExecutionContext.SessionState.InvokeCommand.GetCommand('ffmpeg', 'Application')
    if (-not $ffMpegInPath -and $env:GITHUB_WORKFLOW) {
        "::group::Installing FFMpeg" | Out-Host
        sudo apt update | Out-Host
        sudo apt install ffmpeg | Out-Host
        "::endgroup::" | Out-Host
    }
}

$processScriptOutput = { process { 
    $out = $_
    $outItem = Get-Item -Path $out -ErrorAction SilentlyContinue
    $fullName, $shouldCommit = 
        if ($out -is [IO.FileInfo]) {
            $out.FullName, (git status $out.Fullname -s)
        } elseif ($outItem) {
            $outItem.FullName, (git status $outItem.Fullname -s)
        }
    if ($shouldCommit) {
        git add $fullName
        if ($out.Message) {
            git commit -m "$($out.Message)"
        } elseif ($out.CommitMessage) {
            git commit -m "$($out.CommitMessage)"
        }
    }
    $out
} }

"::debug::RoughDraft Loaded from Path - $($RoughDraftModulePath)" | Out-Host

if (-not $UserName) { $UserName = $env:GITHUB_ACTOR }
if (-not $UserEmail) { $UserEmail = "$UserName@github.com" }
git config --global user.email $UserEmail
git config --global user.name  $UserName

if (-not $env:GITHUB_WORKSPACE) { throw "No GitHub workspace" }

git pull | Out-Host

$roughDraftScriptStart = [DateTime]::Now
if ($RoughDraftScript) {
    Invoke-Expression -Command $RoughDraftScript |
        . $processScriptOutput |
        Out-Host
}
$roughDraftScriptTook = [Datetime]::Now - $roughDraftScriptStart
"::set-output name=RoughDraftScriptRuntime::$($roughDraftScriptTook.TotalMilliseconds)"   | Out-Host

$roughDraftPS1Start = [DateTime]::Now
$roughDraftPS1List  = @()
if (-not $SkipRoughDraftPS1) {
    Get-ChildItem -Recurse -Path $env:GITHUB_WORKSPACE |
        Where-Object Name -Match '\.RoughDraft\.ps1$' |
        
        ForEach-Object {
            $roughDraftPS1List += $_.FullName.Replace($env:GITHUB_WORKSPACE, '').TrimStart('/')
            $roughDraftPS1Count++
            . $_.FullName |            
                . $processScriptOutput  | 
                Out-Host
        }
}
$roughDraftPS1EndStart = [DateTime]::Now
$roughDraftPS1Took = [Datetime]::Now - $roughDraftPS1Start
"::set-output name=RoughDraftPS1Count::$($roughDraftPS1List.Length)"   | Out-Host
"::set-output name=RoughDraftPS1Files::$($roughDraftPS1List -join ';')"   | Out-Host
"::set-output name=RoughDraftPS1Runtime::$($roughDraftPS1Took.TotalMilliseconds)"   | Out-Host
if ($CommitMessage) {
    dir $env:GITHUB_WORKSPACE -Recurse |
        ForEach-Object {
            $gitStatusOutput = git status $_.Fullname -s
            if ($gitStatusOutput) {
                git add $_.Fullname
            }
        }

    git commit -m $ExecutionContext.SessionState.InvokeCommand.ExpandString($CommitMessage)
    $gitPushed =  git push 2>&1
    "Git Push Output: $($gitPushed  | Out-String)"
}
