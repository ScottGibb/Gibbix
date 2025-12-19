{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust tools
    rustup
    cargo-generate
    esp-generate

    # Python tools
    uv
    ruff

    # Go tools
    go

    # Blogs
    hugo

    # Web development
    nodejs
    bun

    # Writing Tools
    typst
  ];

}
