<#
.Synopsis
    Removes Audio
.Description
    Removes audio streams
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Split-Media            
[Management.Automation.Cmdlet("Split","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# If set, will remove audio from input media.
[Parameter(Mandatory)]
[Alias('RemoveAudio')]
[switch]
$NoAudio
)

"-c"
"copy"
"-an"

