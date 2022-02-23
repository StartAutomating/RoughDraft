<#
.Synopsis
    DirectShow Extension
.Description
      
#>
[Management.Automation.Cmdlet("Receive","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
[Parameter(Mandatory)]
[switch]
$DirectShow,

[string]
$VideoDevice,

[string]
$AudioDevice
)


'-f','dshow'
'-i', "$(@(
    if ($VideoDevice) {"video=$videoDevice"}
    if ($AudioDevice) {"audio=$AudioDevice"}    
) -join ':')"
