function Send-Media
{
    <#
    .Synopsis
        Sends Media 
    .Description
        Sends media from inputs to a stream.
    #>
    param(
    # The input device type.
    [Parameter(ParameterSetName='InputDevice',ValueFromPipelineByPropertyName)]
    [string]
    $InputType,

    # The input device identifier.  This will be specific to a given input type.
    [Parameter(ParameterSetName='InputDevice',ValueFromPipelineByPropertyName)]
    [string]
    $InputDevice,

    # The input path.
    [Parameter(ParameterSetName='InputPath',ValueFromPipelineByPropertyName)]
    [string]
    $InputPath,

    # A list of initial arguments to FFMpeg.
    [Alias('InitArgs','InitArg','InitialArguments','InitialArgument')]
    [string[]]
    $InitialArgumentList,

    # A list of additional arguments to FFMpeg.
    [Alias('Arguments','Argument')]
    [string[]]
    $ArgumentList,

    # The outputURI where the broadcast will be sent.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('OutputUrl')]
    [uri]
    $OutputUri,

    # The protocol used to broadcast the output.
    [Parameter(ValueFromPipelineByPropertyName)]    
    [string]
    $OutputProtocol,
    
    # If set, will run as a background job.
    [switch]
    $AsJob,

    # The path to FFMpeg.exe.  By default, checks in the path.
    [string]
    $FFMpegPath,

    # If set, this will loop the input source.
    [Switch]
    $Loop,

    # If set, this will loop the input source any number of times.
    [int]
    $LoopCount
    )

    dynamicParam {
        $myCmd = $MyInvocation.MyCommand
        Get-RoughDraftExtension -CommandName $myCmd -DynamicParameter
    }

    process {
        if ($AsJob) { # If -AsJob was passed,
            return & $StartRoughDraftJob # start a background job.
        }

        $in = [Ordered]@{} + $PSBoundParameters

        :receivingMedia do {

            #region Handle Extensions        
            $extensionArguments = @()
        
            Get-RoughDraftExtension -CommandName $myCmd -CanRun -ExtensionParameter $in |
                . Get-RoughDraftExtension -Run |
                . { process {
                    $inObj = $_
                    if ($inObj.ExtensionOutput) {
                        Write-Verbose "Adding Arguments from Extension '$extensionCommand'"
                        Write-Verbose "$($inObj.extensionOutput)"
                        $extensionArguments += $inObj.extensionOutput
                    }
                    if ($inObj.Done) {
                        break receivingMedia
                    }
                } }

            #endregion Handle Extensions
            $allArguments = @()
            if ($InitialArgumentList) {
                $allArguments += $InitialArgumentList
            }
            if ($InputType -and $InputDevice) {
                $allArguments += '-f', $InputType, '-i', $InputDevice
            }

            if ($InputPath) {
                $ri = 
                    if ([IO.File]::Exists($InputPath)) {
                        $InputPath
                    } else {
                        $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputPath) |
                            Get-Item -LiteralPath {$_ } |
                            Select-Object -ExpandProperty Fullname
                    }

                $allArguments += '-i',$ri
            }

            if ($Loop -or $LoopCount) { # If we're going to loop it.
                $firstParams += "-stream_loop"
                $firstParams +=
                    if ($LoopCount -ge 0) {
                        $LoopCount
                    } else { -1 }
            }

            if ($extensionArguments) {
                $allArguments += $extensionArguments
            }

            $allArguments += $ArgumentList

            if ($OutputProtocol) {
                $allArguments += '-f',$OutputProtocol
            }
            if ($OutputUri) {
                $allArguments += $OutputUri
            }

            $ProgId = Get-Random
            Write-Verbose "FFMpeg Arguments: $allArguments"

            Use-FFMpeg -FFMpegArgument $allArguments -FFMpegPath $FFMpegPath |
                ForEach-Object {
                    $outLine = $_
                    if (-not $outLine) { return } 
                    Write-Verbose $outLine
                    
                    $progress = $outLine | & ${?<FFMpeg_Progress>} -Extract
                    if ($progress -and 
                        $progress.Time.Totalmilliseconds
                    ) {
                        Write-Progress "Sending Media" "$($progress.Time)" -Id $ProgId
                    }
                }
            Write-Progress "Sending Media" " " -Id $ProgId -Completed
        } while ($false)
    }    
}

