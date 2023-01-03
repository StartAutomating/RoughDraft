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
|[AlbumArt](AlbumArt-Extension.md)                                |Sets album artwork                    |Set-Media                                     |
|[AmplifyPixel](AmplifyPixel-Extension.md)                        |AmplifyPixel extension                |Edit-Media,Show-Media                         |
|[AudioCrusher](AudioCrusher-Extension.md)                        |Audio Crusher                         |Edit-Media,Show-Media                         |
|[AudioExpression](AudioExpression-Extension.md)                  |Evaluates Audio Expressions           |Edit-Media,Show-Media,New-Media               |
|[AudioFrequencyExpression](AudioFrequencyExpression-Extension.md)|Apply expressions to audio frequencies|Edit-Media,Show-Media                         |
|[AudioGain](AudioGain-Extension.md)                              |Increases audio volume                |Edit-Media,Show-Media                         |
|[BilateralSmooth](BilateralSmooth-Extension.md)                  |Bilateral Smooth                      |Edit-Media,Show-Media                         |
|[BlackDetect](BlackDetect-Extension.md)                          |Detect black periods in a video.      |Get-Media                                     |
|[BlackFrame](BlackFrame-Extension.md)                            |Detects black frames.                 |Get-Media                                     |
|[BlendFrame](BlendFrame-Extension.md)                            |BlendFrame Extension                  |Edit-Media,Show-Media                         |
|[BlendVideo](BlendVideo-Extension.md)                            |BlendVideo Extension                  |Join-Media                                    |
|[Blur](Blur-Extension.md)                                        |Blurs Video                           |Edit-Media,Show-Media                         |
|[CaptureDevice](CaptureDevice-Extension.md)                      |Gets capture devices                  |Get-FFMpeg                                    |
|[Chorus](Chorus-Extension.md)                                    |chorus                                |Edit-Media,Show-Media                         |
|[Codecs](Codecs-Extension.md)                                    |Lists codecs                          |Get-FFMpeg                                    |
|[ColorContrast](ColorContrast-Extension.md)                      |ColorContrast Extension               |Edit-Media,Show-Media                         |
|[ColorHold](ColorHold-Extension.md)                              |ColorHold Extension                   |Edit-Media,Show-Media                         |
|[Colorize](Colorize-Extension.md)                                |Colorize a video stream               |Edit-Media,Show-Media                         |
|[ColorScope](ColorScope-Extension.md)                            |Colorscope extension                  |Edit-Media,Show-Media                         |
|[ColorSource](ColorSource-Extension.md)                          |Generates a color                     |New-Media,Show-Media                          |
|[Convolve](Convolve-Extension.md)                                |convolve                              |Join-Media                                    |
|[Crop](Crop-Extension.md)                                        |Crop Extension                        |Edit-Media,Receive-Media,Show-Media,Send-Media|
|[CropDetect](CropDetect-Extension.md)                            |Auto-detect the crop size.            |Get-Media                                     |
|[DataScope](DataScope-Extension.md)                              |Datascope effect                      |Edit-Media                                    |
|[Deconvolve](Deconvolve-Extension.md)                            |deconvolve                            |Join-Media                                    |
|[DirectShow](DirectShow-Extension.md)                            |DirectShow Extension                  |Receive-Media,Show-Media,Send-Media           |
|[DrawSubtitle](DrawSubtitle-Extension.md)                        |Draw subtitles on top of input video  |Edit-Media,Convert-Media                      |
|[DrawText](DrawText-Extension.md)                                |Draws Text on Video                   |Edit-Media,Show-Media                         |
|[Echo](Echo-Extension.md)                                        |Adds echoes to audio                  |Edit-Media,Show-Media                         |
|[EdgeDetect](EdgeDetect-Extension.md)                            |EdgeDetect Extension                  |Edit-Media,Show-Media                         |
|[Emboss](Emboss-Extension.md)                                    |Embosses video or images              |Edit-Media                                    |
|[Exposure](Exposure-Extension.md)                                |Exposure Extension                    |Edit-Media,Show-Media                         |
|[FadeIn](FadeIn-Extension.md)                                    |Fades in video                        |Edit-Media                                    |
|[FillBorder](FillBorder-Extension.md)                            |Fill Borders.                         |Edit-Media,Show-Media                         |
|[FilterInput](FilterInput-Extension.md)                          |Gets filter details                   |Get-FFMpeg                                    |
|[Flanger](Flanger-Extension.md)                                  |Audio Flanger.                        |Edit-Media,Show-Media                         |
|[FlipHorizontal](FlipHorizontal-Extension.md)                    |Flips video horizontally              |Edit-Media,Show-Media                         |
|[FlipVertical](FlipVertical-Extension.md)                        |Flips video vertically                |Edit-Media,Show-Media                         |
|[FrameBuffer](FrameBuffer-Extension.md)                          |FrameBuffer Extension                 |Receive-Media,Show-Media,Send-Media           |
|[FrameStep](FrameStep-Extension.md)                              |FrameStep Effect                      |Edit-Media,Show-Media                         |
|[Histogram](Histogram-Extension.md)                              |Histogram Extension                   |Edit-Media,Show-Media                         |
|[Hue](Hue-Extension.md)                                          |Hue Extension                         |Edit-Media,Show-Media                         |
|[Hysteresis](Hysteresis-Extension.md)                            |Hysteresis                            |Join-Media                                    |
|[LagFun](LagFun-Extension.md)                                    |Slowly update darker pixels.          |Edit-Media,Show-Media                         |
|[Life](Life-Extension.md)                                        |Generates life                        |New-Media,Show-Media                          |
|[LimitPixel](LimitPixel-Extension.md)                            |Limits Pixel values                   |Edit-Media,Show-Media                         |
|[ListFilters](ListFilters-Extension.md)                          |Lists filters                         |Get-FFMpeg                                    |
|[ListProtocols](ListProtocols-Extension.md)                      |Lists protocols                       |Get-FFMpeg                                    |
|[Mandelbrot](Mandelbrot-Extension.md)                            |Generates fractals                    |New-Media,Show-Media                          |
|[MedianPixel](MedianPixel-Extension.md)                          |Picks median pixels                   |Edit-Media,Show-Media                         |
|[Mirror](Mirror-Extension.md)                                    |Mirror Extension                      |Edit-Media,Show-Media                         |
|[MixAudio](MixAudio-Extension.md)                                |Mix Audio                             |Join-Media                                    |
|[Monochrome](Monochrome-Extension.md)                            |Make video monochrome                 |Edit-Media                                    |
|[NoAudio](NoAudio-Extension.md)                                  |Removes Audio                         |Split-Media                                   |
|[Overlay](Overlay-Extension.md)                                  |overlay                               |Join-Media                                    |
|[Phaser](Phaser-Extension.md)                                    |Audio Phaser                          |Edit-Media,Show-Media                         |
|[PitchFactor](PitchFactor-Extension.md)                          |Adjust Pitch by a factor              |Edit-Media,Show-Media                         |
|[Pixelate](Pixelate-Extension.md)                                |Pixelate effect                       |Edit-Media                                    |
|[Playlist](Playlist-Extension.md)                                |Creates a playlist                    |Join-Media                                    |
|[Pulsator](Pulsator-Extension.md)                                |Pulsator Effect                       |Edit-Media,Show-Media                         |
|[RandomizeFrame](RandomizeFrame-Extension.md)                    |RandomizeFrame extensions             |Edit-Media,Show-Media                         |
|[Rate](Rate-Extension.md)                                        |Adjusts the rate of media.            |Edit-Media,Show-Media                         |
|[Resize](Resize-Extension.md)                                    |Resizes a video                       |Convert-Media,Edit-Media,Show-Media           |
|[ReverseAudio](ReverseAudio-Extension.md)                        |Reverses audio                        |Edit-Media                                    |
|[ReverseVideo](ReverseVideo-Extension.md)                        |Reverses video                        |Edit-Media                                    |
|[Rotate](Rotate-Extension.md)                                    |Rotates a video                       |Convert-Media,Edit-Media,Show-Media           |
|[ScrollVideo](ScrollVideo-Extension.md)                          |Scrolls video                         |Edit-Media,Show-Media                         |
|[Sepia](Sepia-Extension.md)                                      |Applies a Sepia Filter                |Edit-Media                                    |
|[ShowFrequency](ShowFrequency-Extension.md)                      |Show Frequencies                      |Edit-Media,Show-Media,New-Media               |
|[ShowScale](ShowScale-Extension.md)                              |Show the tonal scale of the audio     |Edit-Media,Show-Media,New-Media               |
|[ShowSpectrum](ShowSpectrum-Extension.md)                        |Shows the audio spectrum              |Edit-Media,Show-Media,New-Media               |
|[ShowVectorScope](ShowVectorScope-Extension.md)                  |Shows a Vector Scope of the Audio     |Edit-Media,Show-Media,New-Media               |
|[ShowVolume](ShowVolume-Extension.md)                            |Shows the volume of an audio stream.  |Edit-Media,Show-Media,New-Media               |
|[ShowWaveform](ShowWaveform-Extension.md)                        |Shows audio waveform.                 |Edit-Media,Show-Media,New-Media               |
|[ShuffleFrames](ShuffleFrames-Extension.md)                      |Shuffles frames in video              |Edit-Media                                    |
|[Sierpinski](Sierpinski-Extension.md)                            |Generates a Sierpinski fractal        |New-Media,Show-Media                          |
|[SilenceDetect](SilenceDetect-Extension.md)                      |Detects silence in an audio stream    |Get-Media                                     |
|[SilenceRemove](SilenceRemove-Extension.md)                      |Detects silence in an audio stream    |Edit-Media                                    |
|[Sine](Sine-Extension.md)                                        |Generates a sine wave                 |New-Media                                     |
|[Skew](Skew-Extension.md)                                        |Skew Extension                        |Edit-Media,Show-Media                         |
|[SubFrequencyCut](SubFrequencyCut-Extension.md)                  |Cut subwoofer frequencies             |Edit-Media,Show-Media                         |
|[Subtitler](Subtitler-Extension.md)                              |Creates subtitles.                    |New-Media                                     |
|[SuperEqualizer](SuperEqualizer-Extension.md)                    |Audio 18 band Superequalizer          |Edit-Media,Show-Media                         |
|[SuperFrequencyCut](SuperFrequencyCut-Extension.md)              |Cut super frequencies.                |Edit-Media,Show-Media                         |
|[Tempo](Tempo-Extension.md)                                      |Adjust audio tempo.                   |Edit-Media,Show-Media                         |
|[TestSource](TestSource-Extension.md)                            |Generates test sources                |New-Media,Show-Media                          |
|[Tile](Tile-Extension.md)                                        |Tile Extension                        |Edit-Media                                    |
|[TimeMix](TimeMix-Extension.md)                                  |Mix successive video frames.          |Edit-Media,Show-Media                         |
|[Tremolo](Tremolo-Extension.md)                                  |Tremolo effect                        |Edit-Media,Show-Media                         |
|[Vibrato](Vibrato-Extension.md)                                  |Vibrato effect                        |Edit-Media,Show-Media                         |
|[VideoExpression](VideoExpression-Extension.md)                  |Evaluates Video Expressions           |Edit-Media,Show-Media                         |
|[VideoForLinux](VideoForLinux-Extension.md)                      |VideoForLinux Extension               |Receive-Media,Show-Media,Send-Media           |
|[Vignette](Vignette-Extension.md)                                |Applies a vignette filter             |Edit-Media,Show-Media                         |
|[VolumeLevel](VolumeLevel-Extension.md)                          |Gets VolumeLevels                     |Get-Media                                     |
|[Watermark](Watermark-Extension.md)                              |Watermarks a video                    |Edit-Media                                    |
|[YouTubeDL](YouTubeDL-Extension.md)                              |Youtube Downloader                    |Get-Media                                     |



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








