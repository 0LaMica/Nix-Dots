{config, ...}:{
    wayland.windowManager.hyprland = {
      settings = {

        windowrulev2 = [
          #Task manager-like window for system monitoring 
          "workspace special:usage,class:(kitty),title:(Performance)"
          "center 1,class:(kitty),title:(Performance)"
          "workspace special:taskmgr,class:(mission-center)"

          "workspace name:F5,class:(kitty),title:(Anime)"
          "workspace name:F6,class:(kitty),title:(Music)"

          "workspace name:F11,class:(kitty),title:(Files)"
          "workspace name:F12,class:(cool-retro-term),title:(Clock)"
          "fullscreen,class:(cool-retro-term),title:(Clock)"
  
        ];
        windowrule = [
          "workspace name:F1,^(firefox)$"
          "workspace name:F2,^(obisidian)$"
          "workspace name:F3,^(libreoffice)$"
          "workspace name:F4,^(org.gnome.Nautilus)$"
          "workspace name:F8,^(Spotify)$"
          "workspace name:F7,^(FreeTube)$"

          "workspace name:F9,^(io.gitlab.news_flash.NewsFlash)$"
          "workspace name:F10,^(evince)$"
        ];
        workspace = [
          "name:1, persistent:true"
          "name:F1, default:true, persistent:true"
          "name:F9, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F10, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F11, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F12, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        ];
      };
    };
  }
##workspace guidelines
#1-9 anything(mostly terminals)
#F1-F4 Productivity i.e obisidian, libreoffice, firefox
#F5-F8 Media i.e ani-cli, freetube, cmus, spotify
#F9-F12 Anything else i.e clock screensaver, newsflash, evince