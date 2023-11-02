{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.Dribbblish;
      colorScheme = "lunar";

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplayMod
        # marketplace
        loopyLoop
        powerBar
        seekSong
        autoVolume
        historyShortcut
        copyToClipboard
        genre
        volumePercentage
        playNext
        savePlaylists
        adblock
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        # h2..
        lastfm
        playlistIcons
        goToSong
        listPlaylistsWithSong
      ];
      enabledCustomApps = with spicePkgs.apps; [
        new-releases
        marketplace
        localFiles
        lyrics-Plus
        
        # {
        #   name = "localFiles";
        #   src = localFilesSrc;
        #   appendName = false;
        # }
      ];
    };
    #Spotifd for spotify-tui
    services.spotifyd = {
      enable = true;
      settings = {
          global = {
              username = "31qfp7msrlxcryx2zwhoa2lbts5u";
          };
      };
    };
  home.packages = with pkgs; [
    spotify-tui
  ];
}
