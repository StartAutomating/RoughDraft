﻿@{
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
        'RunHelpOut',
        @{
            'name'='Log in to ghcr.io'
            'uses'='docker/login-action@master'
            'with'=@{
                'registry'='${{ env.REGISTRY }}'
                'username'='${{ github.actor }}'
                'password'='${{ secrets.GITHUB_TOKEN }}'
            }
        },
        @{
            name = 'Extract Docker Metadata (for branch)'
            if   = '${{github.ref_name != ''main'' && github.ref_name != ''master'' && github.ref_name != ''latest''}}'
            id   = 'meta'
            uses = 'docker/metadata-action@master'
            with = @{
                'images'='${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}'                
            }
        },
        @{
            name = 'Extract Docker Metadata (for main)'
            if   = '${{github.ref_name == ''main'' || github.ref_name == ''master'' || github.ref_name == ''latest''}}'
            id   = 'metaMain'
            uses = 'docker/metadata-action@master'
            with = @{
                'images'='${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}'
                'flavor'='latest=true'
            }
        },
        @{
            name = 'Build and push Docker image (from main)'
            if   = '${{github.ref_name == ''main'' || github.ref_name == ''master'' || github.ref_name == ''latest''}}'
            uses = 'docker/build-push-action@master'
            with = @{
                'context'='.'
                'push'='true'
                'tags'='${{ steps.metaMain.outputs.tags }}'
                'labels'='${{ steps.metaMain.outputs.labels }}'
            }
        },
        @{
            name = 'Build and push Docker image (from branch)'
            if   = '${{github.ref_name != ''main'' && github.ref_name != ''master'' && github.ref_name != ''latest''}}'
            uses = 'docker/build-push-action@master'
            with = @{
                'context'='.'
                'push'='true'
                'tags'='${{ steps.meta.outputs.tags }}'
                'labels'='${{ steps.meta.outputs.labels }}'
            }
        }
    )
}