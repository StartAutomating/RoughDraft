<#
.Synopsis
    Generates a sine wave
.Description
    Generates an audio sine wave
.Link
    https://ffmpeg.org/ffmpeg-filters.html#sine
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends New-Media            
[Management.Automation.Cmdlet("New","Media")]
param(
[Parameter(Mandatory)]
[switch]
$Sine,

[string]
$SineFrequency
)

'-f'
'lavfi'
'-i'
"sine=$(@(
    if ($SineFrequency) {
        "f=$SineFrequency"
    }
) -join ':')"

