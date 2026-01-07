{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      uutils-coreutils-noprefix # Rust replacement for GNU coreutils (no prefix)
      bat
      bottom
      gping
      zellij
      fd
      dust
      just
      gnumake
      ripgrep
      procs

      yazi
      nano

      # For working with FTDI devices
      libftdi
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      libftdi1
    ];

  home.sessionPath = [
    "${pkgs.uutils-coreutils-noprefix}/bin"
  ];

  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "fish";
    };
  };
}
