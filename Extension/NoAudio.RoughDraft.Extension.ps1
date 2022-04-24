<#
.Synopsis
    Removes Audio
.Description
    Removes audio streams
#>
[Runtime.CompilerServices.Extension()]           # It's an extension
[Management.Automation.Cmdlet("Split","Media")]  # that extends Split-Media            
[ComponentModel.Inheritance("Inherited")]        # that is not inherited
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

