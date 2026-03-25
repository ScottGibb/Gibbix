{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust tools
    rustup
    espup
    cargo-generate
    cargo-msrv
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
    prettier


    #Docker
    hadolint
    yamllint

    #Markdown
    markdownlint-cli2

    #Shell
    shellcheck

    # Writing Tools
    typst
  ];

}
