{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # NAS-specific tools
  ];
  home.username = "pi";
  home.homeDirectory = "/home/pi";
  # NAS-specific configurations
}
