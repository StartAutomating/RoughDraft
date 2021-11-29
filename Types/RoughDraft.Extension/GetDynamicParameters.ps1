$ExtensionDynamicParameters = [Management.Automation.RuntimeDefinedParameterDictionary]::new()
$Extension = $this
:nextInputParameter foreach ($in in ([Management.Automation.CommandMetaData]$Extension).Parameters.Keys) {
    $ExtensionDynamicParameters.Add($in, [Management.Automation.RuntimeDefinedParameter]::new(
        $Extension.Parameters[$in].Name,
        $Extension.Parameters[$in].ParameterType,
        $Extension.Parameters[$in].Attributes
    ))
}
foreach ($paramName in $ExtensionDynamicParameters.Keys) {
    foreach ($attr in $ExtensionDynamicParameters[$paramName].Attributes) {
        if ($attr.'ParameterSetName') { 
            $attr.ParameterSetName = if ($this -is [Management.Automation.FunctionInfo]) {
                $this.Name
            } elseif ($this -is [Management.Automation.ExternalScriptInfo]) {
                $this.Source
            }
        }
    }
}
$ExtensionDynamicParameters
