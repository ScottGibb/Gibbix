{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.git = {
    settings = {
      user = {
        name = lib.mkForce "Scott Gibb";
        email = lib.mkForce "scott.gibb@arm.com";
      };
    }
    };
  };
