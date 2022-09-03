<#
.Synopsis
    Lists codecs
.Description
    Lists the codecs available to ffmpeg.
#>

[Runtime.CompilerServices.Extension()]          # It's an extension
[Management.Automation.Cmdlet("Get","FFMpeg")]  # that extends Get-FFMpeg            
[ComponentModel.Inheritance("NotInherited")]    # that is not inherited.
param(
# If set, will list codecs
[Parameter(Mandatory)]
[Alias('ListCodecs')]
[switch]
$ListCodec
)

$codecLines = & $ffmpeg -codecs 2>&1
$foundSeparator = $false
foreach ($_ in $codecLines) {
    if (-not $foundSeparator -and ($_ -like "*------*")) {
        $foundSeparator = $true
    } elseif ($foundSeparator) {
        $parts = $_ -split " {1,}" -ne ''
        $fields = $parts[0]
        $shortName = $parts[1]
        $fullname = $parts[2..($parts.Count - 1)] -join ' ' 
        $codecInfo = [Ordered]@{
            PSTypeName            = 'RoughDraft.FFMpeg.Codec'
            Codec                 = $shortName
            CodecType             = ''
            FullName              = $fullname            
            CanDecode             = $fields -match "D"
            CanEncode             = $fields -match "E"
            IsVideoCodec          = $fields -match "V"
            IsAudioCodec          = $fields -match "A"
            IsSubtitleCodec       = $fields -match "S"
            IsLossyCompression    = $fields -match "L"
            IsLosslessCompression = $fields -match "S"
            IsIntraFrameOnlyCodec = $fields -match "I"
        }
        $codecInfo.CodecType = 
            if ($codecInfo.IsVideoCodec) {
                'Video'
            } elseif ($codecInfo.IsAudioCodec) {
                'Audio'
            } elseif ($codecInfo.IsSubtitleCodec) {
                'Subtitle'
            } else {
                ''
            }
        [PSCustomObject]$codecInfo
    }
}
