---
title: Fun with -VideoExpression
tags:
  - VideoExpression
  - FFMpeg
  - Filtering
  - Edit-Media
  - Show-Media
---

[RoughDraft 0.3.5](https://github.com/StartAutomating/RoughDraft/releases/tag/v0.3.5) added a bunch of new filters.

Two of them are, to put it mildly, overpowered:

* -AudioExpression allows you to generate or modify audio using an expression
* -VideoExpression allows you to modify video using an expression

Today we'll take a look at -VideoExpression.

-VideoExpression exposes the [geq filter](https://ffmpeg.org/ffmpeg-filters.html#geq).

It's currently available on Edit-Media and Show-Media.

Feel free to ready FFMpeg's full documentation on the feature.  It's a little dry, but basically, it boils down to:

* You can change any pixel in any image OR
* You can change any color component of any pixel in any image.

Like I said, overpowered ;-).

So what can we do with this?

Well, if we start simple, we can flip a video's contents.

~~~PowerShell

New-Media -TestSource testsrc2 -Duration '00:00:10' -Resolution 640x480 -OutputPath .\TestSource-640x480-10s.mp4 

Edit-Media -InputPath .\TestSource-640x480-10s.mp4 -VideoExpression 'p(W-X,Y)' -OutputPath .\TestSource-640x480-10s-Flipped.mp4

~~~

---

> Original Video

<video style='width:90%;margin-left:auto;margin-right:auto' controls="controls">
    <source src="/Assets/TestSource-640x480-10s.mp4" type="video/mp4">
</video>

> Flipped Video

<video style='width:90%;margin-left:auto;margin-right:auto' controls="controls">
    <source src="/Assets/TestSource-640x480-10s-Flipped.mp4" type="video/mp4">
</video>

---

Of course we can already flip videos using -FlipHorizontal or -FlipVertical.

What we cannot do is make the video "wave"

To do this, we need a more complicated expression:


~~~PowerShell
<#
Good news!  FFMpeg Expressions don't mind whitespace.
Unfortunately, they don't have comments, so we'll cover what this expression is doing below:
#>
Edit-Media -InputPath .\TestSource-640x480-10s.mp4 -OutputPath .\TestSource-640x480-10s-Wavy.mp4 -VideoExpression @'
p(
    X + (sin(2*T*PI/E) * ((hypot(X/W,Y/H) - 0.5)) * W/2),
    Y + (cos(2*T*PI/E) * ((hypot(X/W,Y/H) - 0.5)) * H/2)
)
'@
~~~

This expression will run pixel by pixel.

`p(expression, expression)` will give us the value of a pixel at a given point.

* We're using `sin` and `cos` to make the `X`/`Y` values shift over time `T` (specifically by multiply T times 2 times the ratio of `PI` over `E`).
* Then we're taking the base X or Y coordinate and determining the hypotenuse of X/Y as a value between 0 and 1, and shifting that value down a half point (thus making our result be between -0.5 and 0.5)
* When we're multiplying the changed amount by half the width or height.

> Wavy Video

<video style='width:90%;margin-left:auto;margin-right:auto' controls="controls">
    <source src="/Assets/TestSource-640x480-10s-Wavy.mp4" type="video/mp4">
</video>

This is just the most brief taste of what you can do with VideoExpression.

Hope this Helps