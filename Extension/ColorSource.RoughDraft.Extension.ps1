<#
.Synopsis
    Generates a color 
.Description
    Generates a color source
.Link
    https://ffmpeg.org/ffmpeg-filters.html#sine
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends New-Media            
[Management.Automation.Cmdlet("New","Media")]
param(
[Parameter(Mandatory)]
[string]
$Color
)

'-f'
'lavfi'
'-i'
"color=$(@(
    $Color
    if ($Resolution) {
        "s=$Resolution"
    }
) -join ':')"


