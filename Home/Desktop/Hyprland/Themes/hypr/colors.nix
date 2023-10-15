{config, lib, ...}:{
  home.file.".config/hypr/colors".text = ''
    $rosewaterAlpha = f5e0dc
$flamingoAlpha  = f2cdcd
$pinkAlpha      = f5c2e7
$mauveAlpha     = cba6f7
$redAlpha       = f38ba8
$maroonAlpha    = eba0ac
$peachAlpha     = fab387
$yellowAlpha    = f9e2af
$greenAlpha     = a6e3a1
$tealAlpha      = 94e2d5
$skyAlpha       = 89dceb
$sapphireAlpha  = 74c7ec
$blueAlpha      = 89b4fa
$lavenderAlpha  = b4befe

$textAlpha      = cdd6f4
$subtext1Alpha  = bac2de
$subtext0Alpha  = a6adc8

$overlay2Alpha  = 9399b2
$overlay1Alpha  = 7f849c
$overlay0Alpha  = 6c7086

$surface2Alpha  = 585b70
$surface1Alpha  = 45475a
$surface0Alpha  = 313244

$baseAlpha      = 1e1e2e
$mantleAlpha    = 181825
$crustAlpha     = 11111b

$rosewater = 0xfff5e0dc
$flamingo  = 0xfff2cdcd
$pink      = 0xfff5c2e7
$mauve     = 0xffcba6f7
$red       = 0xfff38ba8
$maroon    = 0xffeba0ac
$peach     = 0xfffab387
$yellow    = 0xfff9e2af
$green     = 0xffa6e3a1
$teal      = 0xff94e2d5
$sky       = 0xff89dceb
$sapphire  = 0xff74c7ec
$blue      = 0xff89b4fa
$lavender  = 0xffb4befe

$text      = 0xffcdd6f4
$subtext1  = 0xffbac2de
$subtext0  = 0xffa6adc8

$overlay2  = 0xff9399b2
$overlay1  = 0xff7f849c
$overlay0  = 0xff6c7086

$surface2  = 0xff585b70
$surface1  = 0xff45475a
$surface0  = 0xff313244

$base      = 0xff1e1e2e
$mantle    = 0xff181825
$crust     = 0xff11111b
  '';
  home.file.".config/hypr/colors.conf".text = ''
  general {
    col.active_border = $sapphire $crust
    col.inactive_border = $crustAlpha
    col.group_border_active = $red $violet 
    col.group_border = $rosewater
  }
  '';
}
