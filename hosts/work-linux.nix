{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Work-specific tools
    # Add work-specific packages here
  ];
  home.username = "scott";
  home.homeDirectory = "/home/scott";
  # Work-specific configurations
}
