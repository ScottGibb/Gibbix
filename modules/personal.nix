{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      # Messaging apps
      telegram-desktop
      # signal-desktop # Not available on Mac
      discord

      # steam  # Not available on Mac
      # jellyfin-media-player # Broken on macOS - qtwebengine won't compile
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      # whatsapp-for-mac  # SSL certificate issue with download
      chatgpt # Not available on Linux
    ];

  # Git configuration (shared across all systems)
  programs.git = {
    settings = {
      user = {
        name = "Scott Gibb";
        email = "smgibb@yahoo.com";
      };
    };
  };
}
