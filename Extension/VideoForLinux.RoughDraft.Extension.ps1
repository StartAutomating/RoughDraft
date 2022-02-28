<#
.Synopsis
    VideoForLinux Extension
.Description
    The VideoForLinux Extension lets you use linux video devices (i.e. as /dev/video0)        
#>
[Management.Automation.Cmdlet("Receive","Media")]
[Management.Automation.Cmdlet("Send","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
# If set, will use video4linux2 as the input type
[Parameter(Mandatory)]
[Alias('Video4Linux','V4L','Video4linux2', 'V4L2')]
[switch]
$VideoForLinux,

# The name of the video device.
[string]
$VideoDevice
)

'-f','video4linux2'
'-i', "$VideoDevice"

