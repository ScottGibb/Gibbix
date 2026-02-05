{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    codex
    guestfs-tools
    libguestfs-with-appliance
  ];

  programs.git = {
    settings = {
      user = {
        name = lib.mkForce "Scott Gibb";
        email = lib.mkForce "scott.gibb@arm.com";
      };
    };
  };
}
