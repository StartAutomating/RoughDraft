<#
.Synopsis
    Applies a Sepia Filter
.Description
    Uses the ffmpeg colorchannelmixer to apply a Sepia filter.
.EXAMPLE
    Edit-Media -InputPath "TestSource.mp4" -Sepia
#>

[Runtime.CompilerServices.Extension()]         # It's an extension
[Management.Automation.Cmdlet("Edit","Media")] # that extends Join-Media
[ComponentModel.Inheritance("Inherited")]      # that is inherited
param(
# If set, will apply a sepia filter.
[Parameter(Mandatory)]
[switch]
$Sepia
)

"-vf" # If we wanted the video in Sepia
"`"colorchannelmixer=.393:.769:.189:0:.349:.686:.168:0:.272:.534:.131`"" # use the color channel mixer.
