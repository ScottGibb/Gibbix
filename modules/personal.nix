{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    lib.optionals pkgs.stdenv.isDarwin [
    ];

  # Git configuration (shared across all systems)
  programs.git = {
    settings = {
      user = {
        name = "Scott Gibb";
        email = "smgibb@yahoo.com";
      };
    };
  };
}
