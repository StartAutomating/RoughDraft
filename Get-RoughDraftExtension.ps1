function Get-RoughDraftExtension
{
    <#
    .Synopsis
        Gets RoughDraft Extensions
    .Description
        Gets RoughDraft Extensions.  
        
        Extensions can be found in:
        * RoughDraft
        * Any module that includes 'RoughDraft' in it's tags.        
        * The directory specified in -ExtensionPath
    .Example
        Get-RoughDraftExtension
    .Link
        Use-RoughDraftExtension    
    #>
    [OutputType('RoughDraft.Extension')]
    param(
    # If provided, will look beneath a specific path for extensions.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string]
    $ExtensionPath,

    # If set, will clear caches of extensions, forcing a refresh.
    [switch]
    $Force,

    # If provided, will get extensions that extend a given command
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('ThatExtends', 'For')]    
    [string]
    $CommandName
    )

    begin {
        $extensionNameRegex = '\.(RoughDraft|rd)\.(extension|ext)\.ps1$'
        #region Define Inner Functions
        function ?.Extends {            
            param(
            [Parameter(Position=0)]
            [string]
            $Command,

            [Parameter(ValueFromPipeline)]
            [PSObject]
            $ExtensionCommand
            )
            process {               
                if ($Command -and $ExtensionCommand.Extends -contains $Command) {
                    return $ExtensionCommand
                }
                elseif (-not $command) {
                    return $ExtensionCommand
                }    
            }
            
        }        
        filter =>[RoughDraft.Extension] {
            $in = $_
            $extCmd = 
                if ($in -is [Management.Automation.CommandInfo]) {
                    $in
                }
                elseif ($in -is [IO.FileInfo]) {
                    $ExecutionContext.SessionState.InvokeCommand.GetCommand($in.fullname, 'ExternalScript')
                } 
                else {
                    $ExecutionContext.SessionState.InvokeCommand.GetCommand($in, 'Function,ExternalScript')
                }

            

            $isExtension = $false
            $extends     = @()
            foreach ($attr in $extCmd.ScriptBlock.Attributes) {
                if ($attr -is [Runtime.CompilerServices.ExtensionAttribute]) {
                    $isExtension = $true
                }
                if ($attr -is [Management.Automation.CmdletAttribute]) {
                    
                    $extends += 
                        $ExecutionContext.SessionState.InvokeCommand.GetCommand($attr.VerbName + '-' + $attr.NounName, 'Function')
                }
            }

            if (-not $isExtension) { return }
            if (-not $extends) { return }
            Add-Member NoteProperty Extends $extends.Name -Force -InputObject $extCmd
            Add-Member NoteProperty ExtensionCommands $extends -Force -InputObject $extCmd
            $extCmd.pstypenames.clear()
            $extCmd.pstypenames.add('RoughDraft.Extension')
            $extCmd
        }
        #endregion Define Inner Functions

        #region Find Extensions
        $loadedModules = @(Get-Module)
        $myInv = $MyInvocation
        $myModuleName = $MyInvocation.MyCommand.Module.Name
        if ($myInv.MyCommand.Module -and $loadedModules -notcontains $myInv.MyCommand.Module) {
            $loadedModules = @($myInv.MyCommand.Module) + $loadedModules
        }
        $getCmd    = $ExecutionContext.SessionState.InvokeCommand.GetCommand
        
        if ($Force) {
            $script:RoughDraftExtensions = $null
            $script:RoughDraftExtensionsAtPath = $null
        }
        if (-not $script:RoughDraftExtensionsAtPath) {
            $script:RoughDraftExtensionsAtPath = @{}
        }
        if (-not $script:RoughDraftExtensions) 
        {
            $script:RoughDraftExtensions =
                foreach ($loadedModule in $loadedModules) { # Walk over all modules.
                    if ( # If the module has PrivateData keyed to this module
                        $loadedModule.PrivateData.($myInv.MyCommand.Module.Name)
                    ) {
                        # Determine the root of the module with private data.
                        $thisModuleRoot = [IO.Path]::GetDirectoryName($loadedModule.Path)
                        # and get the extension data
                        $extensionData = $loadedModule.PrivateData.($myInv.MyCommand.Module.Name)
                        if ($extensionData -is [Hashtable]) { # If it was a hashtable
                            foreach ($ed in $extensionData.GetEnumerator()) { # walk each key

                                $extensionCmd =
                                    if ($ed.Value -like '*.ps1') { # If the key was a .ps1 file
                                        $getCmd.Invoke( # treat it as a relative path to the .ps1
                                            [IO.Path]::Combine($thisModuleRoot, $ed.Value),
                                            'ExternalScript'
                                        )
                                    } else { # Otherwise, treat it as the name of an exported command.
                                        $loadedModule.ExportedCommands[$ed.Value]
                                    }
                                if ($extensionCmd) { # If we've found a valid extension command
                                    $extensionCmd | =>[RoughDraft.Extension] # return it as an extension.
                                }
                            }
                        }
                    }
                    elseif ($loadedModule.PrivateData.Tags -contains $myModuleName -or $loadedModule.Name -eq $myModuleName) {
                        $loadedModule | 
                            Split-Path | 
                            Get-ChildItem -Recurse | 
                            Where-Object Name -Match $extensionNameRegex |
                            =>[RoughDraft.Extension]
                    }
                }    
        }
        #endregion Find Extensions
    }

    process {
        if ($ExtensionPath) {
            Get-ChildItem -Recurse -Path $ExtensionPath |
                Where-Object Name -Match $extensionNameRegex |
                =>[RoughDraft.Extension] | 
                ?.Extends $CommandName
        } else {
            $script:RoughDraftExtensions | ?.Extends $CommandName
        }                
    }
}
