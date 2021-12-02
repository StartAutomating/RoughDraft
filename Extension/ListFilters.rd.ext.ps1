<#
.Synopsis
    Lists filters
.Description
    Lists filters available in FFMpeg.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Get-FFMpeg
[Management.Automation.Cmdlet("Get","FFMpeg")]
# that is not inherited.
[ComponentModel.Inheritance("NotInherited")]
param(
[Parameter(Mandatory)]
[Alias('ListFilters')]
[Switch]
$ListFilter
)

Use-FFMpeg -FFMpegArgument '-hide_banner', '-filters' |    
    ForEach-Object {
        $parts = $_ -split " {1,}" -ne ''
        if (-not $parts) { return } 
        if ($parts.Count -lt 4) { return }
        if ($parts -contains '=') { return }
        $timeline, $sliceThreading, $commandSupport = $parts[0].ToCharArray()
        $SupportsTimeline       = $timeline -eq 'T'
        $SupportsSliceThreading = $sliceThreading -eq 'S'
        $SupportsCommands       = $commandSupport -eq 'C' 
        $filterName = $parts[1]
        $fields = $parts[2]
        $description = $parts[3..($parts.Count - 1)] -join ' ' 
        $filterInfo = [Ordered]@{
            PSTypeName             = 'RoughDraft.FFMpeg.Filter'
            FilterName             = $filterName
            FilterType             = $fields
            Description            = $description                        
            IsVideoFilter          = ($fields -like "*V*")
            IsAudioFilter          = ($fields -like "*A*")
            IsDynamic              = ($fields -like "*N*")
            IsSource               = ($fields -like '|*')
            SupportsCommands       = $SupportsCommands
            SupportsTimeline       = $SupportsTimeline
            SupportsSliceThreading = $SupportsSliceThreading            
        }
                
        [PSCustomObject]$filterInfo
    } |
    Sort-Object FilterType