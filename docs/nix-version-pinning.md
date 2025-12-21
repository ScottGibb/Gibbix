# Nix Version Pinning Strategy

This document describes how Gibbix manages Nix dependencies and versioning.

## Flake Inputs

Our configuration uses Nix flakes for dependency management, providing:

- **Reproducible builds** - `flake.lock` pins exact versions
- **Easy updates** - Update all or specific inputs with simple commands
- **Multiple channels** - Can track stable and unstable branches

### Current Input Strategy

```nix
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  home-manager = {
    url = "github:nix-community/home-manager/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

**Key Points:**

- We track the **25.11 stable release** of NixOS/nixpkgs
- Home Manager follows the **same release** for compatibility
- `inputs.nixpkgs.follows` ensures Home Manager uses our nixpkgs version

## Updating Dependencies

### Update All Inputs

Update all flake inputs to their latest versions:

```bash
nix flake update
```

This modifies `flake.lock` with new commit hashes.

### Update Specific Input

Update only nixpkgs:

```bash
nix flake lock --update-input nixpkgs
```

Update only home-manager:

```bash
nix flake lock --update-input home-manager
```

### Check Input Status

View current input information:

```bash
nix flake metadata
```

## Testing Updates

After updating inputs, always test your configuration:

```bash
# Check for evaluation errors
nix flake check

# Build your configuration without activating
nix build ".#homeConfigurations.<your-config>.activationPackage"

# If everything works, apply the changes
home-manager switch
```

## Best Practices

1. **Regular Updates** - Update monthly for security patches
2. **Lock File Management** - Commit `flake.lock` to version control
3. **Reproducibility** - Never use `nix-channel` with flakes
4. **Testing Strategy** - Test updates in CI before merging

## References

- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
