{
  pkgs,
  pkgsUnstable,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    git
    ripgrep
    fd
    gcc
    nodejs
    python3
  ];

  programs.vim = {
    enable = true;
    defaultEditor = false;
    extraConfig = ''
      set number
      set relativenumber
      set expandtab
      set shiftwidth=4
      set tabstop=4
      set smartindent
      set ignorecase
      set smartcase
      set incsearch
      set clipboard=unnamedplus
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = false;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "LazyVim";
      repo = "starter";
      rev = "main"; # we will pin this properly in a second
      sha256 = "QrpnlDD4r1X4C8PqBhQ+S3ar5C+qDrU1Jm/lPqyMIFM=";
    };
    force = true;
  };
}
