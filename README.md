RoughDraft a fun FFMpeg-based PowerShell Module for Multimedia.

It provides pipeline-aware functions to create, convert, query, and edit multimedia files.

RoughDraft is largely built atop of [FFMpeg](https://ffmpeg.org).

Here are some quick examples:


~~~PowerShell
Convert-Media .\Movie.mkv mp4 # Converts Movie.mkv to MP4

Convert-Media .\Movie.mp4 .\Soundtrack.mp3 # Converts an .mp4 file to an .mp3.

Get-Media .\Song.mp3 # Get media information and metadata about an mp3

Set-Media .\Song.mp3 -AlbumArt .\Cover.jpg # Sets the album art for a song.
~~~
