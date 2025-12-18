{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    bottom
    gping
    zellij
    fd
    dust
    just
    gnumake
  ];
}
