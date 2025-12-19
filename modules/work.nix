{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.git = {
    enable = true;
    settings = {
      core = {
        editor = "nano";
      };
      user = {
        name = lib.mkForce "Scott Gibb";
        email = lib.mkForce "scott.gibb@arm.com";
      };
    };
  };
}
