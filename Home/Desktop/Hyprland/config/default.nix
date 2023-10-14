{config, pkgs, lib, ...}: {
  
  imports = [
    ./binds.nix
    ./tty-init.nix
    ./fonts.nix
  ];
  wayland.windowManager.hyprland = {
      enable = true;
      systemd = {
        enable = true;
      };
      extraConfig = ''
        source = extra.conf
        exec-once = waybar
      '';
      settings = {
        general = let
          base = "111413";
          green = "51a281";
          base2 = "111113";
          mantle = "182825";
          crust = "1e2e2e";
        in  {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2.7;
          cursor_inactive_timeout = 4;
          "col.active_border" = "0xff${green} 0xff${base2}";
          "col.inactive_border" = "0xff${base}";
          # "col.group_border_active" = "0xff${config.colorscheme.colors.base0B}";
          # "col.group_border" = "0xff${config.colorscheme.colors.base04}";
          layout = "master";
        };
        input = {
          repeat_delay = 300;
          repeat_rate = 50;
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
          };
        };
        master = {
          new_is_master = false;
          mfact = 0.6;
        };
        decoration = {
          rounding = 5;
          blur = {
            enabled = true;
            size = 1;
            passes = 1;
            ignore_opacity = true;
          };
          drop_shadow = true;
          shadow_range = 7;
          shadow_render_power = 6;
 #         col.shadow = "0xff${green}";
        };
        animations = {
          enabled = true;
          bezier = [
            "linear, 0.0, 0.0, 1.0, 1.0"
            "def, 0.05, 0.9, 0.1, 1.05"
            "myBezier, 0.1, 0.6, 0.1, 1.05"
            "easeOutBack, 0.34, 1.56, 0.64, 1"
            "easeInOutBack, 0.68, -0.6, 0.32, 1.6"
            "easeInExpo, 0.7, 0, 0.84, 0"
            "easeOutCubic, 0.33, 1, 0.68, 1"
            "easeInOutQuad, 0.45, 0, 0.55, 1"
            "easeInOutCirc, 0.85, 0, 0.15, 1"
          ];
          animation = [
            "workspaces, 1, 8, myBezier, slidefadevert"
            "borderangle, 1, 100, linear, loop"
            "windowsOut, 1, 5, easeInOutBack, popin 80%"
            "windowsIn, 1 ,8, myBezier, popin 20%"
            "border ,1, 10, easeOutBack"
            "fade, 1, 7, myBezier"
          ];
        };
        exec = 
        let
          wallpaper = "~/Wallpapers/images/4k-keyboard.jpg";
        in [
          "${pkgs.swww}/bin/swww init"
          "${pkgs.swww}/bin/swww img ${wallpaper}"
          "${pkgs.swaynotificationcenter}/bin/swaync"
        ];
        # exec-once = [
        #   "waybar"
        # ];
        bind = let
        swayosd = "${pkgs.swayosd}/bin/swayosd";
        rofi = "${config.programs.rofi.package}/bin/rofi";
        rofi-bluetooth = "${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";
        playerctl = "${config.services.playerctld.package}/bin/playerctl";
        playerctld = "${config.services.playerctld.package}/bin/playerctld";
        terminal = config.home.sessionVariables.TERMINAL;
        browser = "${config.programs.firefox.package}/bin/firefox";
        file-manager = "${pkgs.gnome3.nautilus}/bin/nautilus";
      in [
        #Basic binds
        "SUPER,space,exec, ${rofi} -show drun"
        "SUPER, Return, exec, ${terminal}"
        "SUPER, e, exec, ${file-manager}"
        "SUPER, b, exec, ${rofi-bluetooth}"
        # Brightness control (only works if the system has lightd)
        ",XF86MonBrightnessUp, exec, light -A 10"
        ",XF86MonBrightnessDown, exec, light -U 10"
        # Volume
        ",XF86AudioRaiseVolume, exec, ${swayosd} --output-volume=raise 5"
        ",XF86AudioLowerVolume, exec, ${swayosd} --output-volume=lower 5"
        ",XF86AudioMute, exec, ${swayosd} --output-volume=mute-toggle"

        # Screenshotting
        # " Print exec grim -s${"
      ] ++

      (lib.optionals config.services.playerctld.enable [
        # Media control
        ",XF86AudioNext,exec,${playerctl} next"
        ",XF86AudioPrev,exec,${playerctl} previous"
        ",XF86AudioPlay,exec,${playerctl} play-pause"
        ",XF86AudioStop,exec,${playerctl} stop"
        "ALT,XF86AudioNext,exec,${playerctld} shift"
        "ALT,XF86AudioPrev,exec,${playerctld} unshift"
        "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
      ]);
    };
  }; 
}
