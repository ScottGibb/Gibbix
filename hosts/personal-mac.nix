{ pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "scottgibb";
  home.homeDirectory = "/Users/scottgibb";

  home.packages = with pkgs; [
    # Personal development tools
    tailscale
  ];

  # Create project directories
  home.file."Projects/.keep".text = "";
  home.file."Obsidian/.keep".text = "";

  # Clone Obsidian knowledge base repository on first activation
  home.activation.cloneObsidianRepo = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/Obsidian/Gibb-Knowledge-Base/.git" ]; then
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone -b main git@github.com:ScottGibb/Gibb-Knowledge-Base.git "$HOME/Obsidian/Gibb-Knowledge-Base"
    fi
  '';
}
