{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      # IDES and Editors
      obsidian

      # Diagrams/ Drawing
      gimp2
      drawio

      # Video / Music
      # vlc-bin-universal # Universal build is brooken

      # Logic Analyser
      pulseview

      # Browser
      google-chrome

      # Open Source 
      element-desktop
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [ ]
    ++ lib.optionals pkgs.stdenv.isDarwin [ ];

  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      # Git sign-off commits
      "git.alwaysSignOff" = true;
    };
  };
}
