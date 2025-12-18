{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Work-specific tools
    # Add work-specific packages here
  ];

  # Work-specific configurations
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
