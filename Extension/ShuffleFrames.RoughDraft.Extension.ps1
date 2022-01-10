<#
.Synopsis
    Shuffles frames in video
.Description
    Shuffles frames in a video stream.
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
[Management.Automation.Cmdlet("Edit","Media")]
# that is not inherited
[ComponentModel.Inheritance("Inherited")]
param(
# Set the destination indexes of input frames. 
# Number of indexes also sets maximal value that each index may have.
# ’-1’ index have special meaning and that is to drop frame.
[Parameter(Mandatory)]
[Alias('ShuffleFrames')]
[int[]]
$ShuffleFrame
)

"-vf"
"shuffleframes=$ShuffleFrame"


