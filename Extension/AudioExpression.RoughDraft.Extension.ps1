<#
.SYNOPSIS
    Evaluates Audio Expressions
.DESCRIPTION
    Generate or Modify an audio signal using an expression
.EXAMPLE
    Show-Media -AudioExpression "-2+random(0)" # Play white noise
.EXAMPLE
    Show-Media -AudioExpression "0.5*tan(PI*(360-2.5/2)*t)"  
.EXAMPLE
    New-Media -AudioExpression "0.5*sin(PI*(720-2.5/2)*t)","0.5*cos(2*PI*(360+2.5/2)*t)" -OutputPath .\Test.mp3 -Duration "00:00:15"
.EXAMPLE
    Edit-Media -AudioExpression "val(0)","-val(1)" -InputPath .\Test.mp3
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#aevalsrc
.LINK
    https://ffmpeg.org/ffmpeg-filters.html#aeval
#>
[Management.Automation.Cmdlet("(?>Edit|New|Show)", "Media")]
param(
# The audio expression.
[Parameter(Mandatory)]
[string[]]
$AudioExpression,

# Set the channel layout. The number of channels in the specified layout must be equal to the number of specified expressions.
[string[]]
$AudioExpressionChannelLayout,

# Set the number of samples per channel per each output frame, default to 1024.
[int]
$AudioExpressionSampleCount,

# Specify the sample rate, default to 44100.
[int]
$AudioExpressionSampleRate
)

$filterArgs = @(
    "exprs=$($AudioExpression -join '|')"
    if ($AudioExpressionChannelLayout) {
        "channel_layout=$($AudioExpressionChannelLayout -join '|')"
    }
    if ($AudioExpressionSampleCount) {
        "nb_samples=$AudioExpressionSampleCount"
    }
    if ($AudioExpressionSampleRate) {
        "sample_rate=$AudioExpressionSampleRate"
    }
) -join ':'


if ($command -eq 'Edit-Media') {
    "-af"
    "aeval=$filterArgs" -replace '=$'
} else {
    '-f'
    'lavfi'
    '-i'
    "aevalsrc=$filterArgs" -replace '=$'
}