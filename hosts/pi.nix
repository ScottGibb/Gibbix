{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Raspberry Pi-specific tools
  ];
  home.username = "pi";
  home.homeDirectory = "/home/pi";
  # Pi-specific configurations
}

