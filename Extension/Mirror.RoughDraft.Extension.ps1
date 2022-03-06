<#
.SYNOPSIS
    Mirror Extension
.DESCRIPTION
    Mirrors video
#>
[Management.Automation.Cmdlet("Edit","Media")]
[Management.Automation.Cmdlet("Show","Media")]
param(
[Parameter(Mandatory)]
[switch]
$Mirror,

[switch]
$QuadMirror,

[switch]
$HorizontalMirror
)


if ($Mirror) {
    '-vf'
    if ($horizontalMirror) {
        # Horizontal Mirror
        @'
"
crop=iw:ih/2:0:0,split[top][tmp];
[tmp]vflip[bottom];
[top][bottom] vstack
"
'@
    }
    elseif ($QuadMirror) {
        @'
"
crop=iw/2:ih/2:0:0,split[top][tmp];
[tmp]vflip[bottom];
[top][bottom] vstack, split[left][righttmp];
[righttmp]hflip[right];
[left][right] hstack
"
'@
        # '"crop=iw:ih/2:0:0,split[top][tmp];[tmp]vflip[bottom];[top][bottom] vstack;crop=iw/2:ih:0:0,split[left][tmp];[tmp]hflip[right];[left][right] hstack"'
    } else {
        # Vertical Mirror
        @'
"
crop=iw/2:ih:0:0,split[left][tmp];
[tmp]hflip[right];
[left][right] hstack
"
'@
    }
}



