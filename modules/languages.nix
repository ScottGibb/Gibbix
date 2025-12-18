{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust tools
    rustup

    # Python tools
    uv
    ruff
  ];

}