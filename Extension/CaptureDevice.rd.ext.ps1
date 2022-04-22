<#
.Synopsis
    Gets capture devices
.Description
    Gets capture device information
#>
[Runtime.CompilerServices.Extension()]  # It's an extension
[Management.Automation.Cmdlet("Get","FFMpeg")] # that extends Get-FFMpeg
[ComponentModel.Inheritance("NotInherited")] # that is not inherited.
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
        'alsa', 'x11grab', 'v4l2', 'sndio', 'oss','openal', 'libdc1934', 'libcdio', 'kmsgrab','jack','iec61883', 'fbdev','decklink','bktr','avfoundation','android_camera'
    } elseif ($PSVersionTable.Platform -like 'Win*' -or -not $PSVersionTable.Platform) {
        'dshow', 'gdigrab'
    }
}

foreach ($cdt in $CaptureDeviceType) {
    $ffOut= Use-FFMpeg -FFMpegArgument '-list_devices',true,'-f',$cdt,'-i',dummy

    $ffOut | Where-Object { $_ -match "\[$cdt\s\@" }
}



