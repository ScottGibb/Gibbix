{ pkgs, lib, ... }:

{
  home.username = "scott";
  home.homeDirectory = "/home/scott";

  home.packages = with pkgs; [
    # Work-specific tools can be added here
  ];
}
