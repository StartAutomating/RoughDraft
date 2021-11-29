# From ?<PowerShell_HelpField> in Irregular (https://github.com/StartAutomating/Irregular)
[Regex]::new(@'
\.(?<Field>Synopsis)                   # Field Start
\s{0,}                               # Optional Whitespace
(?<Content>(.|\s)+?(?=(\.\w+|\#\>))) # Anything until the next .\field or end of the comment block
'@, 'IgnoreCase,IgnorePatternWhitespace', [Timespan]::FromSeconds(1)).Match(
$this.ScriptBlock
).Groups["Content"].Value
