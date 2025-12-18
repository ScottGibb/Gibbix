{ pkgs, ... }:

{
  home.packages = with pkgs; [
    uutils-coreutils-noprefix  # Rust replacement for GNU coreutils (no prefix)
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
  ];
  
  home.sessionPath = [
    "${pkgs.uutils-coreutils-noprefix}/bin"
  ];
}
