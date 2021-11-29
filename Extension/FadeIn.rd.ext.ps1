<#
.Synopsis
    Fades in video
.Description
    Fades in video, using the fade filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#fade
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Runtime.CompilerServices.Extension()]
param(
# If provided, the video will be faded in
[Parameter(Mandatory)]
[Switch]
$FadeIn,

# The frame the fade-in will start (by default, 0)
[uint32]
$StartFadeAt = 0,

# The frame the fade-in will end (by default, 30)
[uint32]
$EndFadeAt = 30,

# The fade color
[string]
$FadeColor= "black"
)

"-vf"
"`"fade=in:$($StartFadeAt):$($EndFadeAt):color=$FadeColor`""



