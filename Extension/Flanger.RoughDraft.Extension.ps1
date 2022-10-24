<#
.Synopsis
    Audio Flanger.
.Description
    Apply a flanging effect to the audio
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#flanger
.EXAMPLE
    Edit-Media -InputPath "a.mp3" -Flanger -FlangerDelay 3 -FlangerDepth 4
.EXAMPLE
    Show-Media -InputPath "a.mp3" -Flanger
#>
[Management.Automation.Cmdlet("(?>Edit|Show)","Media")]   # It extends Edit or Show-Media
param(
# If set, will apply a flanger filter.
[Parameter(Mandatory)]
[switch]
$Flanger,

# Set base delay in milliseconds. Range from 0 to 30. Default value is 0.
[ValidateRange(0,30)]
[int]$FlangerDelay,    
# Set added sweep delay in milliseconds. Range from 0 to 10. Default value is 2.
[ValidateRange(0,10)]
[int]$FlangerDepth,

# Set percentage regeneration (delayed signal feedback). Range from -95 to 95. Default value is 0.
[Alias('FlangerRegen')]
[ValidateRange(-95,95)]
[int]$FlangerRegeneration,

# Set percentage of delayed signal mixed with original. Range from 0 to 100. Default value is 71.
[int]$FlangerWidth,

# Set sweeps per second (Hz). Range from 0.1 to 10. Default value is 0.5.
[ValidateRange(0.1, 10)]
[double]
$FlangerSpeed,
    
# Set swept wave shape, can be triangular or sinusoidal. Default value is sinusoidal.
[ValidateSet("Triangular", "Sinusoidal")]
[string]
$FlangerShape,

# Set swept wave percentage-shift for multi channel. Range from 0 to 100. Default value is 25.
[ValidateRange(0,100)]
[int]$FlangerPhase,

# Set delay-line interpolation, linear or quadratic. Default is linear.
[ValidateSet("Linear", "Quadratic")]
[Alias("FlangerInterp")]
[string]
$FlangerInteroplation    
)

$myCmdMetadata = [Management.Automation.CommandMetaData]$MyInvocation.MyCommand

$filterParams = @(
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        if (-not $myCmdMetadata.Parameters[$kv.Key]) { continue }
        $keyName = $kv.Key -replace '^Flanger'
        $keyValue = $kv.Value.ToString().ToLower()
        if (-not $keyName) { continue }
        $keyName =
            if ($keyName -eq 'Interpolation') {
                'interp'
            }
            elseif ($keyName -eq 'Regeneration') {
                'regen'
            } else {
                $keyName.ToLower()
            }
        
        "$keyName=$keyValue"
    }
) -join ':'

"-af"
"flanger=$filterParams" -replace '=$'