{config, pkgs,lib, ...}:
let
  style = "./Themes/Styles/type-1/style-6.rasi";
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
      rofi-top
      rofi-emoji
    ];
    font = "Jetbrains Mono Nerd Font 14";
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "${style}";
    extraConfig = {
      modes = ["drun" "run" "window" "files" "calc" "top"];
    };
  };
  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-power-menu
  ];
  home.file.".config/rofi/colors".source = config.lib.file.mkOutOfStoreSymlink ./Themes/colors;
  home.file.".config/rofi/Themes".source = config.lib.file.mkOutOfStoreSymlink ./Themes;
  home.file.".config/rofi/Scripts".source = config.lib.file.mkOutOfStoreSymlink ./Scripts;
}
