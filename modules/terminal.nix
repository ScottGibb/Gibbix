{ pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx EDITOR nvim
      set -gx VISUAL nvim
    '';
    interactiveShellInit = ''
      # Initialize starship
      if type -q starship
        starship init fish | source
      end
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
