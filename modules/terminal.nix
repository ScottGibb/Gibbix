{ pkgs, lib, ... }:

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
    settings = {
      # Configure starship prompt
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
