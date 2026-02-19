{
  pkgs,
  pkgsUnstable,
  lib,
  ...
}:

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
      lsd
      dust
      just
      gnumake
      ripgrep
      procs

      yazi
      nano
      delta

      lazydocker

      # For working with FTDI devices
      libftdi
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      libftdi1
      pkgsUnstable.cpx
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
