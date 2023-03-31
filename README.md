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
There are currently 105 extensions:


|DisplayName                                                           |Synopsis                                      |Extends|
|----------------------------------------------------------------------|----------------------------------------------|-------|
|[AlbumArt](docs/AlbumArt-Extension.md)                                |Set-Media                                     |
|[AmplifyPixel](docs/AmplifyPixel-Extension.md)                        |Show-Media,Edit-Media                         |
|[AudioCrusher](docs/AudioCrusher-Extension.md)                        |Show-Media,Edit-Media                         |
|[AudioExpression](docs/AudioExpression-Extension.md)                  |New-Media,Show-Media,Edit-Media               |
|[AudioFrequencyExpression](docs/AudioFrequencyExpression-Extension.md)|Show-Media,Edit-Media                         |
|[AudioGain](docs/AudioGain-Extension.md)                              |Show-Media,Edit-Media                         |
|[BilateralSmooth](docs/BilateralSmooth-Extension.md)                  |Show-Media,Edit-Media                         |
|[BlackDetect](docs/BlackDetect-Extension.md)                          |Get-Media                                     |
|[BlackFrame](docs/BlackFrame-Extension.md)                            |Get-Media                                     |
|[BlendFrame](docs/BlendFrame-Extension.md)                            |Join-Media,Show-Media,Edit-Media              |
|[BlendVideo](docs/BlendVideo-Extension.md)                            |Join-Media                                    |
|[Blur](docs/Blur-Extension.md)                                        |Show-Media,Edit-Media                         |
|[CaptureDevice](docs/CaptureDevice-Extension.md)                      |Get-FFMpeg                                    |
|[Chorus](docs/Chorus-Extension.md)                                    |Show-Media,Edit-Media                         |
|[Codecs](docs/Codecs-Extension.md)                                    |Get-FFMpeg                                    |
|[ColorContrast](docs/ColorContrast-Extension.md)                      |Show-Media,Edit-Media                         |
|[ColorExpression](docs/ColorExpression-Extension.md)                  |Join-Media,Show-Media,Edit-Media              |
|[ColorHold](docs/ColorHold-Extension.md)                              |Show-Media,Edit-Media                         |
|[Colorize](docs/Colorize-Extension.md)                                |Show-Media,Edit-Media                         |
|[ColorScope](docs/ColorScope-Extension.md)                            |Show-Media,Edit-Media                         |
|[ColorSource](docs/ColorSource-Extension.md)                          |New-Media,Show-Media                          |
|[Convolve](docs/Convolve-Extension.md)                                |Join-Media                                    |
|[Crop](docs/Crop-Extension.md)                                        |Send-Media,Show-Media,Receive-Media,Edit-Media|
|[CropDetect](docs/CropDetect-Extension.md)                            |Get-Media                                     |
|[CrossFade](docs/CrossFade-Extension.md)                              |Join-Media                                    |
|[DataScope](docs/DataScope-Extension.md)                              |Edit-Media                                    |
|[Deconvolve](docs/Deconvolve-Extension.md)                            |Join-Media                                    |
|[DirectShow](docs/DirectShow-Extension.md)                            |Send-Media,Show-Media,Receive-Media           |
|[DrawSubtitle](docs/DrawSubtitle-Extension.md)                        |Edit-Media,Convert-Media                      |
|[DrawText](docs/DrawText-Extension.md)                                |Show-Media,Edit-Media                         |
|[Echo](docs/Echo-Extension.md)                                        |Show-Media,Edit-Media                         |
|[EdgeDetect](docs/EdgeDetect-Extension.md)                            |Show-Media,Edit-Media                         |
|[Emboss](docs/Emboss-Extension.md)                                    |Edit-Media                                    |
|[Erosion](docs/Erosion-Extension.md)                                  |Show-Media,Edit-Media                         |
|[Exposure](docs/Exposure-Extension.md)                                |Show-Media,Edit-Media                         |
|[FadeIn](docs/FadeIn-Extension.md)                                    |Edit-Media                                    |
|[FillBorder](docs/FillBorder-Extension.md)                            |Show-Media,Edit-Media                         |
|[FilterInput](docs/FilterInput-Extension.md)                          |Get-FFMpeg                                    |
|[FiniteEqualizer](docs/FiniteEqualizer-Extension.md)                  |Show-Media,Edit-Media                         |
|[Flanger](docs/Flanger-Extension.md)                                  |Show-Media,Edit-Media                         |
|[FlipHorizontal](docs/FlipHorizontal-Extension.md)                    |Show-Media,Edit-Media                         |
|[FlipVertical](docs/FlipVertical-Extension.md)                        |Show-Media,Edit-Media                         |
|[FrameBuffer](docs/FrameBuffer-Extension.md)                          |Send-Media,Show-Media,Receive-Media           |
|[FrameStep](docs/FrameStep-Extension.md)                              |Show-Media,Edit-Media                         |
|[GifPalette](docs/GifPalette-Extension.md)                            |Convert-Media                                 |
|[Histogram](docs/Histogram-Extension.md)                              |Show-Media,Edit-Media                         |
|[Hue](docs/Hue-Extension.md)                                          |Show-Media,Edit-Media                         |
|[Hysteresis](docs/Hysteresis-Extension.md)                            |Join-Media                                    |
|[LagFun](docs/LagFun-Extension.md)                                    |Show-Media,Edit-Media                         |
|[Life](docs/Life-Extension.md)                                        |New-Media,Show-Media                          |
|[LimitPixel](docs/LimitPixel-Extension.md)                            |Show-Media,Edit-Media                         |
|[ListFilters](docs/ListFilters-Extension.md)                          |Get-FFMpeg                                    |
|[ListProtocols](docs/ListProtocols-Extension.md)                      |Get-FFMpeg                                    |
|[Mandelbrot](docs/Mandelbrot-Extension.md)                            |New-Media,Show-Media                          |
|[MedianPixel](docs/MedianPixel-Extension.md)                          |Show-Media,Edit-Media                         |
|[Mirror](docs/Mirror-Extension.md)                                    |Show-Media,Edit-Media                         |
|[MixAudio](docs/MixAudio-Extension.md)                                |Join-Media                                    |
|[MixVideo](docs/MixVideo-Extension.md)                                |Join-Media                                    |
|[Monochrome](docs/Monochrome-Extension.md)                            |Edit-Media                                    |
|[NoAudio](docs/NoAudio-Extension.md)                                  |Split-Media                                   |
|[NoLogo](docs/NoLogo-Extension.md)                                    |Show-Media,Edit-Media                         |
|[Overlay](docs/Overlay-Extension.md)                                  |Join-Media                                    |
|[Phaser](docs/Phaser-Extension.md)                                    |Show-Media,Edit-Media                         |
|[PitchFactor](docs/PitchFactor-Extension.md)                          |Show-Media,Edit-Media                         |
|[Pixelate](docs/Pixelate-Extension.md)                                |Edit-Media                                    |
|[Playlist](docs/Playlist-Extension.md)                                |Join-Media                                    |
|[Pulsator](docs/Pulsator-Extension.md)                                |Show-Media,Edit-Media                         |
|[RandomizeFrame](docs/RandomizeFrame-Extension.md)                    |Show-Media,Edit-Media                         |
|[Rate](docs/Rate-Extension.md)                                        |Show-Media,Edit-Media                         |
|[Resize](docs/Resize-Extension.md)                                    |Show-Media,Convert-Media,Edit-Media           |
|[ReverseAudio](docs/ReverseAudio-Extension.md)                        |Edit-Media                                    |
|[ReverseVideo](docs/ReverseVideo-Extension.md)                        |Edit-Media                                    |
|[Rotate](docs/Rotate-Extension.md)                                    |Show-Media,Convert-Media,Edit-Media           |
|[Scale](docs/Scale-Extension.md)                                      |Show-Media,Edit-Media                         |
|[ScrollVideo](docs/ScrollVideo-Extension.md)                          |Show-Media,Edit-Media                         |
|[Sepia](docs/Sepia-Extension.md)                                      |Edit-Media                                    |
|[ShowFrequency](docs/ShowFrequency-Extension.md)                      |New-Media,Show-Media,Edit-Media               |
|[ShowScale](docs/ShowScale-Extension.md)                              |New-Media,Show-Media,Edit-Media               |
|[ShowSpectrum](docs/ShowSpectrum-Extension.md)                        |New-Media,Show-Media,Edit-Media               |
|[ShowVectorScope](docs/ShowVectorScope-Extension.md)                  |New-Media,Show-Media,Edit-Media               |
|[ShowVolume](docs/ShowVolume-Extension.md)                            |New-Media,Show-Media,Edit-Media               |
|[ShowWaveform](docs/ShowWaveform-Extension.md)                        |New-Media,Show-Media,Edit-Media               |
|[ShuffleFrames](docs/ShuffleFrames-Extension.md)                      |Edit-Media                                    |
|[Sierpinski](docs/Sierpinski-Extension.md)                            |New-Media,Show-Media                          |
|[SilenceDetect](docs/SilenceDetect-Extension.md)                      |Get-Media                                     |
|[SilenceRemove](docs/SilenceRemove-Extension.md)                      |Edit-Media                                    |
|[Sine](docs/Sine-Extension.md)                                        |New-Media                                     |
|[Skew](docs/Skew-Extension.md)                                        |Show-Media,Edit-Media                         |
|[SubFrequencyCut](docs/SubFrequencyCut-Extension.md)                  |Show-Media,Edit-Media                         |
|[Subtitler](docs/Subtitler-Extension.md)                              |New-Media                                     |
|[SuperEqualizer](docs/SuperEqualizer-Extension.md)                    |Show-Media,Edit-Media                         |
|[SuperFrequencyCut](docs/SuperFrequencyCut-Extension.md)              |Show-Media,Edit-Media                         |
|[Tempo](docs/Tempo-Extension.md)                                      |Show-Media,Edit-Media                         |
|[TestSource](docs/TestSource-Extension.md)                            |New-Media,Show-Media                          |
|[Tile](docs/Tile-Extension.md)                                        |Edit-Media                                    |
|[TimeMix](docs/TimeMix-Extension.md)                                  |Show-Media,Edit-Media                         |
|[Tremolo](docs/Tremolo-Extension.md)                                  |Show-Media,Edit-Media                         |
|[Vibrato](docs/Vibrato-Extension.md)                                  |Show-Media,Edit-Media                         |
|[VideoExpression](docs/VideoExpression-Extension.md)                  |Show-Media,Edit-Media                         |
|[VideoForLinux](docs/VideoForLinux-Extension.md)                      |Send-Media,Show-Media,Receive-Media           |
|[Vignette](docs/Vignette-Extension.md)                                |Show-Media,Edit-Media                         |
|[VolumeLevel](docs/VolumeLevel-Extension.md)                          |Get-Media                                     |
|[Watermark](docs/Watermark-Extension.md)                              |Edit-Media                                    |
|[YouTubeDL](docs/YouTubeDL-Extension.md)                              |Get-Media                                     |
|[ZoomPan](docs/ZoomPan-Extension.md)                                  |Show-Media,Edit-Media                         |



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





