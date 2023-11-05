{pkgs, config, ...}:{
  imports = [
    ./rofi/rofi.nix
    ./kitty.nix
    ./swayosd.nix
    ./waybar.nix
    ./playerctl.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    swaynotificationcenter
    hyprpicker
    cool-retro-term
    wtype
  ];
  home.sessionVariables = {
    TERMINAL = "${config.programs.kitty.package}/bin/kitty";
  };
}
