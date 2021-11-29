<#
.Synopsis
    Gets VolumeLevels
.Description
    Gets Volume Levels, using the volumedetect audio filter
.Link
    https://ffmpeg.org/ffmpeg-filters.html#volumedetect
#>
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Measure-Media            
[Management.Automation.Cmdlet("Measure","Media")]
param(
[Parameter(Mandatory)]
[switch]
$VolumeLevel
)


$ffArgs = @(
    '-i', "`"$ri`"", "-af", "volumedetect", '-f', 'null', '-'
)

Invoke-FFMpeg -FFMpegPath $ffMpegPath -FFMpegArgument $ffArgs  | 
    . {
        begin {
            $volumeData = [PSCustomObject][Ordered]@{
                InputPath  = "$ri"
                FilterName = "volumedetect"
            }
        }
        process {
            $line = $_    
            if ($line -like "*mean*volume*" -or $line -like "*max*volume*" -or $line -like "*histogram*" -or $line -like "*VolumeDetect*") {
                $blackDetectLine = $line
                $lineParts = $blackDetectLine -split "[:\]]"  -ne ''                    

                if ($line -like "*mean*volume*" -and $line -like "*max*volume*")
                {
                    $parts = $line -split "[:\$([Environment]::newline)]" -ne ''
                    $maxV = $lineParts[-1]
                    $meanV = $lineParts[-4]
                    if ("$maxV".Trim()) {
                        $volumeData.psobject.properties.add((New-Object Management.Automation.PSNoteProperty "max_volume".Trim(), "$maxV".Trim()))                                        
                    }
                    if ("$meanV".Trim()) {
                        $volumeData.psobject.properties.add((New-Object Management.Automation.PSNoteProperty "mean_volume".Trim(), "$meanV".Trim()))                                        
                    }
                        
                } 
                else
                {
                    $propertyName = $lineParts[-2]
                    $propertyValue = $lineParts[-1]
                    

                    if ("$propertyName".Trim() -and "$propertyValue".Trim()) {
                        $volumeData.psobject.properties.add((New-Object Management.Automation.PSNoteProperty "$propertyName".Trim(), "$propertyValue".Trim()))                                        
                    } else {
                        $null = $null
                    }
                }
                
                    

                    
                    
                    
                $lastBlackDetectEnd = $BlackEnd
                $null = $null
                Write-Verbose "$line"
            }
        }

        end {
            $volumeData
        }
    }