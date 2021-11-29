param([Collections.IDictionary]$params)

$mappedParams = [Ordered]@{}
$mandatories = @(foreach ($myParam in $this.Parameters.GetEnumerator()) {
    if ($mappedParams.Contains($myParam.Key)) {
        $mappedParams[$myParam.Key] = $params[$myParam.Key]
    } else {
        foreach ($paramAlias in $myParam.Value.Aliases) {
            if ($params.Contains($paramAlias)) {
                $mappedParams[$myParam.Key] = $params[$paramAlias]
                break
            }
        }
    }
    if ($myParam.value.Attributes.Mandatory) {
        $myParam.Key
    }
})

foreach ($mandatoryParam in $mandatories) {
    if (-not $params.Contains($mandatoryParam)) {
        return $false
    }
}
return $mappedParams
