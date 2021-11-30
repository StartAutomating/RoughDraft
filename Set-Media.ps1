function Set-Medium
{
    <#
    .Synopsis
        Sets media metadata
    .Description
        Sets media metadata, using ffmpeg
    .Example
        Set-Media -InputPath $home\Music\ASong.mp3 -Property @{
            Title = "A Song"
            Artist = "An Artist"
            Lyrics = "Some lyrics"
        }
    .Example
        Set-Media -InputPath $home\Music\ASong.mp3 -AlbumArt $home\Music\Cover.jpg
    .Link
        Get-Media
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([Nullable])]
    param(
    # The Input Path
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Fullname')]
    [string[]]
    $InputPath,

    # A dictionary of properties to update
    [Parameter(ValueFromPipeline)]
    [Alias('InputObject')]
    [PSObject[]]
    $Property,

    # A collection of properties to clear
    [string[]]
    $ClearProperty,

    # The path to album art.
    [string]
    $AlbumArt,

    # The type of album art.  By default 'Cover (front)'
    [string]
    $AlbumArtType = 'Cover (front)',

    # The path to FFMpeg.exe.  Download it from http://ffmpeg.org/
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [string]
    $FFMpegPath
    )


    begin {
        $allInputsFiles = [Collections.ArrayList]::new()
        $allInputObjects = [Collections.ArrayList]::new()
        #region Find ffmpeg
        $ffmpeg = & $findffMpeg -ffMpegPath $ffMpegPath
        #endregion Find ffmpeg

        $xmlPropertyNames = 'LocalName','NamespaceURI','Prefix',
            'NodeType','ParentNode','OwnerDocument','IsEmpty',
            'Attributes','HasAttributes','SchemaInfo',
            'InnerXml','InnerText','NextSibling','PreviousSibling',
            'Value','ChildNodes','FirstChild','LastChild','HasChildNodes',
            'IsReadOnly','OuterXml','BaseURI','PreviousText'
    }

    process {
        $allInputsFiles.AddRange($InputPath)
        if ($Property) {
            $allInputObjects.AddRange($Property)
        }
    }

    end {
        $c, $t, $id = 0, $allInputsFiles.Count, [Random]::new().Next()
        foreach ($in in $allInputsFiles) {

            #region Resolve the Input Path
            $ri =
                if ([IO.File]::Exists($In)) {
                    $In
                } else {
                    $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($In) |
                        Get-Item -LiteralPath { $_} |
                        Select-Object -ExpandProperty Fullname
                }
            if (-not $ri) { continue }
            #endregion Resolve the Input Path

            $inputObject = $allInputObjects[$c]
            Write-Progress "Setting Metadata" "$ri" -PercentComplete ($c * 100 / $t) -Id $id
            $c++

            $inFile = "$ri"
            $inFileInfo = [IO.FileInfo]$inFile
            $tempFileName = Join-Path $inFileInfo.Directory.FullName ('_temp_' + $inFileInfo.Name)

            $copyArgs = @('-c', 'copy')

            $metadataArgs = @(
                if ($ClearProperty -match '\*') {
                    $originalMetadata = Get-Media -InputPath $inFile
                    foreach ($prop in $originalMetadata.psobject.properties) {
                        $matchedFilter = foreach ($cp in $ClearProperty) {
                            if ($prop.Name -like $cp) {
                                $true;break
                            }
                        }

                        if ($matchedFilter) {
                            '-metadata'
                            '' + $prop.Name + '=""'
                        }
                    }
                } else {
                    foreach ($PropertyToClear in $ClearProperty) {
                        '-metadata'
                        '' + $PropertyToClear + '=""'
                    }
                }

                if ($AlbumArt) {
                    # If we're setting album art, resolve the path
                    $raa =
                        if ([IO.File]::Exists($AlbumArt)) {
                            $AlbumArt
                        } else {
                            $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($AlbumArt) |
                                Get-item -literalPath { $_ } -Force |Select-Object -ExpandProperty Fullname
                        }

                    # Then we copy the image stream in
                    if (-not $raa) { continue }
                    $copyArgs = @('-i', $raa, '-c:a', 'copy', '-c:v','copy', '-map', '0:0','-map','1:0')
                    '-id3v2_version'
                    3
                    '-metadata:s:v'
                    'title="Album Cover"'  # indicate it's an album cover
                    '-metadata:s:v'
                    "comment=`"$AlbumArtType`"" # and then add a comment about what album art type it is.
                }
                if ($inputObject -is [Collections.IDictionary]) {
                    foreach ($kv in $inputObject.GetEnumerator()) {
                        '-metadata'
                        '' + $kv.Key + "=" + (
                            $kv.Value -replace '"','\"' -replace
                                '\[','(' -replace
                                '\]',')' -replace '&', 'and') + " "
                    }
                } elseif ($inputObject) {
                    foreach ($prop in $inputObject.psobject.properties) {
                        if ($inputObject -is [Xml.XmlElement] -and
                            $xmlPropertyNames -contains $prop.Name) { continue }
                        '-metadata'
                        '' + $prop.Name + '="' + ($prop.Value -replace '"','\"') + '"'
                    }
                }
            )

            if ($metadataArgs.Count) {
                if ($PSCmdlet.ShouldProcess("$inFile $metadataArgs")) {
                    & $ffmpeg -i $inFile @copyArgs @metadataArgs $tempFileName '-y' 2>&1 |
                        & { process {
                            if ('silentlycontinue', 'ignore' -notcontains $VerbosePreference) {
                                Write-Verbose "$_"
                            }
                        } }

                    if (Test-Path -LiteralPath $tempFileName) {
                        $newFile = Get-Item -LiteralPath $tempFileName
                        if ($newFile.Length) {
                            Move-Item -LiteralPath $tempFileName -Destination $inFile -Force
                        }
                    }
                }
            }

        }


        Write-Progress "Setting Metadata" " " -Completed -Id $id
    }
}