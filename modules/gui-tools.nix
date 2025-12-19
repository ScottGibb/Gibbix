{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      # IDES and Editors
      vscode
      obsidian

      # Diagrams
      drawio

      # Messaging apps
      telegram-desktop

      ## CAD/ECAD Apps
      # kicad
      # prusaslicer # Doesn't exist
      # cura # Linux Only
      # preform # Doesn't exist

    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # angryipscanner
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      # whatsapp-for-mac  # SSL certificate issue with download
    ];

}
