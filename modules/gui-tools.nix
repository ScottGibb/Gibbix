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
      vlc-bin

      # Logic Analyser
      pulseview

      # Browser
      google-chrome
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
