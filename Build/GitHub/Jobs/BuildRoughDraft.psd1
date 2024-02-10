@{
    "runs-on" = "ubuntu-latest"    
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v2'
        }, 
        @{    
            name = 'Use PSSVG Action'
            uses = 'StartAutomating/PSSVG@main'
            id = 'PSSVG'
        },
        @{
            name = 'Run RoughDraft (from main)'
            if   = '${{github.ref_name == ''main''}}'
            uses = 'StartAutomating/RoughDraft@main'
            id = 'RoughDraftMain'
            with = @{
                CommitMessage = 'Running RoughDraft [skip ci]'
            }
        },
        @{
            name = 'Run RoughDraft (on branch)'
            if   = '${{github.ref_name != ''main''}}'
            uses = './'
            id = 'RoughDraftBranch'
            with = @{
                CommitMessage = 'Running RoughDraft [skip ci]'
            }
        },
        'RunPiecemeal',        
        'RunPipeScript',
        'RunEZOut',       
        'RunHelpOut'
    )
}