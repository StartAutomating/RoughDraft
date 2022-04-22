<#
.SYNOPSIS
    FrameBuffer Extension
.DESCRIPTION
    Sends, Receives, and Displays the Linux Frame Buffer
#>
[Management.Automation.Cmdlet("Receive", "Media")]
[Management.Automation.Cmdlet("Send", "Media")]
[Management.Automation.Cmdlet("Show", "Media")]
param(
# The frame buffer index
[Parameter(Mandatory)]
[int]
$FrameBuffer
)

if ($PSVersionTable.Platform -ne 'Unix') {
    throw "FrameBuffer Unsupported"
}

"-f",
"fbdev",
"-i"
"/dev/fb$frameBuffer"