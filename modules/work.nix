{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    codex
    gcab
    mtools
  ];

  programs.git = {
    settings = {
      user = {
        name = lib.mkForce "Scott Gibb";
        email = lib.mkForce "scott.gibb@arm.com";
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
