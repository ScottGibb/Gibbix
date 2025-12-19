{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Work-specific tools
    # Add work-specific packages here
  ];
  home.username = "scogib01";
  home.homeDirectory = "/Users/scogib01";
}

