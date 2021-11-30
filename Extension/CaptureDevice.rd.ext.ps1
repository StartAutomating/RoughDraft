<#
.Synopsis
    Detect black periods in a video.
.Description
    Detects black periods within a video, using the blackdetect filter.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#blackdetect
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
[switch]
$ListCaptureDevice,

# The type of capture device.
# If not specified, this will be defaulted based off of the operating system.
[string[]]
$CaptureDeviceType
)

if (-not $CaptureDeviceType) {
    $CaptureDeviceType = 
    if ($PSVersionTable.Platform -eq 'Unix') {
        'x11grab', 'v4l2', 'sndio', 'oss','openal', 'libdc1934', 'libcdio', 'kmsgrab','jack','iec61883', 'fbdev','decklink','bktr','avfoundation','android_camera'
    } elseif ($PSVersionTable.Platform -eq 'Windows' -or -not $PSVersionTable.Platform) {
        'dshow', 'gdigrab', 'vfwcap'
    }
}

foreach ($cdt in $CaptureDeviceType) {
    $ffOut= Invoke-FFMpeg -FFMpegArgument '-list_devices',true,'-f',$cdt,'-i',dummy

    $ffOut | Where-Object { $_ -match "\[$cdt\s\@" }
}



