<#
.Synopsis
    DirectShow Extension
.Description
    The DirectShow extension lets you used DirectShow input devices
.EXAMPLE
    Show-Media -DirectShow -VideoDevice $myWebCam
#>
[Management.Automation.Cmdlet("Receive","Media")]
[Management.Automation.Cmdlet("Send","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will use DirectShow as the input type
[Parameter(Mandatory)]
[Alias('dshow')]
[switch]
$DirectShow,

# The name of a DirectShow video device
[string]
$VideoDevice,

# The name of a DirectShow audio device
[string]
$AudioDevice
)

$deviceString = @(
    if ($VideoDevice) {"video=$videoDevice"}
    if ($AudioDevice) {"audio=$audioDevice"}
) -join ':'

'-f'
'dshow'
'-i'
$deviceString