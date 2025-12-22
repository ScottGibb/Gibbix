{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      core = {
        editor = "nano";
      };
    };
  };
}
