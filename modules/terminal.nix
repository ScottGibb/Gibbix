{ pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Initialize starship
      if type -q starship
        starship init fish | source
      end
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

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";
    customPaneNavigationAndResize = true;
    extraConfig = ''
      # Enable True color support
      set-option -sa terminal-overrides ",xterm:Tc"
    '';
  };

}
