#requires -Module PSDevOps
#requires -Module RoughDraft
Import-BuildStep -ModuleName RoughDraft
New-GitHubAction -Name "MakeRoughDraft" -Description 'A Fun FFMpeg-Based PowerShell Module for Multimedia.' -Action RoughDraftAction -Icon film  -ActionOutput ([Ordered]@{
    RoughDraftScriptRuntime = [Ordered]@{
        description = "The time it took the .RoughDraftScript parameter to run"
        value = '${{steps.RoughDraftAction.outputs.RoughDraftScriptRuntime}}'
    }
    RoughDraftPS1Runtime = [Ordered]@{
        description = "The time it took all .RoughDraft.ps1 files to run"
        value = '${{steps.RoughDraftAction.outputs.RoughDraftPS1Runtime}}'
    }
    RoughDraftPS1Files = [Ordered]@{
        description = "The .RoughDraft.ps1 files that were run (separated by semicolons)"
        value = '${{steps.RoughDraftAction.outputs.RoughDraftPS1Files}}'
    }
    RoughDraftPS1Count = [Ordered]@{
        description = "The number of .RoughDraft.ps1 files that were run"
        value = '${{steps.RoughDraftAction.outputs.RoughDraftPS1Count}}'
    }
})|
    Set-Content .\action.yml -Encoding UTF8 -PassThru
