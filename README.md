# Gibbix

```fish
# Install Nix package manager
sh (curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | psub)
# Install Home Manager
nix-shell '<home-manager>' -A install
# Apply Home Manager configuration
home-manager switch
```# Gibbix
