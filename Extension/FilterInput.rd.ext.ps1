<#
.Synopsis
    Gets filter details
.Description
    Gets details about a particular filter.
#>
[Runtime.CompilerServices.Extension()]           # It's an extension
[Management.Automation.Cmdlet("Get","FFMpeg")]   # that extends Get-FFMpeg
[ComponentModel.Inheritance("NotInherited")]     # that is not inherited.
param(
# If set, will get filter inputs for a given filter name
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[string]
$FilterName,

# If set, will get filter inputs for a given filter name
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[switch]
$FilterInput
)

if (-not $script:CachedFFMpegHelp) {
    $script:CachedFFMpegHelp = @(Use-FFMpeg -FFMpegArgument '-h','full')
}

$filterIndex = $script:CachedFFMpegHelp.IndexOf("$FilterName AVOptions:")
if (-not $filterIndex) {
    for ($i = 0 ; $i -lt $script:CachedFFMpegHelp.Count; $i++) {
        if ($script:CachedFFMpegHelp[$i] -like "$FilterName*AVOptions:*") {
            $filterIndex = $i
        }
    }
}

if ($filterIndex -eq -1) {
    Write-Error "Unable to find filter '$FilterName'"
    return
}

$helpLines = 
    @(for ($i = $filterIndex + 1; $i -lt $script:CachedFFMpegHelp.Count; $i++) {
        $script:CachedFFMpegHelp[$i]
        if (-not ($script:CachedFFMpegHelp[$i] -replace '\s')) {
            break
        }
    })

for ($hln = 0; $hln -lt $helpLines.Count; $hln++) {
    $hl = $helpLines[$hln]
    $isInput = $hl -like "*<*>*"
    $lineParts = @($hl -split '\s' -ne '')
    if (-not $lineParts) { continue }
    
    if ($isInput) {
        $inputInfo = [Ordered]@{
            PSTypeName  = 'RoughDraft.FFMpeg.FilterInput'
            FilterName  = $FilterName
            InputName   = $lineParts[0]
            InputType   = $lineParts[1] -replace '<' -replace '>'
            Description = $lineParts[3..($lineParts.Length - 1)] -join ' '
        }
        $nhln = $hln+1
        $flagIntValue = 0 
        $flags = @(while ($helpLines[$nhln] -and $helpLines[$nhln] -notlike '*<*>*') {
            $flagLineParts = @($helpLines[$nhln] -split '\s' -ne '')
            $intValue = if ($flagLineParts[2] -like '*.*') {
                $flagLineParts[1] -as [int]
                $flagDescription = $flagLineParts[3..$($flagLineParts.count -1)] -join ' '
            } else {
                $flagIntValue
                $flagIntValue += 1
                $flagDescription = $flagLineParts[2..$($flagLineParts.count -1)] -join ' '
            }
            [PSCustomObject][Ordered]@{
                PSTypeName      = 'RoughDraft.FFMpeg.FilterInputFlag'
                Name        = $flagLineParts[0]
                Value       = $intValue
                Description = $flagDescription
            }
            $nhln++
        })
        if ($flags) {
            $inputInfo.InputType = 'Flag'
            $inputInfo.Flags = $flags
        }
        [PSCustomObject]$inputInfo
        $hln = $nhln -1
    }
}