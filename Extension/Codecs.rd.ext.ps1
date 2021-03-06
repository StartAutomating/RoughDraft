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

& $ffmpeg -codecs 2>&1 | 
    Where-Object {
        $foundSeparator
        if ($_ -like "*------*") {
            $foundSeparator = $true
        }
    } |
    ForEach-Object {
        $parts = $_ -split " {1,}" -ne ''
        $fields = $parts[0]
        $shortName = $parts[1]
        $fullname = $parts[2..($parts.Count - 1)] -join ' ' 
        $codecInfo = [Ordered]@{
            PSTypeName            = 'RoughDraft.FFMpeg.Codec'
            Codec                 = $shortName
            CodecType             = ''
            FullName              = $fullname            
            CanDecode             = ($fields -like "*D*")
            CanEncode             = ($fields -like "*E*")
            IsVideoCodec          = ($fields -like "*V*")
            IsAudioCodec          = ($fields -like "*A*")
            IsSubtitleCodec       = ($fields -like "*S*")
            IsLossyCompression    = ($fields -like "*L*")
            IsLosslessCompression = ($fields -like "*S*")
            IsIntraFrameOnlyCodec = ($fields -like "*I*")
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
