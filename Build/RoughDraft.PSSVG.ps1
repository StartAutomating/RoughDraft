#requires -Module PSSVG
$psChevron = Invoke-restMethod https://pssvg.start-automating.com/Examples/PowerShellChevron.svg

$outputPath = Join-Path ($psScriptRoot | Split-Path) Assets
$outputPath = Join-Path $outputPath RoughDraft.svg
svg @(
    svg.defs @(
        svg.style -Type 'text/css' @'
@import url('https://fonts.googleapis.com/css?family=Space Grotesk')
'@
    )
    $psChevron.svg.symbol.OuterXml
    svg.use -href '#psChevron'  -X '2.5%' -Y '0%' -Height '100%' -Width '20%' -Fill '#4488ff' -Class foreground-fill
    svg.text @(
        svg.tspan "Rough" -FontFamily 'serif' -Rotate 1 -Style "font-family: 'Space Grotesk';" 
        svg.tspan "Draft" -FontFamily 'serif' -Dx '-0.3em' -Rotate 2 -Dy '0.2em' -Style "font-family: 'Space Grotesk';" 
    ) -FontSize 36 -Fill '#4488ff' -X 50% -DominantBaseline 'middle' -TextAnchor 'middle' -Y 50% -Class foreground-fill
) -ViewBox 300, 100 -OutputPath $outputPath
