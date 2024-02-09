function Repair-Media
{
    <#
    .SYNOPSIS
        Repairs Media
    .DESCRIPTION
        Repairs Media using any number of extensions.
    .EXAMPLE
        Get-ChildItem -Filter *.m3u | Repair-Media -FixPlayListPath
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
    # One or more input paths
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string[]]
    $InputPath,
    
    # An optional output path
    [Parameter(Position=1,ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter -NoMandatoryDynamicParameter -DynamicParameterSetName "__AllParameterSets" 
    }

    process {
        $in = @{} + $PSBoundParameters
        
        #region Run Repair-Media Extensions
        :repairingMedia do {
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {                        
                        $inObj.extensionOutput
                    }
                    if ($inObj.Done) {
                        break repairingMedia
                    }
                } }            
        } while ($false)
        #region Run Repair-Media Extensions
    }        
}
