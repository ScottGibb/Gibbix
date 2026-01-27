{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.username = "scogib01";
  home.homeDirectory = "/home/scogib01";

  home.packages = with pkgs; [
    # Work-specific tools can be added here
  ];

  programs.fish = {
    enable = true;

    shellAliases = lib.mkAfter {
      "kas-tmux-shell" = "command kas shell --command 'exec tmux new -A -s NixShell'";
    }
    interactiveShellInit = lib.mkAfter ''
      # Nix (multi-user) environment
      if test -f /etc/profile.d/nix.fish
        source /etc/profile.d/nix.fish
      end
    '';

    shellInit = lib.mkAfter ''
        set -x NETRC_FILE ${config.home.homeDirectory}/.netrc

      # Efficient Yocto Builds
      umask 002

      # set -gx DL_DIR /usr/local/share/downloads # optional, see note below
      set -gx SSTATE_DIR /usr/local/share/sstate-cache
      set -gx BB_NUMBER_THREADS 16
      set -gx PARALLEL_MAKE "-j 16"

      set -x SHELL ${config.home.homeDirectory}/.nix-profile/bin/fish
    '';
  };
}
