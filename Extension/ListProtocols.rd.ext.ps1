<#
.Synopsis
    Lists protocols
.Description
    Lists the protocols available to ffmpeg.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Get-FFMpeg            
[Management.Automation.Cmdlet("Get","FFMpeg")]
# that is not inherited.
[ComponentModel.Inheritance("NotInherited")]
param(
# If set, will list protocolas
[Parameter(Mandatory)]
[Alias('ListProtocol', 'Protcolols')]
[switch]
$Protocol
)

$isInputProtocol = $false
$isOutputProtocol = $false
$protocolsByName = @{}

$protocolsList = & $ffmpeg -protocols -hide_banner 2>&1 

$protocolsList | 
    ForEach-Object {
        if ($_ -match '^Input:') {
            $isInputProtocol  = $true
            $isOutputProtocol = $false
        }
        if ($_ -match '^Output:') {
            $isInputProtocol  = $false
            $isOutputProtocol = $true
        }
        if ($_ -match '^\s+') {
            $protocolName = $_ -replace '\s'
            if (-not $protocolsByName[$protocolName]) {
                $protocolsByName[$protocolName] = [PSCustomObject][Ordered]@{
                    PSTypeName       = 'FFMpeg.Protocol'
                    Protocol         = $protocolName
                    IsInputProtocol  = $isInputProtocol
                    IsOutputProtocol = $isOutputProtocol
                }
            }
            if ($isInputProtocol) {
                $protocolsByName[$protocolName].IsInputProtocol = $true
            }
            if ($isOutputProtocol){
                $protocolsByName[$protocolName].IsOutputProtocol = $true
            }
        }
    }


    $protocolsByName.Values | Sort-Object Protocol
