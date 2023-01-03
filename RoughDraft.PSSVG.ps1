#requires -Module PSSVG

$psChevronPolygonPoints = @(
    "40,20"
    "45,20"
    "60,50"
    "35,80"
    "32.5,80"
    "55,50"
) -join ' '

$psChevronPolygon = 
    =<svg.polygon> -Points $psChevronPolygonPoints


$psChevron = 
    =<svg.symbol> -Id psChevron -Content @(
        $psChevronPolygon
    ) -ViewBox 100, 100 -PreserveAspectRatio $false

$outputPath = Join-Path $psScriptRoot Assets
$outputPath = Join-Path $outputPath RoughDraft.svg
=<svg> @(
    =<svg.defs> @(
        =<svg.style> -Type 'text/css' @'
@import url('https://fonts.googleapis.com/css?family=Space Grotesk')
'@
    )
    $psChevron
    =<svg.use> -href '#psChevron'  -X '5%' -Y '0%' -Height '100%' -Width '20%' -Fill '#4488ff' -Class foreground-fill
    =<svg.text> @(
        =<svg.tspan> "Rough" -FontFamily 'serif' -Rotate 1 -Style "font-family: 'Space Grotesk';" 
        =<svg.tspan> "Draft" -FontFamily 'serif' -Dx '-0.3em' -Rotate 2 -Dy '0.2em' -Style "font-family: 'Space Grotesk';" 
    ) -FontSize 36 -Fill '#4488ff' -X 50% -DominantBaseline 'middle' -TextAnchor 'middle' -Y 50% -Class foreground-fill
) -ViewBox 300, 100 -OutputPath $outputPath
