{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ ];

  programs.git = {
    extraConfig = {
      user = {
        name = lib.mkForce "Scott Gibb";
        email = lib.mkForce "scott.gibb@arm.com";
      };
    };
  };
}
