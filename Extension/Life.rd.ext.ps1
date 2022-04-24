<#
.Synopsis
    Generates life
.Description
    Uses the ffmpeg filter for life
.Link
    https://ffmpeg.org/ffmpeg-filters.html#life
.EXAMPLE
    New-Media -OutputPath "Life.gif" -Duration "00:00:05" -Life
#>
[Runtime.CompilerServices.Extension()]        # It's an extension
[Management.Automation.Cmdlet("New","Media")] # that extends New-Media             
[Management.Automation.Cmdlet("Show","Media")]# and Show-Media
param(
# If set, will generate life
[Parameter(Mandatory)]
[switch]
$Life,

# Set the file from which to read the initial grid state. 
# In the file, each non-whitespace character is considered an alive cell, and newline is used to delimit the end of each row.
# If this option is not specified, the initial grid is generated randomly.
[string]
$LifeStateFile,


# Set the random fill ratio for the initial random grid.
# It is a floating point number value ranging from 0 to 1, defaults to 1/PHI. 
# It is ignored when a file is specified.
[ValidateRange(0,1)]
[double]
$LifeFillRatio,


# Set the seed for filling the initial random grid, must be an integer included between 0 and UINT32_MAX. 
# If not specified, or if explicitly set to -1, the filter will try to use a good random seed on a best effort basis.
[int]
$LifeSeed,

# Set the life rule.
# 
# A rule can be specified with a code of the kind "SNS/BNB", 
# where NS and NB are sequences of numbers in the range 0-8, 
# NS specifies the number of alive neighbor cells which make a live cell stay alive, 
# and NB the number of alive neighbor cells which make a dead cell to become alive (i.e. to "born"). "s" and "b" can be used in place of "S" and "B", respectively.
# 
# Alternatively a rule can be specified by an 18-bits integer.
# The 9 high order bits are used to encode the next cell state if it is alive for each number of neighbor alive cells, 
# the low order bits specify the rule for "borning" new cells.
# Higher order bits encode for an higher number of neighbor cells.
# For example the number 6153 = (12<<9)+9 specifies a stay alive rule of 12 and a born rule of 9, which corresponds to "S23/B03".

# Default value is "S23/B3", which is the original Conway’s game of life rule, 
# and will keep a cell alive if it has 2 or 3 neighbor alive cells, 
# and will born a new cell if there are three alive cells around a dead cell.
[string]
$LifeRule,

# If not set, will not stitch the left/right top/bottom grid edges together.
[switch]
$DoNotStitchLifeGrid,

#$ Set cell mold speed. 
# If set, a dead cell will go from death_color to mold_color with a step of mold. mold can have a value from 0 to 255
[byte]
$LifeMoldSpeed,

# Set the color of living (or new born) cells.
[string]
$LifeLivingColor,

# Set the color of dead cells. 
# If mold is set, this is the first color used to represent a dead cell.
[string]
$LifeDeathColor,

# Set mold color, for definitely dead and moldy cells.
[string]
$LifeMoldColor
)


$lifeFilterParameters =@(
    if ($LifeStateFile) {
        $resolvedLifeStateFile = $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($LifeStateFile)
        if ($resolvedLifeStateFile) {
            "f=$($resolvedLifeStateFile)"
        }
    }
    if ($LifeFillRatio) {
        "random_fill_ratio=$LifeFillRatio"
    }
    if ($LifeSeed) {
        "seed=$LifeSeed"
    }
    if ($LifeRule) {
        "rule=$LifeRule"
    }
    if ($DoNotStitchLifeGrid) {
        "stich=0"
    }
    if ($LifeMoldSpeed) {
        "mold=$LifeMoldSpeed"
    }
    if ($LifeLivingColor) {
        "life_color=$LifeLivingColor"
    }
    if ($LifeDeathColor) {
        "death_color=$LifeDeathColor"
    }
    if ($LifeMoldColor) {
        "mold_color=$LifeMoldColor"
    }
    if ($Resolution) {
        "s=$Resolution"
    }
) -join ':'

'-f'
'lavfi'
'-i'
"life=$lifeFilterParameters" -replace '\=$'

