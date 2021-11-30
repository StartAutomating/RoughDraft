function Use-RoughDraftExtension
{
    <#
    .Synopsis
        Uses RoughDraftExtensions
    .Description
        Uses RoughDraft Extensions.

        This is used internally by extensible functions in a few ways:

        * To get -DynamicParameters associated with a -CommandName
        * To see which extensions -CanRun with a given -CommandName
        * To -Run a given extension
    .Example
        # Putting this dynamicParam block in a command adds all dynamic parameters from extensions that extend the command

        dynamicParam {
            $myCmd = $MyInvocation.MyCommand
            Use-RoughDraftExtension -CommandName $myCmd -DynamicParameter
        }
    .Link
        Get-RoughDraftExtension
    #>
    [OutputType([PSObject],[Management.Automation.RuntimeDefinedParameterDictionary])]
    [CmdletBinding(DefaultParameterSetName='DynamicParameter')]
    param(
    # The path to a rough draft extension
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidatePattern('\.RoughDraft\.(extension|ext)\.ps1$')]
    [Alias('Source','Fullname')]
    [string]
    $ExtensionPath,

    # If set, will clear caches of extensions, forcing a refresh.
    [switch]
    $Force,

    # If provided, will get extensions that extend a given command
    [Parameter(ValueFromPipelineByPropertyName)]
    [Parameter(Mandatory,ParameterSetName='DynamicParameter',ValueFromPipelineByPropertyName)]
    [Parameter(Mandatory,ParameterSetName='CanRun',ValueFromPipelineByPropertyName)]
    [Parameter(Mandatory,ParameterSetName='Run',ValueFromPipelineByPropertyName)]
    [Alias('ThatExtends', 'For')]
    [string]
    $CommandName,

    # If set, will get dynamic parameters for all commands that match a given extension.
    [Parameter(Mandatory,ParameterSetName='DynamicParameter')]
    [Alias('DynamicParameters')]
    [switch]
    $DynamicParameter,

    # The parameters passed to a given
    [Parameter(ParameterSetName='CanRun',ValueFromPipelineByPropertyName)]
    [Parameter(ParameterSetName='Run',ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $ExtensionParameter = @{},

    # If set, will determine if an extension could run.
    [Parameter(Mandatory,ParameterSetName='CanRun')]
    [Alias('CouldRun')]
    [switch]
    $CanRun,

    # If set, will run an extension.
    [Parameter(Mandatory,ParameterSetName='Run')]
    [switch]
    $Run
    )

    process {
        $getExtensionSplat = @{
            ExtensionPath = $ExtensionPath
            Force = $Force -as [bool]
            CommandName = $CommandName
        }

        switch ($PSCmdlet.ParameterSetName) {
            CanRun {
                #region Determine if the Extension Can Run, given input
                foreach ($extensionCommand in Get-RoughDraftExtension @getExtensionSplat) {
                    if ($extensionCommand.InheritanceLevel -notin 'Inherited', 'NotInherited') { continue }
                    $couldRunIt = $extensionCommand.CouldRun($ExtensionParameter)
                    if (-not $couldRunIt) { continue }
                    [PSCustomObject]@{
                        ExtensionCommand = $extensionCommand
                        ExtensionPath = $extensionCommand.Source
                        CommandName = $CommandName
                        ExtensionParameter = $ExtensionParameter
                    }
                }
                #endregion Determine if the Extension Can Run, given input
            }
            DynamicParameter {
                #region Get Dynamic Parameters for the Extension Commands
                $allDynamicParameters = [Management.Automation.RuntimeDefinedParameterDictionary]::new()
                $commandExtended = $ExecutionContext.SessionState.InvokeCommand.GetCommand($CommandName,'Function')
                foreach ($extensionCommand in Get-RoughDraftExtension @getExtensionSplat) {
                    if ($extensionCommand.Extends -notcontains $CommandName) { continue }
                    $extensionParams = $extensionCommand.GetDynamicParameters()
                    foreach ($kv in $extensionParams.GetEnumerator()) {
                        if (([Management.Automation.CommandMetaData]$commandExtended).Parameters.$($kv.Key)) {
                            continue
                        }
                        if ($allDynamicParameters.ContainsKey($kv.Key)) {
                            if ($kv.Value.ParameterType -ne $allDynamicParameters[$kv.Key].ParameterType) {
                                Write-Verbose "Extension '$extensionCommand' Parameter '$($kv.Key)' Type Conflict, making type PSObject"
                                $allDynamicParameters[$kv.Key].ParameterType = [PSObject]
                            }
                            foreach ($attr in $kv.Value.Attributes) {
                                $allDynamicParameters[$kv.Key].Attributes.Add($attr)
                            }
                        } else {
                            $allDynamicParameters[$kv.Key] = $kv.Value
                        }
                    }
                }
                return $allDynamicParameters
                #endregion Get Dynamic Parameters for the Extension Commands
            }
            Run {
                #region Run Extensions
                foreach ($extensionCommand in Get-RoughDraftExtension @getExtensionSplat) {
                    $extensionCommandParameters = [Ordered]@{}
                    foreach ($kv in $ExtensionParameter.getEnumerator()) {
                        if ($extensionCommand.Parameters[$kv.Key]) {
                            $extensionCommandParameters[$kv.Key] = $kv.Value
                        }
                    }
                    $extensionOutput = . $extensionCommand @extensionCommandParameters
                    $extensionOutputWrapper = [PSCustomObject][Ordered]@{
                        CommandName = $CommandName
                        ExtensionCommand = $extensionCommand
                        ExtensionOutput = $ExtensionOutput
                        Done = $ExecutionContext.InheritanceLevel -eq 'NotInherited'
                    }
                    $extensionOutputWrapper
                    if ($extensionOutputWrapper.Done) { break }
                }
                #endregion Run Extensions
            }
        }


    }
}
