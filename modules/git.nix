{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      core = {
        editor = "nvim";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      "line-numbers" = true;
      navigate = true;
      "syntax-theme" = "Nord";
    };
  };

  home.packages = with pkgs; [
    git-absorb
    lazygit
    git-statuses
  ];

}
