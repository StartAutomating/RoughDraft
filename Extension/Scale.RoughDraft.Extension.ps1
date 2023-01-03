
<#
.Synopsis
    Scales video.
.Description
    Scale the input video size and/or convert the image format.
.Link
    https://ffmpeg.org/ffmpeg-filters.html#scale-1
#>

[Management.Automation.Cmdlet('(?>Edit|Show)', 'Media')]

param(
    # Scale the input video size and/or convert the image format.
    [Parameter(Mandatory)]
    [switch]
    $Scale,
    # Output video width
    [Alias('scale_w','scale_width')]
    [string]
    $ScaleWidth,
    # Output video height
    [Alias('scale_h','scale_height')]
    [string]
    $ScaleHeight,
    
    # Flags to pass to libswscale.
    # See the [ffmpeg-scalar manual](https://ffmpeg.org/ffmpeg-scaler.html#sws_005fflags)
    [Alias('scale_flags')]
    [ValidateSet('fast_bilinear','bilinear','bicubic','experimental','neighbor','area',
        'bicublin','gauss','sinc','lanczos','spline','print_info','accurate_rnd',
        'full_chroma_int','full_chroma_inp','bitexact')]
    [string]
    $ScaleFlags,
    # Set interlacing
    # * 1 : forces interlaced aware scaling
    # * 0 : Do not apply interlaced scaling
    # * -1 : Select interlaced aware scaling depending on whether the source frames are flagged as interlaced or not.
    [Alias('scale_interl')]
    [int]
    $ScaleInterlacing,
    # set input YCbCr type 
    [Alias('scale_in_color_matrix')]
    [ValidateSet('auto','bt709','fcc','bt601','bt470','smpte170m','smpte240m', 'bt2020')]
    [string]
    $ScaleInColorMatrix,
    # set output YCbCr type
    [Alias('scale_out_color_matrix')]
    [ValidateSet('auto','bt709','fcc','bt601','bt470','smpte170m','smpte240m', 'bt2020')]
    [string]
    $ScaleOutColorMatrix,
    # set input color range 
    [Alias('scale_in_range')]
    [ValidateSet('auto','unknown','jpeg','full','pc','mpeg','limited','tv')]
    [string]
    $ScaleInRange,
    # set output color range 
    [Alias('scale_out_range')]
    [ValidateSet('auto','unknown','jpeg','full','pc','mpeg','limited','tv')]
    [string]
    $ScaleOutRange,
    # input vertical chroma position in luma grid/256 
    [Alias('scale_in_v_chr_pos')]
    [int]
    $ScaleInVerticalChromaPosition,
    # input horizontal chroma position in luma grid/256 
    [Alias('scale_in_h_chr_pos')]
    [int]
    $ScaleInHorizontalChromaPosition,
    # output vertical chroma position in luma grid/256 
    [Alias('scale_out_v_chr_pos')]
    [int]
    $ScaleOutVerticalChromaPosition,
    # output horizontal chroma position in luma grid/256 
    [Alias('scale_out_h_chr_pos')]
    [int]
    $ScaleOutHorizontalChromaPosition,
    # decrease or increase w/h if necessary to keep the original AR 
    [Alias('scale_force_original_aspect_ratio')]
    [validateset('disable','increase','decrease')]
    $ScaleForceOriginalAspectRatio,
    # Scaler param 0 
    [Alias('scale_param0')]
    [double]
    $ScaleParam0,
    # Scaler param 1 
    [Alias('scale_param1')]
    [double]
    $ScaleParam1,
    # set the number of slices 
    [Alias('scale_nb_slices')]
    [int]
    $ScaleSliceCount,
    # Specify when to evaluate expressions.  Either initially or every frame.
    [Alias('scale_eval')]
    [ValidateSet("init","frame")]
    $ScaleEval
)

$filterName = 'scale'
$myCmd = $MyInvocation.MyCommand
$filterArgs = @(
    foreach ($kv in $PSBoundParameters.GetEnumerator()) {
        $match=  
            foreach ($paramAlias in $myCmd.Parameters[$kv.Key].Aliases) {
                $m = [Regex]::Match($paramAlias, '_(?<p>.+)$')
                if ($m.Success) {
                    $m;break
                }
            }
        
        if ($match.Success) {
            $v = $kv.Value
            $p = $match.Value -replace '^_'
            if ($v -is [switch]) {
                $v = ($v -as [bool] -as [int]).ToString().ToLower()
            }
            if ($v -is [string] -and $myCmd.Parameters[$kv.Key].ValidateSet) {
                $v = $v.ToLower()
            }
            "$p='$($v)'"
        }
    }
) -join ':'
'-vf'


"$filterName=$filterArgs" -replace "=$"
 

