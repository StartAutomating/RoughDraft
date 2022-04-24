<#
.SYNOPSIS
    Draws Text on Video
.DESCRIPTION
    Draws Text on Video, using the [drawtext filter](http://ffmpeg.org/ffmpeg-filters.html#drawtext)
.EXAMPLE
    New-Media -Color "Black" -Duration "00:00:05" -Resolution 1920x1080 -OutputPath .\BlackBackground.mp4 |
        Edit-Media -DrawText -DrawTextText "Hello World" -DrawTextCenter -DrawTextFontSize 36
.LINK
    http://ffmpeg.org/ffmpeg-filters.html#drawtext
#>
[Management.Automation.Cmdlet("^(?>Edit|Show)", "Media")]
[Reflection.AssemblyMetaData("Order", 1000)] # We want DrawText to happen after almost every other effect.
param(
[Parameter(Mandatory)]
[switch]
$DrawText,

# set font file
[string]
$DrawTextFontFile,
# set text
[string]
$DrawTextText,
# set text file
[string]
$DrawTextTextFile,
# set foreground color (default "black")
[string]
$DrawTextFontColor,
# set foreground color expression (default "")
[string]
$DrawTextFontColorExpression,
# set box color (default "white")
[string]
$DrawTextBoxColor,
# set border color (default "black")
[string]
$DrawTextBorderColor,
# set shadow color (default "black")
[string]
$DrawTextShadowColor,
# set box (default false)
[switch]
$DrawTextBox,
# set box border width (from INT_MIN to INT_MAX) (default 0)
[int]
$DrawTextBoxBorderWidth,
# set line spacing in pixels (from INT_MIN to INT_MAX) (default 0)
[int]
$DrawTextLineSpacing,
# set font size
[string]
$DrawTextFontSize,
# set x expression (default "0")
[string]
$DrawTextX,
# set y expression (default "0")
[string]
$DrawTextY,
# set shadow x offset (from INT_MIN to INT_MAX) (default 0)
[int]
$DrawTextShadowX,
# set shadow y offset (from INT_MIN to INT_MAX) (default 0)
[int]
$DrawTextShadowY,
# set border width (from INT_MIN to INT_MAX) (default 0)
[int]
$DrawTextBorderWidth,
# set tab size (from 0 to INT_MAX) (default 4)
[int]
$DrawTextTabSize,
# set base time (from I64_MIN to I64_MAX) (default I64_MIN)
[int64]
$DrawTextBasetime,
# Font name (default "Sans")
[string]
$DrawTextFont,
# set the expansion mode (from 0 to 2) (default normal)
[int]
$DrawTextExpansion,
# set initial timecode
[string]
$DrawTextTimeCode,
# set 24 hours max (timecode only) (default false)
[boolean]
$DrawTextTc24hmax,
# set rate (timecode only) (from 0 to INT_MAX) (default 0/1)
[double]
$DrawTextTimecodeRate,
# set rate (timecode only) (from 0 to INT_MAX) (default 0/1)
[double]
$DrawTextRate,
# reload text file for each frame (default false)
[switch]
$DrawTextReload,
# apply alpha while rendering (default "1")
[string]
$DrawTextAlpha,
# check and fix text coords to avoid clipping (default false)
[switch]
$DrawTextFixBounds,
# start frame number for n/frame_num variable (from 0 to INT_MAX) (default 0)
[int]
$DrawTextStartNumber,
# the source of text
[string]
$DrawTextTextSource,
# attempt to shape text before drawing (default true)
[switch]
$DrawTextTextShaping,
# set font loading flags for libfreetype (default 0)
[int]
$DrawTextFontLoadFlags,

# If set, will draw text in the center.  
# This will provide -DrawTextX '(w-text_w)/2' and -DrawTextY '(h-text_h)/2'
[switch]
$DrawTextCenter
)


$realName = @{
    DrawTextFontColorExpression = 'fontcolor_expr'
    DrawTextBoxBorderWidth = 'boxborderw'
    DrawTextBorderWidth = 'borderw'
    DrawTextTimecodeRate = 'timecode_rate'
    DrawTextFixBounds = 'fix_bounds'
    DrawTextStartNumber = 'start_number'
    DrawTextTextSource = 'text_source'
    DrawTextTextShaping = 'text_shaping'
    DrawTextFontLoadFlags = 'ft_load_flags'
}
if ($DrawTextCenter) {
    if (-not $DrawTextX) {
        $PSBoundParameters['DrawTextX'] = $DrawTextX = "(w-text_w)/2"
    }
    if (-not $DrawTextY) {
        $PSBoundParameters['DrawTextY'] = $DrawTextY = "(h-text_h)/2"
    }
}
$filterArgs = @(
    
    foreach ($param in $PSBoundParameters.GetEnumerator()) {
        if ($param.Key -IN 'DrawText', 'DrawTextCenter',
            'Verbose', 'Debug', 'WarningAction', 'WarningVariable', 'ErrorAction', 'ErrorVariable') { continue }
        $filterName = 
            if ($realName[$param.Key]) {
                $realName[$param.Key]
            } else {
                ($param.Key -replace '^DrawText').ToLower()
            }
        $filterValue = 
            if ($param.Value -is [switch]) {
                ($param.Value -as [bool]).ToString().ToLower()
            } elseif ($param.Value -is [string]) {
                "'$($param.Value.Replace('\', "'\\\\'").Replace("'","'\''").Replace(":", "'\\:'").Replace('"','\"'))'"
            } else {
                $param.Value
            }

        <#
        if ($filterName -eq 'text') {
            $tmpFile = 
                if ($env:TEMP) {
                    Join-Path $env:TEMP "DrawText$(Get-Random).txt"
                } else {
                    Join-Path "/tmp" "DrawText$(Get-Random).txt"
                }
            $filterName = "textfile"
            $filterValue = "'$("$tmpFile".Replace('\', "'\\\\'").Replace("'","'\''").Replace(":", "'\\:'"))'"
        }
        #>
        "`"$filterName=$filterValue`""
    }        
) -join ':'

"-vf"
"drawtext=$filterArgs" -replace '=$'
