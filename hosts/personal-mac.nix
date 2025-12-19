{ pkgs, lib, ... }:

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

  # Create Directories using .keep files
  home.file."Projects/.keep".text = "";
  home.file."Obsidian/.keep".text = "";

  # Clone git repository on first run only
  home.activation.cloneObsidianRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -d "$HOME/Obsidian/Gibb-Knowledge-Base/.git" ]; then
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone -b main git@github.com:ScottGibb/Gibb-Knowledge-Base.git "$HOME/Obsidian/Gibb-Knowledge-Base"
    fi
  '';
}
