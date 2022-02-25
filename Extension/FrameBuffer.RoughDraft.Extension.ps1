<#
.SYNOPSIS
    FrameBuffer Extension
.DESCRIPTION
    Sends, Receives, and Displays the Linux Frame Buffer
#>
param(
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