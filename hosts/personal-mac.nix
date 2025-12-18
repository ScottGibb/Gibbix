{ pkgs, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "scottgibb";
  home.homeDirectory = "/Users/scottgibb";

  home.packages = with pkgs; [
    # Personal development tools
    # Add personal-specific packages here
    # blender
  ];

  # Personal-specific configurations

}
