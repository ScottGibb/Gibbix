{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    codex
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
