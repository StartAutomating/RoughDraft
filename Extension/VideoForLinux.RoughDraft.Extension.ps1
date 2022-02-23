<#
.Synopsis
    VideoForLinux Extension
.Description
    
#>
[Management.Automation.Cmdlet("Receive","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
[Parameter(Mandatory)]
[Alias('Video4Linux','V4L','Video4linux2', 'V4L2')]
[switch]
$VideoForLinux,

[string]
$VideoDevice
)


'-f','video4linux'
'-i', "$VideoDevice"

