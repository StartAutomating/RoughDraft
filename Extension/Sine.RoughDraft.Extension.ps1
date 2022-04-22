<#
.Synopsis
    Generates a sine wave
.Description
    Generates an audio sine wave
.Link
    https://ffmpeg.org/ffmpeg-filters.html#sine
#>

[Runtime.CompilerServices.Extension()]         # It's an extension
[Management.Automation.Cmdlet("New","Media")]  # that extends New-Media
param(
# If set, will generate a sine tone
[Parameter(Mandatory)]
[switch]
$Sine,

# The frequency of the sine tone.
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

