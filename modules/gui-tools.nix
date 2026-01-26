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

      # kicad # 6.0.9 # Commit Hash: 2c2f1519b511fd0302ac49f8d4aeb4c252195216
      # Open Source
      element-desktop
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      saleae-logic-2
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [ ];

  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      "git.alwaysSignOff" = true;
      "markdown-preview-github-styles.darkTheme" = "light";
    };
  };
}
