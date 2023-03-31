<div align='center'>
<img src='Assets/RoughDraft@400x400.png' />
<br/>
<a href='https://www.powershellgallery.com/packages/RoughDraft/'>
<img src='https://img.shields.io/powershellgallery/dt/RoughDraft' />
</a>
</div>

A Fun PowerShell Module for Multimedia
------------------

### Commands
RoughDraft is a fun PowerShell Module for Multimedia.

It provides pipeline-aware command to create, convert, query, edit, and join multimedia files.

## RoughDraft -Media Commands

The core of RoughDraft are the -Media commands:

|Name         |Description                    |
|:------------|-------------------------------|
|Convert-Media|Converts media between formats |
|Edit-Media   |Edits media files              |
|Get-Media    |Gets media metadata            |
|Join-Media   |Joins media files              |
|New-Media    |Creates media files            |
|Recieve-Media|Receives media from devices    |
|Set-Media    |Sets media metadata            |
|Show-Media   |Shows media files              |
|Split-Media  |Splits media files             |
|Send-Media   |Broadcasts media               |

These commands are built atop of [FFMpeg](https://ffmpeg.org)

All Media Commands are Extensible.  See the [list of extensions](RoughDraftExtensions.md)

### Examples

#### Convert-Media

~~~PowerShell
# Converts a Movie.mkv to MP4
Convert-Media .\Movie.mkv mp4 

# Converts an .mp4 file to an .mp3
Convert-Media .\Movie.mp4 .\Soundtrack.mp3 

# Get rid of flac files
Convert-Media .\Song.flac .mp3

# Convert all .flac files to .mp3
Get-ChildItem -Path $home\Music -Recurse |
    Where-Object Extension -eq '.flac' |
    Convert-Media .mp3
~~~

#### Edit-Media

~~~PowerShell
# Adds a sepia effect to an .mp4
Edit-Media .\Movie.mp4 -Sepia

# Increases the audio by 4 decibals.
Edit-Media .\Song.mp3 -AudioGain 4db
~~~

#### Get-Media

~~~PowerShell
# Get metadata about an mp3
Get-Media .\Song.mp3 

# Detect silences within a song
Get-Media .\Song.mp3 -SilenceDetect

# Gets metadata about a movie.
Get-Media .\Movie.mp4        
~~~

#### Join-Media

~~~PowerShell
# Make a timelapse from a directory of pictures
dir *.jpg | Join-Media -OutputPath .\Timelapse.mp4 -Timelapse 

# Join an audio and video file
Join-Media -InputPath .\Silent.mp4, .\Soundtrack.mp3 -OutputPath .\Movie.mp4 

# Join mp3s into an album
dir *.mp3 | Join-Media -Output ..\Album.mp3 

# Join various video files into a longer movie
dir | Where-Object Extension -in '.mkv', '.mp4' | Join-Media -Output ..\Movie.mp4 
~~~

#### New-Media

~~~PowerShell
# Create a red jpg
New-Media -Color Red -OutputPath .\Red.jpg 

# Create a 15 second cyan mp4 at 1080p
New-Media -Color Cyan -OutputPath .\Cyan.mp4 -Duration '00:00:05' -Resolution '1920x1080'

# Create an RGB test source
New-Media -TestSource rgbtestsrc -OutputPath .\rgbtestsrc.mp4 -Duration '00:00:10'  
~~~


#### Set-Media

~~~PowerShell
# Set metadata about a video
Set-Media .\Movie.mp4 -Property @{title='My Movie'}

# Sets metadata about a music file.
Set-Media .\Song.mp3 -Property @{title='My Song';artist='me';'lyrics-eng' = 'My Lyrics'}

# Sets album artwork
Set-Media .\Song.mp3 -AlbumArt .\Cover.jpg
~~~


## Additional RoughDraft commands:

|Name                   |Description                        |
|-----------------------|-----------------------------------|
|Get-FFMpeg             |Gets FFMpeg                        |
|Get-FFPlay             |Gets FFPlay                        |
|Get-FFProbe            |Gets FFProbe                       |
|Get-FFProbe            |Uses FFProbe directly              |
|Get-RoughDraftExtension|Gets RoughDraftExtensions          |
|Use-FFMpeg             |Uses FFMpeg directly               |
|Use-FFPlay             |Uses FFPlay directly               |
|Use-FFProbe            |Uses FFProbe directly              |


### Additional examples:

~~~PowerShell
# List available codecs
Get-FFMpeg -ListCodec         

# List available codecs
Get-FFMpeg -ListCaptureDevice 

# List available filters
Get-FFMpeg -ListFilter

# Get information about a filter 
Get-FFMpeg -FilterName
~~~ 

## RoughDraft Extensions

RoughDraft uses Extensions to make complex media scenarios easier work with.
There are currently 104 extensions:


|DisplayName                                                           |Synopsis                                      |Extends|
|----------------------------------------------------------------------|----------------------------------------------|-------|
|[AlbumArt](AlbumArt-Extension.md)                                |Set-Media                                     |
|[AmplifyPixel](AmplifyPixel-Extension.md)                        |Edit-Media,Show-Media                         |
|[AudioCrusher](AudioCrusher-Extension.md)                        |Edit-Media,Show-Media                         |
|[AudioExpression](AudioExpression-Extension.md)                  |Edit-Media,New-Media,Show-Media               |
|[AudioFrequencyExpression](AudioFrequencyExpression-Extension.md)|Edit-Media,Show-Media                         |
|[AudioGain](AudioGain-Extension.md)                              |Edit-Media,Show-Media                         |
|[BilateralSmooth](BilateralSmooth-Extension.md)                  |Edit-Media,Show-Media                         |
|[BlackDetect](BlackDetect-Extension.md)                          |Get-Media                                     |
|[BlackFrame](BlackFrame-Extension.md)                            |Get-Media                                     |
|[BlendFrame](BlendFrame-Extension.md)                            |Edit-Media,Join-Media,Show-Media              |
|[BlendVideo](BlendVideo-Extension.md)                            |Join-Media                                    |
|[Blur](Blur-Extension.md)                                        |Edit-Media,Show-Media                         |
|[CaptureDevice](CaptureDevice-Extension.md)                      |Get-FFMpeg                                    |
|[Chorus](Chorus-Extension.md)                                    |Edit-Media,Show-Media                         |
|[Codecs](Codecs-Extension.md)                                    |Get-FFMpeg                                    |
|[ColorContrast](ColorContrast-Extension.md)                      |Edit-Media,Show-Media                         |
|[ColorExpression](ColorExpression-Extension.md)                  |Edit-Media,Join-Media,Show-Media              |
|[ColorHold](ColorHold-Extension.md)                              |Edit-Media,Show-Media                         |
|[Colorize](Colorize-Extension.md)                                |Edit-Media,Show-Media                         |
|[ColorScope](ColorScope-Extension.md)                            |Edit-Media,Show-Media                         |
|[ColorSource](ColorSource-Extension.md)                          |New-Media,Show-Media                          |
|[Convolve](Convolve-Extension.md)                                |Join-Media                                    |
|[Crop](Crop-Extension.md)                                        |Edit-Media,Receive-Media,Send-Media,Show-Media|
|[CropDetect](CropDetect-Extension.md)                            |Get-Media                                     |
|[DataScope](DataScope-Extension.md)                              |Edit-Media                                    |
|[Deconvolve](Deconvolve-Extension.md)                            |Join-Media                                    |
|[DirectShow](DirectShow-Extension.md)                            |Receive-Media,Send-Media,Show-Media           |
|[DrawSubtitle](DrawSubtitle-Extension.md)                        |Convert-Media,Edit-Media                      |
|[DrawText](DrawText-Extension.md)                                |Edit-Media,Show-Media                         |
|[Echo](Echo-Extension.md)                                        |Edit-Media,Show-Media                         |
|[EdgeDetect](EdgeDetect-Extension.md)                            |Edit-Media,Show-Media                         |
|[Emboss](Emboss-Extension.md)                                    |Edit-Media                                    |
|[Erosion](Erosion-Extension.md)                                  |Edit-Media,Show-Media                         |
|[Exposure](Exposure-Extension.md)                                |Edit-Media,Show-Media                         |
|[FadeIn](FadeIn-Extension.md)                                    |Edit-Media                                    |
|[FillBorder](FillBorder-Extension.md)                            |Edit-Media,Show-Media                         |
|[FilterInput](FilterInput-Extension.md)                          |Get-FFMpeg                                    |
|[FiniteEqualizer](FiniteEqualizer-Extension.md)                  |Edit-Media,Show-Media                         |
|[Flanger](Flanger-Extension.md)                                  |Edit-Media,Show-Media                         |
|[FlipHorizontal](FlipHorizontal-Extension.md)                    |Edit-Media,Show-Media                         |
|[FlipVertical](FlipVertical-Extension.md)                        |Edit-Media,Show-Media                         |
|[FrameBuffer](FrameBuffer-Extension.md)                          |Receive-Media,Send-Media,Show-Media           |
|[FrameStep](FrameStep-Extension.md)                              |Edit-Media,Show-Media                         |
|[GifPalette](GifPalette-Extension.md)                            |Convert-Media                                 |
|[Histogram](Histogram-Extension.md)                              |Edit-Media,Show-Media                         |
|[Hue](Hue-Extension.md)                                          |Edit-Media,Show-Media                         |
|[Hysteresis](Hysteresis-Extension.md)                            |Join-Media                                    |
|[LagFun](LagFun-Extension.md)                                    |Edit-Media,Show-Media                         |
|[Life](Life-Extension.md)                                        |New-Media,Show-Media                          |
|[LimitPixel](LimitPixel-Extension.md)                            |Edit-Media,Show-Media                         |
|[ListFilters](ListFilters-Extension.md)                          |Get-FFMpeg                                    |
|[ListProtocols](ListProtocols-Extension.md)                      |Get-FFMpeg                                    |
|[Mandelbrot](Mandelbrot-Extension.md)                            |New-Media,Show-Media                          |
|[MedianPixel](MedianPixel-Extension.md)                          |Edit-Media,Show-Media                         |
|[Mirror](Mirror-Extension.md)                                    |Edit-Media,Show-Media                         |
|[MixAudio](MixAudio-Extension.md)                                |Join-Media                                    |
|[MixVideo](MixVideo-Extension.md)                                |Join-Media                                    |
|[Monochrome](Monochrome-Extension.md)                            |Edit-Media                                    |
|[NoAudio](NoAudio-Extension.md)                                  |Split-Media                                   |
|[NoLogo](NoLogo-Extension.md)                                    |Edit-Media,Show-Media                         |
|[Overlay](Overlay-Extension.md)                                  |Join-Media                                    |
|[Phaser](Phaser-Extension.md)                                    |Edit-Media,Show-Media                         |
|[PitchFactor](PitchFactor-Extension.md)                          |Edit-Media,Show-Media                         |
|[Pixelate](Pixelate-Extension.md)                                |Edit-Media                                    |
|[Playlist](Playlist-Extension.md)                                |Join-Media                                    |
|[Pulsator](Pulsator-Extension.md)                                |Edit-Media,Show-Media                         |
|[RandomizeFrame](RandomizeFrame-Extension.md)                    |Edit-Media,Show-Media                         |
|[Rate](Rate-Extension.md)                                        |Edit-Media,Show-Media                         |
|[Resize](Resize-Extension.md)                                    |Edit-Media,Convert-Media,Show-Media           |
|[ReverseAudio](ReverseAudio-Extension.md)                        |Edit-Media                                    |
|[ReverseVideo](ReverseVideo-Extension.md)                        |Edit-Media                                    |
|[Rotate](Rotate-Extension.md)                                    |Edit-Media,Convert-Media,Show-Media           |
|[Scale](Scale-Extension.md)                                      |Edit-Media,Show-Media                         |
|[ScrollVideo](ScrollVideo-Extension.md)                          |Edit-Media,Show-Media                         |
|[Sepia](Sepia-Extension.md)                                      |Edit-Media                                    |
|[ShowFrequency](ShowFrequency-Extension.md)                      |Edit-Media,New-Media,Show-Media               |
|[ShowScale](ShowScale-Extension.md)                              |Edit-Media,New-Media,Show-Media               |
|[ShowSpectrum](ShowSpectrum-Extension.md)                        |Edit-Media,New-Media,Show-Media               |
|[ShowVectorScope](ShowVectorScope-Extension.md)                  |Edit-Media,New-Media,Show-Media               |
|[ShowVolume](ShowVolume-Extension.md)                            |Edit-Media,New-Media,Show-Media               |
|[ShowWaveform](ShowWaveform-Extension.md)                        |Edit-Media,New-Media,Show-Media               |
|[ShuffleFrames](ShuffleFrames-Extension.md)                      |Edit-Media                                    |
|[Sierpinski](Sierpinski-Extension.md)                            |New-Media,Show-Media                          |
|[SilenceDetect](SilenceDetect-Extension.md)                      |Get-Media                                     |
|[SilenceRemove](SilenceRemove-Extension.md)                      |Edit-Media                                    |
|[Sine](Sine-Extension.md)                                        |New-Media                                     |
|[Skew](Skew-Extension.md)                                        |Edit-Media,Show-Media                         |
|[SubFrequencyCut](SubFrequencyCut-Extension.md)                  |Edit-Media,Show-Media                         |
|[Subtitler](Subtitler-Extension.md)                              |New-Media                                     |
|[SuperEqualizer](SuperEqualizer-Extension.md)                    |Edit-Media,Show-Media                         |
|[SuperFrequencyCut](SuperFrequencyCut-Extension.md)              |Edit-Media,Show-Media                         |
|[Tempo](Tempo-Extension.md)                                      |Edit-Media,Show-Media                         |
|[TestSource](TestSource-Extension.md)                            |New-Media,Show-Media                          |
|[Tile](Tile-Extension.md)                                        |Edit-Media                                    |
|[TimeMix](TimeMix-Extension.md)                                  |Edit-Media,Show-Media                         |
|[Tremolo](Tremolo-Extension.md)                                  |Edit-Media,Show-Media                         |
|[Vibrato](Vibrato-Extension.md)                                  |Edit-Media,Show-Media                         |
|[VideoExpression](VideoExpression-Extension.md)                  |Edit-Media,Show-Media                         |
|[VideoForLinux](VideoForLinux-Extension.md)                      |Receive-Media,Send-Media,Show-Media           |
|[Vignette](Vignette-Extension.md)                                |Edit-Media,Show-Media                         |
|[VolumeLevel](VolumeLevel-Extension.md)                          |Get-Media                                     |
|[Watermark](Watermark-Extension.md)                              |Edit-Media                                    |
|[YouTubeDL](YouTubeDL-Extension.md)                              |Get-Media                                     |
|[ZoomPan](ZoomPan-Extension.md)                                  |Edit-Media,Show-Media                         |



## Extending RoughDraft

RoughDraft is built extensibly.  This is so that complex FFMpeg operations can be abstracted into small amounts of code.

You can see the current set of extensions with:

~~~PowerShell
Get-RoughDraftExtension
~~~


### Extension Scripts

Extensions are simple scripts files named with the regular expression ```\.(rd|RoughDraft)\.(ext|extension)\.ps1$```.

They can exist in any module that adds the tag "RoughDraft".

Extensions should include the following attributes above their parameter block:

~~~PowerShell
# It's an extension
[Runtime.CompilerServices.Extension()]
# that extends Edit-Media            
# (Change this to indicate which command you'd like to extend)
# (Add additional Cmdlet attributes one to extend more commands)
[Management.Automation.Cmdlet("Edit","Media")] 
# that is inherited (this is the default).
# (an extension that is 'Inherited' will return control to the main function when it is done.)
# (an extension that is 'NotInherited' will run and return directly)
[ComponentModel.Inheritance("Inherited")]
param(
# At least one parameter of the extension should be mandatory.
[switch]
$MyEditExtension
)
~~~


### Commands that can be extended:

The following commands can currently be extended:

* Convert-Media
* Edit-Media
* Get-FFMpeg
* Get-Media
* Join-Media
* New-Media
* Recieve-Media
* Set-Media
* Send-Media
* Show-Media
* Split-Media
