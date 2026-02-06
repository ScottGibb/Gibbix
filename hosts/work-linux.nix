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
    guestfs-tools
  ];

  programs.fish = {
    enable = true;

    shellAliases = lib.mkAfter {
      "kas-tmux-shell" = "command kas shell --command 'exec tmux new -A -s NixShell'";
    };

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

      set -gx SSTATE_DIR /usr/local/share/sstate-cache
      set -gx BB_NUMBER_THREADS 16
      set -gx PARALLEL_MAKE "-j 16"

      set -gx EDITOR ${pkgs.nano}/bin/nano
      set -gx VISUAL ${pkgs.nano}/bin/nano

      set -x SHELL ${config.home.homeDirectory}/.nix-profile/bin/fish

      if test -f ${config.home.homeDirectory}/.env
        source ${config.home.homeDirectory}/.env
      end

      # Add local bin to PATH
      if not contains ${config.home.homeDirectory}/.local/bin $fish_user_paths
         set -gx PATH ${config.home.homeDirectory}/.local/bin $PATH
      end
    '';
  };
}
