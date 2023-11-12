{config, pkgs, ...}:{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      ignore-empty-password = true;
      font = "Jetbrains Mono Nerd Font";
      clock = true;
      timestr = "%R";
      datestr= "%a, %e of %B";
      screenshots =  true;
      fade-in = 0.2;

      effect-blur = "20x2";
      effect-scale = 0.3;
      indicator = true;
      indicator-radius = 240;
      indicator-thickness = 20;
      indicator-caps-lock =  true;

      key-hl-color = "880033";

      separator-color =  "00000000";

      inside-color = "00000099";
      inside-clear-color = "ffd20400";
      inside-caps-lock-color = "009ddc00";
      inside-ver-color = "d9d8d800";
      inside-wrong-color = "ee2e2400";

      ring-color = "231f20D9";
      ring-clear-color = "231f20D9";
      ring-caps-lock-color = "231f20D9";
      ring-ver-color = "231f20D9";
      ring-wrong-color = "231f20D9";

      line-color = "00000000";
      line-clear-color = "ffd204FF";
      line-caps-lock-color = "009ddcFF";
      line-ver-color = "d9d8d8FF";  
      line-wrong-color = "ee2e24FF";

      text-clear-color = "ffd20400";
      text-ver-color = "d9d8d800";
      text-wrong-color = "ee2e2400";

      bs-hl-color = "ee2e24FF";
      caps-lock-key-hl-color  = "ffd204FF";
      caps-lock-bs-hl-color = "ee2e24FF";
      disable-caps-lock-text = true;
      text-caps-lock-color = "009ddc";
    };
  };
  home.packages = with pkgs;
  let
    wallpaper = ;
  in [
    (pkgs.writeShellScriptBin "lock-screen" ''
      swaylock -fF
    '';)
  ];
}