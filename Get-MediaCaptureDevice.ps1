function Get-MediaCaptureDevice
{
    <#
    .Synopsis
        Lists media capture devices
    .Description
        Lists DirectShow media capture devices, using FFMpeg
    .Example
        Get-MediaCaptureDevice
    .Link
        Start-MediaRecording
    #>
    [OutputType([PSObject])]
    param(
    # The path to FFMpeg.exe.  By default, checks in Program Files\FFMpeg\. Download FFMpeg from http://ffmpeg.org/.  
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FFMpegPath
    )

    process {
        #region Find FFMpeg
        $ffmpeg = & $findffMpeg -ffMpegPath $ffmpegPath
        #endregion Find FFMpeg
        
        $ffOut= & $ffmpeg -list_devices true -f dshow -i dummy 2>&1 
        
        $inVideoDevices  = $false
        $ffParts =  $ffOut -split '[\[\]]' | Where-Object { $_.Trim() } 

        for ($i = $ffParts.Length - 1; $i -ge 0; $i--) {
            if ($ffParts[$i] -like "*dshow*@*") {
                continue   
            }

            if ($ffParts[$i] -like "  lib*/*") {
                # From here on out it's system info
                break
            }

            if ($ffParts[$i] -like '*DirectShow video devices*') {
                $inVideoDevices  = $false
                continue
            }

            if ($ffParts[$i] -like "*alternative name*") {
                $lastAlternativeName = $ffParts[$i].Substring($ffParts[$i].IndexOf('"') + 1).Trim().TrimEnd('"')
            } else {
                if ($ffParts[$i] -like '*DirectShow audio devices*') {
                    $inVideoDevices  = $true
                    continue
                }
                if ($ffParts[$i] -like "*dummy: Immediate exit requested*") {
                    continue
                }

                if ($ffParts[$i] -like '*DirectShow video devices*') {
                    
                    break
                }
                
                
                New-Object PSObject |
                    Add-Member NoteProperty FriendlyName $ffParts[$i].Substring($ffParts[$i].IndexOf('"') + 1).Trim().TrimEnd('"') -PassThru | 
                    Add-Member NoteProperty IsVideoDevice $inVideoDevices -PassThru | 
                    Add-Member NoteProperty SystemName $lastAlternativeName -PassThru                     
                
                
            }
        }
            

    }
} 
