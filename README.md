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


|DisplayName                                                           |Synopsis                              |Extends                                       |
|----------------------------------------------------------------------|--------------------------------------|----------------------------------------------|
|[AlbumArt](docs/AlbumArt-Extension.md)                                |Sets album artwork                    |Set-Media                                     |
|[AmplifyPixel](docs/AmplifyPixel-Extension.md)                        |AmplifyPixel extension                |Edit-Media,Show-Media                         |
|[AudioCrusher](docs/AudioCrusher-Extension.md)                        |Audio Crusher                         |Edit-Media,Show-Media                         |
|[AudioExpression](docs/AudioExpression-Extension.md)                  |Evaluates Audio Expressions           |Show-Media,Edit-Media,New-Media               |
|[AudioFrequencyExpression](docs/AudioFrequencyExpression-Extension.md)|Apply expressions to audio frequencies|Edit-Media,Show-Media                         |
|[AudioGain](docs/AudioGain-Extension.md)                              |Increases audio volume                |Edit-Media,Show-Media                         |
|[BilateralSmooth](docs/BilateralSmooth-Extension.md)                  |Bilateral Smooth                      |Edit-Media,Show-Media                         |
|[BlackDetect](docs/BlackDetect-Extension.md)                          |Detect black periods in a video.      |Get-Media                                     |
|[BlackFrame](docs/BlackFrame-Extension.md)                            |Detects black frames.                 |Get-Media                                     |
|[BlendFrame](docs/BlendFrame-Extension.md)                            |BlendFrame Extension                  |Edit-Media,Show-Media                         |
|[BlendVideo](docs/BlendVideo-Extension.md)                            |BlendVideo Extension                  |Join-Media                                    |
|[Blur](docs/Blur-Extension.md)                                        |Blurs Video                           |Edit-Media,Show-Media                         |
|[CaptureDevice](docs/CaptureDevice-Extension.md)                      |Gets capture devices                  |Get-FFMpeg                                    |
|[Chorus](docs/Chorus-Extension.md)                                    |chorus                                |Edit-Media,Show-Media                         |
|[Codecs](docs/Codecs-Extension.md)                                    |Lists codecs                          |Get-FFMpeg                                    |
|[ColorContrast](docs/ColorContrast-Extension.md)                      |ColorContrast Extension               |Edit-Media,Show-Media                         |
|[ColorHold](docs/ColorHold-Extension.md)                              |ColorHold Extension                   |Edit-Media,Show-Media                         |
|[Colorize](docs/Colorize-Extension.md)                                |Colorize a video stream               |Edit-Media,Show-Media                         |
|[ColorScope](docs/ColorScope-Extension.md)                            |Colorscope extension                  |Edit-Media,Show-Media                         |
|[ColorSource](docs/ColorSource-Extension.md)                          |Generates a color                     |New-Media,Show-Media                          |
|[Convolve](docs/Convolve-Extension.md)                                |convolve                              |Join-Media                                    |
|[Crop](docs/Crop-Extension.md)                                        |Crop Extension                        |Show-Media,Receive-Media,Edit-Media,Send-Media|
|[CropDetect](docs/CropDetect-Extension.md)                            |Auto-detect the crop size.            |Get-Media                                     |
|[DataScope](docs/DataScope-Extension.md)                              |Datascope effect                      |Edit-Media                                    |
|[Deconvolve](docs/Deconvolve-Extension.md)                            |deconvolve                            |Join-Media                                    |
|[DirectShow](docs/DirectShow-Extension.md)                            |DirectShow Extension                  |Show-Media,Receive-Media,Send-Media           |
|[DrawSubtitle](docs/DrawSubtitle-Extension.md)                        |Draw subtitles on top of input video  |Edit-Media,Convert-Media                      |
|[DrawText](docs/DrawText-Extension.md)                                |Draws Text on Video                   |Edit-Media,Show-Media                         |
|[Echo](docs/Echo-Extension.md)                                        |Adds echoes to audio                  |Edit-Media,Show-Media                         |
|[EdgeDetect](docs/EdgeDetect-Extension.md)                            |EdgeDetect Extension                  |Edit-Media,Show-Media                         |
|[Emboss](docs/Emboss-Extension.md)                                    |Embosses video or images              |Edit-Media                                    |
|[Exposure](docs/Exposure-Extension.md)                                |Exposure Extension                    |Edit-Media,Show-Media                         |
|[FadeIn](docs/FadeIn-Extension.md)                                    |Fades in video                        |Edit-Media                                    |
|[FillBorder](docs/FillBorder-Extension.md)                            |Fill Borders.                         |Edit-Media,Show-Media                         |
|[FilterInput](docs/FilterInput-Extension.md)                          |Gets filter details                   |Get-FFMpeg                                    |
|[Flanger](docs/Flanger-Extension.md)                                  |Audio Flanger.                        |Edit-Media,Show-Media                         |
|[FlipHorizontal](docs/FlipHorizontal-Extension.md)                    |Flips video horizontally              |Edit-Media,Show-Media                         |
|[FlipVertical](docs/FlipVertical-Extension.md)                        |Flips video vertically                |Edit-Media,Show-Media                         |
|[FrameBuffer](docs/FrameBuffer-Extension.md)                          |FrameBuffer Extension                 |Show-Media,Receive-Media,Send-Media           |
|[FrameStep](docs/FrameStep-Extension.md)                              |FrameStep Effect                      |Edit-Media,Show-Media                         |
|[Histogram](docs/Histogram-Extension.md)                              |Histogram Extension                   |Edit-Media,Show-Media                         |
|[Hue](docs/Hue-Extension.md)                                          |Hue Extension                         |Edit-Media,Show-Media                         |
|[Hysteresis](docs/Hysteresis-Extension.md)                            |Hysteresis                            |Join-Media                                    |
|[LagFun](docs/LagFun-Extension.md)                                    |Slowly update darker pixels.          |Edit-Media,Show-Media                         |
|[Life](docs/Life-Extension.md)                                        |Generates life                        |New-Media,Show-Media                          |
|[LimitPixel](docs/LimitPixel-Extension.md)                            |Limits Pixel values                   |Edit-Media,Show-Media                         |
|[ListFilters](docs/ListFilters-Extension.md)                          |Lists filters                         |Get-FFMpeg                                    |
|[ListProtocols](docs/ListProtocols-Extension.md)                      |Lists protocols                       |Get-FFMpeg                                    |
|[Mandelbrot](docs/Mandelbrot-Extension.md)                            |Generates fractals                    |New-Media,Show-Media                          |
|[MedianPixel](docs/MedianPixel-Extension.md)                          |Picks median pixels                   |Edit-Media,Show-Media                         |
|[Mirror](docs/Mirror-Extension.md)                                    |Mirror Extension                      |Edit-Media,Show-Media                         |
|[MixAudio](docs/MixAudio-Extension.md)                                |Mix Audio                             |Join-Media                                    |
|[Monochrome](docs/Monochrome-Extension.md)                            |Make video monochrome                 |Edit-Media                                    |
|[NoAudio](docs/NoAudio-Extension.md)                                  |Removes Audio                         |Split-Media                                   |
|[Overlay](docs/Overlay-Extension.md)                                  |overlay                               |Join-Media                                    |
|[Phaser](docs/Phaser-Extension.md)                                    |Audio Phaser                          |Edit-Media,Show-Media                         |
|[PitchFactor](docs/PitchFactor-Extension.md)                          |Adjust Pitch by a factor              |Edit-Media,Show-Media                         |
|[Pixelate](docs/Pixelate-Extension.md)                                |Pixelate effect                       |Edit-Media                                    |
|[Playlist](docs/Playlist-Extension.md)                                |Creates a playlist                    |Join-Media                                    |
|[Pulsator](docs/Pulsator-Extension.md)                                |Pulsator Effect                       |Edit-Media,Show-Media                         |
|[RandomizeFrame](docs/RandomizeFrame-Extension.md)                    |RandomizeFrame extensions             |Edit-Media,Show-Media                         |
|[Rate](docs/Rate-Extension.md)                                        |Adjusts the rate of media.            |Edit-Media,Show-Media                         |
|[Resize](docs/Resize-Extension.md)                                    |Resizes a video                       |Show-Media,Edit-Media,Convert-Media           |
|[ReverseAudio](docs/ReverseAudio-Extension.md)                        |Reverses audio                        |Edit-Media                                    |
|[ReverseVideo](docs/ReverseVideo-Extension.md)                        |Reverses video                        |Edit-Media                                    |
|[Rotate](docs/Rotate-Extension.md)                                    |Rotates a video                       |Show-Media,Edit-Media,Convert-Media           |
|[Scale](docs/Scale-Extension.md)                                      |Scales video.                         |Edit-Media,Show-Media                         |
|[ScrollVideo](docs/ScrollVideo-Extension.md)                          |Scrolls video                         |Edit-Media,Show-Media                         |
|[Sepia](docs/Sepia-Extension.md)                                      |Applies a Sepia Filter                |Edit-Media                                    |
|[ShowFrequency](docs/ShowFrequency-Extension.md)                      |Show Frequencies                      |Show-Media,Edit-Media,New-Media               |
|[ShowScale](docs/ShowScale-Extension.md)                              |Show the tonal scale of the audio     |Show-Media,Edit-Media,New-Media               |
|[ShowSpectrum](docs/ShowSpectrum-Extension.md)                        |Shows the audio spectrum              |Show-Media,Edit-Media,New-Media               |
|[ShowVectorScope](docs/ShowVectorScope-Extension.md)                  |Shows a Vector Scope of the Audio     |Show-Media,Edit-Media,New-Media               |
|[ShowVolume](docs/ShowVolume-Extension.md)                            |Shows the volume of an audio stream.  |Show-Media,Edit-Media,New-Media               |
|[ShowWaveform](docs/ShowWaveform-Extension.md)                        |Shows audio waveform.                 |Show-Media,Edit-Media,New-Media               |
|[ShuffleFrames](docs/ShuffleFrames-Extension.md)                      |Shuffles frames in video              |Edit-Media                                    |
|[Sierpinski](docs/Sierpinski-Extension.md)                            |Generates a Sierpinski fractal        |New-Media,Show-Media                          |
|[SilenceDetect](docs/SilenceDetect-Extension.md)                      |Detects silence in an audio stream    |Get-Media                                     |
|[SilenceRemove](docs/SilenceRemove-Extension.md)                      |Detects silence in an audio stream    |Edit-Media                                    |
|[Sine](docs/Sine-Extension.md)                                        |Generates a sine wave                 |New-Media                                     |
|[Skew](docs/Skew-Extension.md)                                        |Skew Extension                        |Edit-Media,Show-Media                         |
|[SubFrequencyCut](docs/SubFrequencyCut-Extension.md)                  |Cut subwoofer frequencies             |Edit-Media,Show-Media                         |
|[Subtitler](docs/Subtitler-Extension.md)                              |Creates subtitles.                    |New-Media                                     |
|[SuperEqualizer](docs/SuperEqualizer-Extension.md)                    |Audio 18 band Superequalizer          |Edit-Media,Show-Media                         |
|[SuperFrequencyCut](docs/SuperFrequencyCut-Extension.md)              |Cut super frequencies.                |Edit-Media,Show-Media                         |
|[Tempo](docs/Tempo-Extension.md)                                      |Adjust audio tempo.                   |Edit-Media,Show-Media                         |
|[TestSource](docs/TestSource-Extension.md)                            |Generates test sources                |New-Media,Show-Media                          |
|[Tile](docs/Tile-Extension.md)                                        |Tile Extension                        |Edit-Media                                    |
|[TimeMix](docs/TimeMix-Extension.md)                                  |Mix successive video frames.          |Edit-Media,Show-Media                         |
|[Tremolo](docs/Tremolo-Extension.md)                                  |Tremolo effect                        |Edit-Media,Show-Media                         |
|[Vibrato](docs/Vibrato-Extension.md)                                  |Vibrato effect                        |Edit-Media,Show-Media                         |
|[VideoExpression](docs/VideoExpression-Extension.md)                  |Evaluates Video Expressions           |Edit-Media,Show-Media                         |
|[VideoForLinux](docs/VideoForLinux-Extension.md)                      |VideoForLinux Extension               |Show-Media,Receive-Media,Send-Media           |
|[Vignette](docs/Vignette-Extension.md)                                |Applies a vignette filter             |Edit-Media,Show-Media                         |
|[VolumeLevel](docs/VolumeLevel-Extension.md)                          |Gets VolumeLevels                     |Get-Media                                     |
|[Watermark](docs/Watermark-Extension.md)                              |Watermarks a video                    |Edit-Media                                    |
|[YouTubeDL](docs/YouTubeDL-Extension.md)                              |Youtube Downloader                    |Get-Media                                     |



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





