{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    vscode
    obsidian
    # kicad
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    angryipscanner
  ];

}