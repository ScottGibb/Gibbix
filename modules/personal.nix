{ pkgs, ... }:

{

  home.packages = with pkgs; [
  ];

  # Git configuration (shared across all systems)
  programs.git = {
    enable = true;
    settings = {
      core = {
        editor = "nano";
      };
      user = {
        name = "Scott Gibb";
        email = "smgibb@yahoo.com";
      };
    };
  };
}
