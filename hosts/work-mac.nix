{ pkgs, lib, ... }:

{
  home.username = "scogib01";
  home.homeDirectory = "/Users/scogib01";

  home.packages = with pkgs; [
    # Work-specific tools can be added here
  ];
}
