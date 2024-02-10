#requires -Module PSDevOps
Push-Location ($PSScriptRoot | Split-path)
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

New-GitHubWorkflow -Name "Analyze, Test, Tag, and Publish" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis,
    TestPowerShellOnLinux,
    TagReleaseAndPublish,
    BuildRoughDraft -OutputPath .\.github\workflows\TestAndPublish.yml 

New-GitHubWorkflow -On Issue, Demand -Job RunGitPub -Name OnIssueChanged -OutputPath .\.github\workflows\OnIssue.yml

Pop-Location