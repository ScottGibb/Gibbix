# Gibbix - Personal Nix Home Manager Configuration

[![Nix Build Test](https://github.com/ScottGibb/Gibbix/actions/workflows/nix-build-test.yaml/badge.svg)](https://github.com/ScottGibb/Gibbix/actions/workflows/nix-build-test.yaml)
[![Flake Check](https://github.com/ScottGibb/Gibbix/actions/workflows/test.yaml/badge.svg)](https://github.com/ScottGibb/Gibbix/actions/workflows/test.yaml)
[![MegaLinter](https://github.com/ScottGibb/Gibbix/actions/workflows/mega-linter.yaml/badge.svg)](https://github.com/ScottGibb/Gibbix/actions/workflows/mega-linter.yaml)

A comprehensive, cross-platform Nix Home Manager configuration for managing development environments across macOS and Linux systems.

## 📋 Table of Contents

- [Overview](#overview)
- [Supported Systems](#supported-systems)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Repository Structure](#repository-structure)
- [Usage](#usage)
- [Adding a New Host](#adding-a-new-host)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🎯 Overview

Gibbix is a flake-based Home Manager configuration that provides:

- **Declarative environment management** - Version control your entire development setup
- **Cross-platform consistency** - Same tools and configurations across macOS and Linux
- **Modular design** - Easy to customize and extend for different use cases
- **Reproducible builds** - Deterministic package management with Nix flakes

## 🖥️ Supported Systems

This configuration supports five different host systems:

| Host | System | Architecture | Profile |
|------|--------|--------------|---------|
| `work-mac` | macOS | Apple Silicon (aarch64) | Work |
| `work-linux` | Linux | ARM64 (aarch64) | Work |
| `personal-mac` | macOS | Apple Silicon (aarch64) | Personal |
| `nas` | Linux | x86_64 | Personal |
| `pi` | Linux | ARM64 (aarch64) | Personal |

## 📦 Prerequisites

Before using this configuration, ensure you have:

1. **Nix Package Manager** (with flakes enabled)
2. **Home Manager** (installed via this configuration)
3. **Git** (for cloning the repository)

### Installing Nix

#### macOS / Linux (Multi-user installation)

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

#### Enable Flakes

Add the following to `~/.config/nix/nix.conf` (create if it doesn't exist):

```conf
experimental-features = nix-command flakes
```

Or set it globally in `/etc/nix/nix.conf`:

```conf
experimental-features = nix-command flakes
```

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/ScottGibb/Gibbix.git ~/.config/home-manager
cd ~/.config/home-manager
```

### 2. Choose Your Configuration

Select the appropriate configuration for your system:

#### Work Mac (Apple Silicon)

```bash
nix run home-manager/release-25.11 -- switch --flake ~/.config/home-manager#scogib01@work-mac
```

#### Work Linux (ARM64)

```bash
nix run home-manager/release-25.11 -- switch --flake ~/.config/home-manager#scott@work-linux
```

#### Personal Mac (Apple Silicon)

```bash
nix run home-manager/release-25.11 -- switch --flake ~/.config/home-manager#scottgibb@personal-mac
```

#### NAS (x86_64 Linux)

```bash
nix run home-manager/release-25.11 -- switch --flake ~/.config/home-manager#pi@nas
```

#### Raspberry Pi (ARM64 Linux)

```bash
nix run home-manager/release-25.11 -- switch --flake ~/.config/home-manager#pi@pi
```

### 3. Apply Changes (After First Installation)

Once Home Manager is installed, you can apply future changes with:

```bash
home-manager switch --flake ~/.config/home-manager#<your-config>
```

Or use the shorthand if you're in the directory:

```bash
home-manager switch
```

## 📁 Repository Structure

```
.
├── flake.nix              # Main flake configuration with all outputs
├── flake.lock             # Locked dependency versions
├── home.nix               # Base Home Manager configuration
├── hosts/                 # Host-specific configurations
│   ├── work-mac.nix       # Work MacBook (Apple Silicon)
│   ├── work-linux.nix     # Work Linux machine (ARM64)
│   ├── personal-mac.nix   # Personal MacBook (Apple Silicon)
│   ├── nas.nix            # NAS server (x86_64)
│   └── pi.nix             # Raspberry Pi (ARM64)
└── modules/               # Modular configuration components
    ├── git.nix            # Git configuration
    ├── terminal.nix       # Fish shell and Starship prompt
    ├── tools.nix          # CLI tools (bat, ripgrep, etc.)
    ├── gui-tools.nix      # GUI applications (VSCode, browsers, etc.)
    ├── languages.nix      # Programming language toolchains
    ├── personal.nix       # Personal profile settings
    └── work.nix           # Work profile settings
```

### Module Breakdown

- **`flake.nix`** - Defines all Home Manager configurations and outputs
- **`home.nix`** - Base configuration imported by all hosts
- **`hosts/`** - System-specific settings (username, home directory, packages)
- **`modules/`** - Reusable configuration modules for specific purposes

## 🔧 Usage

### Updating Packages

Update flake inputs (nixpkgs, home-manager):

```bash
nix flake update
home-manager switch
```

### Checking Configuration

Validate your configuration without applying:

```bash
nix flake check
```

### Formatting Nix Files

Format all `.nix` files using the configured formatter:

```bash
nix fmt
```

### Cleaning Up

Remove old generations to free up disk space:

```bash
home-manager expire-generations "-30 days"
nix-collect-garbage -d
```

### Viewing Installed Packages

List all packages installed by Home Manager:

```bash
home-manager packages
```

## ➕ Adding a New Host

To add a new host configuration:

1. **Create a host file** in `hosts/`:

```nix
# hosts/new-host.nix
{ pkgs, lib, ... }:

{
  home.username = "yourusername";
  home.homeDirectory = "/home/yourusername";  # or /Users/yourusername on macOS

  home.packages = with pkgs; [
    # Host-specific packages
  ];
}
```

2. **Add the configuration to `flake.nix`**:

```nix
"yourusername@new-host" = mkHomeConfiguration "x86_64-linux" [
  ./home.nix
  ./modules/personal.nix  # or ./modules/work.nix
  ./hosts/new-host.nix
];
```

3. **Apply the configuration**:

```bash
home-manager switch --flake ~/.config/home-manager#yourusername@new-host
```

## 🔍 Troubleshooting

### "experimental-features" Error

If you see `error: experimental Nix feature 'flakes' is disabled`:

1. Add to `~/.config/nix/nix.conf`:

   ```conf
   experimental-features = nix-command flakes
   ```

2. Restart your terminal or run:

   ```bash
   source /etc/bashrc  # or /etc/zshrc
   ```

### "collision between" Error

If you get package collision errors:

1. Check for duplicate packages in your configuration
2. Use `lib.mkForce` to override conflicting options
3. Review your `home.packages` lists for duplicates

### Build Failures

If a build fails:

1. Check the error message carefully
2. Ensure you're on a supported system architecture
3. Try updating inputs: `nix flake update`
4. Check GitHub Actions for known issues

### File Already Exists

If Home Manager complains about existing files:

1. Backup your existing dotfiles
2. Remove conflicting files
3. Run `home-manager switch` again

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes using [conventional commits](https://www.conventionalcommits.org/)
4. Push to your branch
5. Open a Pull Request

### Conventional Commits

This project uses conventional commits:

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Test additions or modifications
- `ci:` - CI/CD changes

### Code Quality

- All Nix files are formatted with `nixfmt-rfc-style`
- Run `nix flake check` before submitting PRs
- CI runs on all pull requests

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [Nix](https://nixos.org/) - The purely functional package manager
- [Home Manager](https://github.com/nix-community/home-manager) - Declarative dotfile management
- [nixpkgs](https://github.com/NixOS/nixpkgs) - The Nix package repository

