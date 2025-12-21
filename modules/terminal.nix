{ pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Initialize starship
      starship init fish | source
    '';
    shellInit = ''
      set -gx EDITOR nano
    '';
    # Enable shell completions
    shellAbbrs = {
      # Git abbreviations
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline";

      # Nix abbreviations
      nr = "nix run";
      nb = "nix build";
      nf = "nix flake";
      nfu = "nix flake update";
      nfc = "nix flake check";

      # Home Manager abbreviations
      hm = "home-manager";
      hms = "home-manager switch";
      hmg = "home-manager generations";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # Configure starship prompt
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      nix_shell = {
        format = "via [$symbol$state]($style) ";
        symbol = "❄️ ";
      };
    };
  };
}
