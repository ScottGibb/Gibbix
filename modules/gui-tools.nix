{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      # IDES and Editors
      # arduino-ide # Not supported on mac
      obsidian

      # Diagrams/ Drawing
      gimp2
      drawio

      # Video / Music
      vlc-bin
      # obs-studio # Not available on MacOS
      # spotify # Hash mismatch - upstream binary changed
      # jellyfin-media-player - Not Secure

      # CAD/ECAD Apps
      # kicad # Marked as Broken
      # prusaslicer # Doesn't exist
      # cura # Linux Only
      # preform # Doesn't exist

      # Logic Analyser
      # saleae-logic-2
      pulseview
      
      # Browser
      google-chrome


      # Misc
      # lmstudio # Marked as broken in nixpkgs
    ]

    ++ lib.optionals pkgs.stdenv.isLinux [
      # angryipscanner
      # saleae-logic-2
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
    ];

  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      # Git sign-off commits
      "git.alwaysSignOff" = true;
    };
  };
}
