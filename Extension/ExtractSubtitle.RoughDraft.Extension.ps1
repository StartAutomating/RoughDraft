<#
.SYNOPSIS
    Extract Subtitle Extension
.DESCRIPTION
    The Extract Subtitle Extension.
    
    It will be automatically called when converting to:
    
    * .ass
    * .srt
    * .sub
    * .ssa
    * .vtt
    
.EXAMPLE
    Convert-Media -InputPath .\a.mp4 -OutputPath .srt
#>
[Management.Automation.Cmdlet("Convert","Media")]
param()

begin {
    $acceptableExtensions = 'srt','vtt','cc', 'ass', 'ssa','sub', 'jss'
}

process {
    if ($outputPath -notmatch "\.(?>$($acceptableExtensions -join '|'))$") { return }       
    
    switch -regex ($outputPath) {
        "\.srt$" {
            '-c'
            'subrip'
        }
        "\.vtt$" {
            '-c'
            'webvtt'
        }        
        '\.ass$' {
            '-c'
            'ass'
        }
        '\.ssa$' {
            '-c'
            'ssa'
        }        
        '\.jss' {
            '-c'
            'jss'
        }
        
        
    }
}


