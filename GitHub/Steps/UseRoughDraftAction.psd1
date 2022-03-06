@{
    name = 'Use RoughDraft Action'
    uses = 'StartAutomating/RoughDraft@main'
    id = 'RoughDraft'
    with = @{
        CommitMessage = 'Running RoughDraft [skip ci]'
    }
}


