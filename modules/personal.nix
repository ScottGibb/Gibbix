{ pkgs, ... }:

{
  imports = [
    ./networking.nix
  ];

  home.packages = with pkgs; [
  ];

}
