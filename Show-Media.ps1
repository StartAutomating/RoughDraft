function Show-Media
{
    <#
    .Synopsis
        Shows media
    .Description
        Shows media, using FFPlay
    .Link
        Get-RoughDraftExtension
    .Link
        Use-RoughDraftExtension
    .Example
        Show-Media -InputPath $home\Music\ASong.mp3
    .Example
        Show-Media -InputPath $home\Videos\AMovie.mp4 -Fullscreen
    #>
    [OutputType([Nullable], [Management.Automation.Job])]
    param(
    # The input path.
    [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName='MediaPlayer')]
    [Alias('Fullname')]
    [string]
    $InputPath,

    # If set, will run as a background job.
    [switch]
    $AsJob,

    # The resolution of the media player.  This can be passed down to extensions that generate video.
    [string]
    $Resolution,

    # The display mode.  When input is audio, defaults to 'Waves'
    [Parameter(ValueFromPipelineByPropertyName,ParameterSetName='MediaPlayer')]
    [ValidateSet('Default','Waves','RDFT')]
    [string]
    $ShowMode,

    # The volume.
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateRange(0,100)]
    [int]
    $Volume,

    # If set, will run fullscreen
    [switch]
    $Fullscreen,

    # If set, will keep the player open after the media finishes.
    [switch]
    $KeepOpen,

    # If set, will not automatically rotate video.
    [Alias('NoAutoRotate')]
    [switch]
    $DoNotAutoRotate,

    # Set the x position for the left of the window
    [int]
    $Left,

    # Set the y position for the top of the window
    [int]
    $Top,

    # If set, will force the displayed width.
    [int]
    $Width,

    # If set, will force the displayed height.
    [int]
    $Height,

    # If set, will not display anything.
    [switch]
    $NoDisplay,

    # If set, will run in a borderless window.
    [switch]
    $NoBorder,

    # If set, will run in a window that is always on top.
    [switch]
    $AlwaysOnTop,

    # The path to FFPlay.  If not provided, this will be automatically detected.
    [string]
    $FFPlayPath
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Use-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        if ($AsJob) {
            return . $StartRoughDraftJob
        }
        $ffPlay = Get-FFPlay -ffplayPath $FFPlayPath
        if (-not $ffPlay) { return }

        $ffArgs = @(
            '-hide_banner'
            if (-not $KeepOpen) {
                '-autoexit'
            }
            if (-not $DoNotAutoRotate) {
                '-autorotate'
            }
            if ($Fullscreen) {
                '-fs'
            }
            if ($ShowMode -eq 'Waves') {
                '-showmode',1
            }
            if ($ShowMode -eq 'RDFT') {
                '-showmode',2
            }
            if ($Resolution) {
                $width, $height = $Resolution -split 'x'
            }

            if ($width) {
                '-x',$Width
            }

            if ($height) {
                '-y', $Height
            }

            if ($PSBoundParameters.ContainsKey('Left') -or $PSBoundParameters.ContainsKey('Top')) {
                '-left', $Left
                '-top', $top
            }

            if ($PSBoundParameters.ContainsKey('Volume')) {
                '-volume', $Volume
            }

            if ($NoDisplay) {'-nodisp'}
            if ($AlwaysOnTop) {'-alwaysontop'}
            if ($NoBorder) {'-noborder'}

            
        )
        $theDuration = $null
        if ($PSCmdlet.ParameterSetName -eq 'MediaPlayer') {
            $myParams = ([Ordered]@{} + $PSBoundParameters)
            $ri = if ([IO.File]::Exists($InputPath)) {
                $InputPath
            } else {
                $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath) |
                    Get-Item -LiteralPath {$_ } |
                    Select-Object -ExpandProperty Fullname
            }            
            if ($ri -match '\.m3u$') {
                $myParams.Remove('InputPath')
                Push-Location ($ri | Split-Path)
                Get-Content -LiteralPath $ri | Where-Object { $_ -notlike '#*' } | Get-Item | Show-Media @myParams
                Pop-Location
                return
            }

            $mi = $mediaInfo = Get-Media -InputPath $ri
            $theDuration = $mi.Duration

            $ffArgs += '-i', $ri
            if ($mi.CodecTypes -and @($mi.CodecTypes)[0] -eq 'Audio' -and (-not ($ffArgs -eq '-showmode'))) {
                $ffArgs += '-showmode', '1'
            }
        }

        :nextFile do {

        #region Handle Extensions
        $in = [Ordered]@{} + $PSBoundParameters
        Use-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
            . Use-RoughDraftExtension -Run |
            . { process {
                $inObj = $_
                if ($inObj.ExtensionOutput) {
                    Write-Verbose "Adding Filter Parameters from Extension '$extensionCommand'"
                    Write-Verbose "$extensionOutput"
                    $ffArgs += $extensionOutput
                }
                if ($inObj.Done) {
                    continue nextFile
                }
            } }        
        #endregion Handle Extensions
        } while (0) 

        $progressId = Get-Random

        $lastTime = $null
        Use-FFPlay -FFPlayArgument $ffArgs |
            ForEach-Object {
                $line= $_
                if ($line -like '*:*=*') {
                    $lineParts = @($line -split '\s' -ne '')
                    if ($lineParts[0] -as [double]) {
                        $perc = if ($theDuration) {
                            $lastTime = [Timespan]::FromSeconds($lineParts[0] -as [double])
                            $lastTime.TotalSeconds * 100/ $theDuration.TotalSeconds
                        }
                        else {
                            (($lineParts[0] -as [int]) % 60)*100/60
                        }
                        Write-Progress "Playing @ $($lineParts[0])s" " $InputPath" -Id $progressId -PercentComplete ([Math]::Min($perc, 100))
                    }
                }
            }

        Write-Progress "Playing" " $InputPath" -Completed -Id $progressId

        # If we stopped before the end
        if ($theDuration -and ($lastTime -lt $theDuration) -and # and we're calling ourselves recursively
            @(Get-PSCallStack | Where-Object { $_.InvocationInfo.MyCommand -eq $myCmd }).Count -ge 2) {
            break out # break to a non-existent label, which will stop the current scipt.
        }
    }
}
