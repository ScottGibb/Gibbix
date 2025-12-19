{ pkgs, ... }:

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

      # For working with FTDI devices
      libftdi
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      libftdi1
    ];

  home.sessionPath = [
    "${pkgs.uutils-coreutils-noprefix}/bin"
  ];
}
