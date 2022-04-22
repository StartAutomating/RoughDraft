<#
.Synopsis
    Generates test sources
.Description
    Generates test sources using lavfi
.Link
    https://ffmpeg.org/ffmpeg-filters.html#allrgb_002c-allyuv_002c-color_002c-colorspectrum_002c-haldclutsrc_002c-nullsrc_002c-pal75bars_002c-pal100bars_002c-rgbtestsrc_002c-smptebars_002c-smptehdbars_002c-testsrc_002c-testsrc2_002c-yuvtestsrc
#>

[Runtime.CompilerServices.Extension()]         # It's an extension
[Management.Automation.Cmdlet("New","Media")]  # that extends New-Media            
[Management.Automation.Cmdlet("Show","Media")] # that extends Show-Media
param(
# The name of the test source
[Parameter(Mandatory)]
[ValidateSet('allrgb', 'allyuv','pal75bars','pal100bars','rgbtestsrc','smtpebars', 'testsrc', 'testsrc2','yuvtestsrc')]
[string]
$TestSource
)

'-f'
'lavfi'
'-i'
("$TestSource=".ToLower() + $(
    @(
    if ($resolution) {
        "s=$resolution"
    }
    )
)) -replace '\=$'

