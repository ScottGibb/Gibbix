{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Initialize starship
      starship init fish | source
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  
}
