{ pkgs, ... }:

{
  home.username = "pi";
  home.homeDirectory = "/home/pi";

  home.packages = with pkgs; [
    # NAS-specific tools can be added here
  ];
}
