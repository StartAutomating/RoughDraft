<#
.Synopsis
    Lists codecs
.Description
    Lists the codecs available to ffmpeg.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Get-Media            
[Management.Automation.Cmdlet("Get","Media")]
# that is not inherited.
[ComponentModel.Inheritance("NotInherited")]
param(
# If set, will list capture devices
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
<#        New-Object PSObject |
            Add-Member NoteProperty ShortName $shortName -Force -PassThru | 
            Add-Member NoteProperty FullName $fullname -Force -PassThru | 
            Add-Member NoteProperty CanDecode ($fields -like "*D*") -Force -PassThru |
            Add-Member NoteProperty CanEncode ($fields -like "*E*") -Force -PassThru |
            Add-Member NoteProperty IsVideoCodec ($fields -like "*V*") -Force -PassThru |
            Add-Member NoteProperty IsAudioCodec ($fields -like "*A*") -Force -PassThru |
            Add-Member NoteProperty IsSubtitleCodec ($fields -like "*S*") -Force -PassThru |
            Add-Member NoteProperty IsIntraFrameOnlyCodec ($fields -like "*I*") -Force -PassThru |
            Add-Member NoteProperty IsLossyCompression ($fields -like "*L*") -Force -PassThru |
            Add-Member NoteProperty IsLosslessCompression ($fields -like "*S*") -Force -PassThru
#>        
    }
