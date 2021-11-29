foreach ($attribute in $this.ScriptBlock.Attributes) {
    if ($attribute -is [ComponentModel.InheritanceAttribute]) {
        return $attribute.InheritanceLevel
    }
}
return [ComponentModel.InheritanceLevel]::Inherited