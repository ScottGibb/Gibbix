{ pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "scottgibb";
  home.homeDirectory = "/Users/scottgibb";

  home.packages = with pkgs; [
    # Personal development tools
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

programs.fish = {
  enable = true;
  shellInit = ''
    # Set SDK for Xcode toolchain so Rust/C can link system libs
    set -gx SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
    set -gx PATH /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin $PATH
  '';
};
}
