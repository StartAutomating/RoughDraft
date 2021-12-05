<#
.Synopsis
    Datascope effect
.Description
    Applies the datascope filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#datascope
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
param(
[Parameter(Mandatory)]
[switch]
$DataScope,

<#
Set scope mode, can be one of the following:

|Value|Description|
|-----|-----------| 
|mono |Draw hexadecimal pixel values with white color on black background.|
|color |Draw hexadecimal pixel values with input video pixel color on black background.|
|color2 |Draw hexadecimal pixel values on color background picked from input video, the text color is picked in such way so its always visible.|
* 
#>
[ValidateSet('Mono', 'Color', 'Color2')]
[string]
$DataScopeMode = 'Color',

# Set background opacity.
[double]
$DataScopeBackgroundOpacity,

# Draw rows and columns numbers on left and top of video.
[switch]
$DataScopeAxis,

# Set display number format. Can be hex, or dec. Default is hex.
[ValidateSet('hex','dec')]
[string]
$DataScopeFormat,

# Set x offset from where to pick pixels.
[int]
$DataScopeX,

# Set y offset from where to pick pixels.
[int]
$DataScopeY,

# Set pixel components to display. By default all pixel components are displayed.
[string]
$DataScopeComponent
)

$DataScopeArguments  =@(
    if ($DataScopeMode) {
        "mode=$($DataScopeMode.ToLower())"
    }
    if ($DataScopeBackgroundOpacity) {
        "opacity=$DataScopeBackgroundOpacity"
    }
    if ($DataScopeAxis) {
        "axis"
    }
    if ($DataScopeFormat) {
        "format=$DataScopeFormat"
    }
    if ($DataScopeX) {
        "x=$DataScopeX"
    }
    if ($DataScopeY) {
        "y=$DataScopeY"
    }
    if ($DataScopeComponent) {
        "components=$DataScopeComponent"
    }
) -join ':'

"-vf"
"datascope=$DataScopeArguments"
