{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      # Messaging apps
      telegram-desktop
      # signal-desktop # Not available on Mac
      discord

      chatgpt

      # steam  # Not available on Mac
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      # whatsapp-for-mac  # SSL certificate issue with download
    ];

  # Git configuration (shared across all systems)
  programs.git = {
    extraConfig = {
      user = {
        name = "Scott Gibb";
        email = "smgibb@yahoo.com";
      };
    };
  };
}
