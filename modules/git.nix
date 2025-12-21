{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      core = {
        editor = "nano";
      };
    };
  };
}
