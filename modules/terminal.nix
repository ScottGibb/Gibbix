{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Initialize starship
      starship init fish | source
    '';
    shellInit = ''
      set -gx EDITOR nano
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  
}

