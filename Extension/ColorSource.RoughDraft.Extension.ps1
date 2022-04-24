<#
.Synopsis
    Generates a color 
.Description
    Generates a color source
.Link
    https://ffmpeg.org/ffmpeg-filters.html#sine
#>

[Runtime.CompilerServices.Extension()] # It's an extension

[Management.Automation.Cmdlet("New","Media")] # that extends New-Media
[Management.Automation.Cmdlet("Show","Media")] # that extends Show-Media
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


