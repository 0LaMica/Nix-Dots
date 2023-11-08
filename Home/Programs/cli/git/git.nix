#Git config
{config,pkgs,...}:{
  programs.git = {
    enable = true;
    userName = "0LaMica";
    userEmail = "mica.tui@proton.me";
    #Git aliases
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
      a = "add";
      p = "push";
      pu = "pull";
    };
  };
  home.packages = with pkgs; [
    gitui #Gitui for tui git management

      #Git scripts to make editing from any directory easier
      (pkgs.writeShellScriptBin "git-push" ''
         cd ~/Nix-Dots 
           git push 
      '')
      (pkgs.writeShellScriptBin "git-ui" ''
         cd ~/Nix-Dots
         gitui
     '')
      (pkgs.writeShellScriptBin "git-r" ''
         cd ~/Nix-Dots/ 
         ranger
     '')
  ];
}
