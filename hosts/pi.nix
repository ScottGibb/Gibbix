{ pkgs, ... }:

{
  home.username = "pi";
  home.homeDirectory = "/home/pi";

  home.packages = with pkgs; [
    # Raspberry Pi-specific tools can be added here
  ];
}
