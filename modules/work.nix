{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    codex
    gcab
    mtools
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
