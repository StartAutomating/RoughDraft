<div align='center'>
<img src='Assets/RoughDraft.svg' />
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
|ConvertTo-Gif          |Converts video to high-quality GIFs|
|ConvertTo-Waveform     |Converts audio to visualizations   |
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


|DisplayName                                             |Synopsis                            |Extends                                       |
|--------------------------------------------------------|------------------------------------|----------------------------------------------|
|[AlbumArt](docs/AlbumArt-Extension.md)                  |Sets album artwork                  |Set-Media                                     |
|[AmplifyPixel](docs/AmplifyPixel-Extension.md)          |AmplifyPixel extension              |Show-Media,Edit-Media                         |
|[AudioCrusher](docs/AudioCrusher-Extension.md)          |Audio Crusher                       |Show-Media,Edit-Media                         |
|[AudioExpression](docs/AudioExpression-Extension.md)    |Evaluates Audio Expressions         |Show-Media,Edit-Media,New-Media               |
|[AudioGain](docs/AudioGain-Extension.md)                |Increases audio volume              |Show-Media,Edit-Media                         |
|[BilateralSmooth](docs/BilateralSmooth-Extension.md)    |Bilateral Smooth                    |Show-Media,Edit-Media                         |
|[BlackDetect](docs/BlackDetect-Extension.md)            |Detect black periods in a video.    |Get-Media                                     |
|[BlackFrame](docs/BlackFrame-Extension.md)              |Detects black frames.               |Get-Media                                     |
|[BlendFrame](docs/BlendFrame-Extension.md)              |BlendFrame Extension                |Show-Media,Edit-Media                         |
|[BlendVideo](docs/BlendVideo-Extension.md)              |BlendVideo Extension                |Join-Media                                    |
|[Blur](docs/Blur-Extension.md)                          |Blurs Video                         |Show-Media,Edit-Media                         |
|[CaptureDevice](docs/CaptureDevice-Extension.md)        |Gets capture devices                |Get-FFMpeg                                    |
|[Chorus](docs/Chorus-Extension.md)                      |chorus                              |Show-Media,Edit-Media                         |
|[Codecs](docs/Codecs-Extension.md)                      |Lists codecs                        |Get-FFMpeg                                    |
|[ColorContrast](docs/ColorContrast-Extension.md)        |ColorContrast Extension             |Show-Media,Edit-Media                         |
|[ColorHold](docs/ColorHold-Extension.md)                |ColorHold Extension                 |Show-Media,Edit-Media                         |
|[Colorize](docs/Colorize-Extension.md)                  |Colorize a video stream             |Show-Media,Edit-Media                         |
|[ColorScope](docs/ColorScope-Extension.md)              |Colorscope extension                |Show-Media,Edit-Media                         |
|[ColorSource](docs/ColorSource-Extension.md)            |Generates a color                   |Show-Media,New-Media                          |
|[Convolve](docs/Convolve-Extension.md)                  |convolve                            |Join-Media                                    |
|[Crop](docs/Crop-Extension.md)                          |Crop Extension                      |Receive-Media,Send-Media,Show-Media,Edit-Media|
|[CropDetect](docs/CropDetect-Extension.md)              |Auto-detect the crop size.          |Get-Media                                     |
|[DataScope](docs/DataScope-Extension.md)                |Datascope effect                    |Edit-Media                                    |
|[Deconvolve](docs/Deconvolve-Extension.md)              |deconvolve                          |Join-Media                                    |
|[DirectShow](docs/DirectShow-Extension.md)              |DirectShow Extension                |Receive-Media,Send-Media,Show-Media           |
|[DrawSubtitle](docs/DrawSubtitle-Extension.md)          |Draw subtitles on top of input video|Convert-Media,Edit-Media                      |
|[DrawText](docs/DrawText-Extension.md)                  |Draws Text on Video                 |Show-Media,Edit-Media                         |
|[Echo](docs/Echo-Extension.md)                          |Adds echoes to audio                |Show-Media,Edit-Media                         |
|[EdgeDetect](docs/EdgeDetect-Extension.md)              |EdgeDetect Extension                |Show-Media,Edit-Media                         |
|[Emboss](docs/Emboss-Extension.md)                      |Embosses video or images            |Edit-Media                                    |
|[Exposure](docs/Exposure-Extension.md)                  |Exposure Extension                  |Show-Media,Edit-Media                         |
|[FadeIn](docs/FadeIn-Extension.md)                      |Fades in video                      |Edit-Media                                    |
|[FillBorder](docs/FillBorder-Extension.md)              |Fill Borders.                       |Show-Media,Edit-Media                         |
|[FilterInput](docs/FilterInput-Extension.md)            |Gets filter details                 |Get-FFMpeg                                    |
|[Flanger](docs/Flanger-Extension.md)                    |Audio Flanger.                      |Show-Media,Edit-Media                         |
|[FlipHorizontal](docs/FlipHorizontal-Extension.md)      |Flips video horizontally            |Show-Media,Edit-Media                         |
|[FlipVertical](docs/FlipVertical-Extension.md)          |Flips video vertically              |Show-Media,Edit-Media                         |
|[FrameBuffer](docs/FrameBuffer-Extension.md)            |FrameBuffer Extension               |Receive-Media,Send-Media,Show-Media           |
|[FrameStep](docs/FrameStep-Extension.md)                |FrameStep Effect                    |Show-Media,Edit-Media                         |
|[Histogram](docs/Histogram-Extension.md)                |Histogram Extension                 |Show-Media,Edit-Media                         |
|[Hue](docs/Hue-Extension.md)                            |Hue Extension                       |Show-Media,Edit-Media                         |
|[Hysteresis](docs/Hysteresis-Extension.md)              |Hysteresis                          |Join-Media                                    |
|[LagFun](docs/LagFun-Extension.md)                      |Slowly update darker pixels.        |Show-Media,Edit-Media                         |
|[Life](docs/Life-Extension.md)                          |Generates life                      |Show-Media,New-Media                          |
|[LimitPixel](docs/LimitPixel-Extension.md)              |Limits Pixel values                 |Show-Media,Edit-Media                         |
|[ListFilters](docs/ListFilters-Extension.md)            |Lists filters                       |Get-FFMpeg                                    |
|[ListProtocols](docs/ListProtocols-Extension.md)        |Lists protocols                     |Get-FFMpeg                                    |
|[Mandelbrot](docs/Mandelbrot-Extension.md)              |Generates fractals                  |Show-Media,New-Media                          |
|[MedianPixel](docs/MedianPixel-Extension.md)            |Picks median pixels                 |Show-Media,Edit-Media                         |
|[Mirror](docs/Mirror-Extension.md)                      |Mirror Extension                    |Show-Media,Edit-Media                         |
|[MixAudio](docs/MixAudio-Extension.md)                  |Mix Audio                           |Join-Media                                    |
|[Monochrome](docs/Monochrome-Extension.md)              |Make video monochrome               |Edit-Media                                    |
|[NoAudio](docs/NoAudio-Extension.md)                    |Removes Audio                       |Split-Media                                   |
|[Overlay](docs/Overlay-Extension.md)                    |overlay                             |Join-Media                                    |
|[Phaser](docs/Phaser-Extension.md)                      |Audio Phaser                        |Show-Media,Edit-Media                         |
|[Pixelate](docs/Pixelate-Extension.md)                  |Pixelate effect                     |Edit-Media                                    |
|[Playlist](docs/Playlist-Extension.md)                  |Creates a playlist                  |Join-Media                                    |
|[Pulsator](docs/Pulsator-Extension.md)                  |Pulsator Effect                     |Show-Media,Edit-Media                         |
|[RandomizeFrame](docs/RandomizeFrame-Extension.md)      |RandomizeFrame extensions           |Show-Media,Edit-Media                         |
|[Rate](docs/Rate-Extension.md)                          |Adjusts the rate of media.          |Show-Media,Edit-Media                         |
|[Resize](docs/Resize-Extension.md)                      |Resizes a video                     |Show-Media,Convert-Media,Edit-Media           |
|[ReverseAudio](docs/ReverseAudio-Extension.md)          |Reverses audio                      |Edit-Media                                    |
|[ReverseVideo](docs/ReverseVideo-Extension.md)          |Reverses video                      |Edit-Media                                    |
|[Rotate](docs/Rotate-Extension.md)                      |Rotates a video                     |Show-Media,Convert-Media,Edit-Media           |
|[ScrollVideo](docs/ScrollVideo-Extension.md)            |Scrolls video                       |Show-Media,Edit-Media                         |
|[Sepia](docs/Sepia-Extension.md)                        |Applies a Sepia Filter              |Edit-Media                                    |
|[ShowFrequency](docs/ShowFrequency-Extension.md)        |Show Frequencies                    |Show-Media,Edit-Media,New-Media               |
|[ShowScale](docs/ShowScale-Extension.md)                |Show the tonal scale of the audio   |Show-Media,Edit-Media,New-Media               |
|[ShowSpectrum](docs/ShowSpectrum-Extension.md)          |Shows the audio spectrum            |Show-Media,Edit-Media,New-Media               |
|[ShowVectorScope](docs/ShowVectorScope-Extension.md)    |Shows a Vector Scope of the Audio   |Show-Media,Edit-Media,New-Media               |
|[ShowVolume](docs/ShowVolume-Extension.md)              |Shows the volume of an audio stream.|Show-Media,Edit-Media,New-Media               |
|[ShowWaveform](docs/ShowWaveform-Extension.md)          |Shows audio waveform.               |Show-Media,Edit-Media,New-Media               |
|[ShuffleFrames](docs/ShuffleFrames-Extension.md)        |Shuffles frames in video            |Edit-Media                                    |
|[Sierpinski](docs/Sierpinski-Extension.md)              |Generates a Sierpinski fractal      |Show-Media,New-Media                          |
|[SilenceDetect](docs/SilenceDetect-Extension.md)        |Detects silence in an audio stream  |Get-Media                                     |
|[SilenceRemove](docs/SilenceRemove-Extension.md)        |Detects silence in an audio stream  |Edit-Media                                    |
|[Sine](docs/Sine-Extension.md)                          |Generates a sine wave               |New-Media                                     |
|[Skew](docs/Skew-Extension.md)                          |Skew Extension                      |Show-Media,Edit-Media                         |
|[SubFrequencyCut](docs/SubFrequencyCut-Extension.md)    |Cut subwoofer frequencies           |Show-Media,Edit-Media                         |
|[Subtitler](docs/Subtitler-Extension.md)                |Creates subtitles.                  |New-Media                                     |
|[SuperEqualizer](docs/SuperEqualizer-Extension.md)      |Audio 18 band Superequalizer        |Show-Media,Edit-Media                         |
|[SuperFrequencyCut](docs/SuperFrequencyCut-Extension.md)|Cut super frequencies.              |Show-Media,Edit-Media                         |
|[TestSource](docs/TestSource-Extension.md)              |Generates test sources              |Show-Media,New-Media                          |
|[Tile](docs/Tile-Extension.md)                          |Tile Extension                      |Edit-Media                                    |
|[TimeMix](docs/TimeMix-Extension.md)                    |Mix successive video frames.        |Show-Media,Edit-Media                         |
|[Tremolo](docs/Tremolo-Extension.md)                    |Tremolo effect                      |Show-Media,Edit-Media                         |
|[Vibrato](docs/Vibrato-Extension.md)                    |Vibrato effect                      |Show-Media,Edit-Media                         |
|[VideoExpression](docs/VideoExpression-Extension.md)    |Evaluates Video Expressions         |Show-Media,Edit-Media                         |
|[VideoForLinux](docs/VideoForLinux-Extension.md)        |VideoForLinux Extension             |Receive-Media,Send-Media,Show-Media           |
|[Vignette](docs/Vignette-Extension.md)                  |Applies a vignette filter           |Show-Media,Edit-Media                         |
|[VolumeLevel](docs/VolumeLevel-Extension.md)            |Gets VolumeLevels                   |Get-Media                                     |
|[Watermark](docs/Watermark-Extension.md)                |Watermarks a video                  |Edit-Media                                    |
|[YouTubeDL](docs/YouTubeDL-Extension.md)                |Youtube Downloader                  |Get-Media                                     |



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





