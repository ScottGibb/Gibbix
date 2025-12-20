{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    # gitui  # Build failing on aarch64-darwin
  ];

  programs.git = {
    enable = true;
    settings = {
      core = {
        editor = "nano";
      };
    };
  };
}
